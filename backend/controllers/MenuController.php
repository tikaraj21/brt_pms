<?php
/**
 * @link      http://www.writesdown.com/
 * @copyright Copyright (c) 2015 WritesDown
 * @license   http://www.writesdown.com/license/
 */

namespace backend\controllers;

use common\components\Json;
use common\models\Menu;
use common\models\MenuItem;
use common\models\Post;
use common\models\PostType;
use common\models\Taxonomy;
use common\models\Term;
use Yii;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\NotFoundHttpException;

/**
 * MenuController, controlling the actions for Menu and MenuItem model.
 *
 * @author  Agiel K. Saputra <13nightevil@gmail.com>
 * @since   0.1.0
 */
class MenuController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['index', 'update', 'create', 'delete', 'create-menu-item', 'delete-menu-item'],
                        'allow'   => true,
                        'roles'   => ['administrator'],
                    ],
                ],
            ],
            'verbs'  => [
                'class'   => VerbFilter::className(),
                'actions' => [
                    'delete'           => ['post'],
                    'update'           => ['post'],
                    'create-menu-item' => ['post'],
                    'delete-menu-item' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Generates menu page consists of CRUD Menu and MenuItem model.
     *
     * @param null $id
     *
     * @return mixed
     */
    public function actionIndex($id = null)
    {
        $model = new Menu();
        // List all post types
        $postTypes = PostType::find()->where(['post_type_smb' => 1])->all();
        // List all taxonomies
        $taxonomies = Taxonomy::find()->where(['taxonomy_smb' => 1])->all();

        // Get available menu
        if ($availableMenu = ArrayHelper::map(Menu::find()->all(), 'id', 'menu_title')) {
            if ($id === null && $availableMenu) {
                reset($availableMenu);
                $id = key($availableMenu);
            }
            $selectedMenu = $this->findModel($id);
        }
        return $this->render('index', [
            'model'         => $model,
            'availableMenu' => $availableMenu,
            'selectedMenu'  => isset($selectedMenu) ? $selectedMenu : null,
            'postTypes'     => $postTypes,
            'taxonomies'    => $taxonomies,
        ]);
    }

    /**
     * Creates a new Menu model.
     * If creation is successful, the browser will be redirected to the 'index' page.
     *
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Menu();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index', 'id' => $model->id]);
        }

        return $this->redirect(['index']);
    }

    /**
     * Updates an existing Menu model.
     * If update is successful, the browser will be redirected to the 'view' page.
     *
     * @param integer $id
     *
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            if ($menuOrder = Yii::$app->request->post('MenuOrder')) {
                $this->saveMenuItem(Json::decode($menuOrder));
            }
        }

        Yii::$app->getSession()->setFlash('success', Yii::t('writesdown', 'Menu successfully saved.'));

        return $this->redirect(['/menu/index', 'id' => $id]);
    }

    /**
     * Deletes an existing Menu model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     *
     * @return mixed
     * @throws NotFoundHttpException
     * @throws \Exception
     */
    public function actionDelete()
    {
        $id = Yii::$app->request->post('id');
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Create MenuItem models.
     *
     * @param int $id
     */
    public function actionCreateMenuItem($id)
    {
        if (Yii::$app->request->post('type') === 'link') {
            $model = new MenuItem();
            $model->menu_id = $id;
            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                echo $this->renderPartial('_render-item', ['item' => $model, 'wrapper' => 'true']);
            }
        } elseif (Yii::$app->request->post('type') === 'post' && $postIds = Yii::$app->request->post('postIds')) {
            foreach ($postIds as $postId) {
                if ($postModel = $this->findPost($postId)) {
                    $model = new MenuItem();
                    $model->setAttributes([
                        'menu_id'    => $id,
                        'menu_label' => $postModel->post_title,
                        'menu_url'   => $postModel->getUrl(),
                    ]);
                    if ($model->save()) {
                        echo $this->renderPartial('_render-item', ['item' => $model, 'wrapper' => 'true']);
                    }
                }
            }
        } elseif (Yii::$app->request->post('type') === 'taxonomy' && $termIds = Yii::$app->request->post('termIds')) {
            foreach ($termIds as $termId) {
                if ($termModel = $this->findTerm($termId)) {
                    $model = new MenuItem();
                    $model->setAttributes([
                        'menu_id'    => $id,
                        'menu_label' => $termModel->term_name,
                        'menu_url'   => $termModel->getUrl(),
                    ]);
                    if ($model->save()) {
                        echo $this->renderPartial('_render-item', ['item' => $model, 'wrapper' => 'true']);
                    }
                }
            }
        }
    }

    /**
     * Delete an existing MenuItem model via AJAX request.
     *
     * @throws NotFoundHttpException
     * @throws \Exception
     */
    public function actionDeleteMenuItem()
    {
        /* @var $child \common\models\MenuItem */
        if ($id = Yii::$app->request->post('id')) {
            $model = $this->findMenuItem($id);
            if ($model && $model->delete()) {
                $children = MenuItem::find()->where(['menu_parent' => $model->id])->all();
                foreach ($children as $child) {
                    $child->updateAttributes(['menu_parent' => $model->menu_parent]);
                }
            } else{
                throw new NotFoundHttpException(Yii::t('writesdown', 'The requested page does not exist.'));
            }
        }
    }

    /**
     * Save menu item recursively based on parent and child.
     *
     * @param array $menuOrder
     * @param int   $menuParent
     */
    protected function saveMenuItem($menuOrder, $menuParent = 0)
    {
        foreach ($menuOrder as $key => $order) {
            $menuItem = Yii::$app->request->post('MenuItem')[$order['id']];
            if ($model = $this->findMenuItem($order['id'])) {
                $model->setAttributes($menuItem);
                $model->setAttributes([
                    'menu_parent' => $menuParent,
                    'menu_order'  => $key,
                ]);
                if ($model->save()) {
                    if (isset($order['items'])) {
                        $this->saveMenuItem($order['items'], $model->id);
                    }
                }
            }
        }
    }

    /**
     * Finds the Menu model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     *
     * @param integer $id
     *
     * @return Menu the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Menu::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('writesdown', 'The requested page does not exist.'));
    }

    /**
     * Finds the Post model based on its primary key value.
     * If the model is not found, it will return false.
     *
     * @param integer $id
     *
     * @return bool|MenuItem
     */
    protected function findMenuItem($id)
    {
        if (($model = MenuItem::findOne($id)) !== null) {
            return $model;
        }

        return false;
    }

    /**
     * Finds the Post model based on its primary key value.
     * If the model is not found, it will return false.
     *
     * @param integer $id
     *
     * @return bool|Post
     */
    protected function findPost($id)
    {
        if (($model = Post::findOne($id)) !== null) {
            return $model;
        }

        return false;
    }

    /**
     * Finds the Term model based on its primary key value.
     * If the model is not found, it will return false.
     *
     * @param integer $id
     *
     * @return bool|Term
     */
    protected function findTerm($id)
    {
        if (($model = Term::findOne($id)) !== null) {
            return $model;
        }

        return false;
    }
}
