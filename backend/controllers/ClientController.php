<?php

namespace backend\controllers;

use Yii;
use app\models\Client;
use app\models\ClientSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use yii\web\ForbiddenHttpException;
/**
 * ClientController implements the CRUD actions for Client model.
 */
class ClientController extends Controller
{
	
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
    	if (Yii::$app->user->can('superadmin')
    			|| (Yii::$app->user->can('administrator')
    					&& !Yii::$app->authManager->checkAccess($model->id, 'administrator'))
    	) {
        return [
		    'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['index', 'create','view', 'update', 'delete', 'bulk-action','up','down'],
                        'allow'   => true,
                        'roles'   => ['subscriber'],
                    ],
                ],
            ],
           'verbs'  => [
                'class'   => VerbFilter::className(),
                'actions' => [
                    'delete'     => ['post'],
                    'bulk-action' => ['post']
                ],
            ],
        ];
        }else {
        	throw new ForbiddenHttpException(Yii::t('writesdown', 'You are not allowed to perform this action.'));
        }
    }

    /**
     * Lists all Client models.
     * @return mixed
     */
    public function actionIndex()
    {
    	
        $searchModel = new ClientSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    	
    }

    /**
     * Displays a single Client model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Client model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Client();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index', 'id' => $model->client_id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Client model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index', 'id' => $model->client_id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }
    
    public function actionUp()
    {
        $id=$_GET['id'];
    	$model = $this->findModel($id);
        $oldorder = $model->order;
    	$model->order = $oldorder-1;
    	$model->save();
    	{
    		return $this->redirect(['/client/index', 'id' => $model->client_id]);
    	}
    
    }

    public function actionDown()
    {
    	$id=$_GET['id'];
    	$model = $this->findModel($id);
    	$oldorder = $model->order;
    	$model->order = $oldorder+1;
    	
    	$model->save();
    	{
    		return $this->redirect(['/client/index', 'id' => $model->client_id]);
    	}
    
    }
    /**
     * Deletes an existing Client model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

	/**
     * Bulk action for Client triggered when button 'Apply' clicked.
     * The action depends on the value of the dropdown next to the button.
     * Only accept POST HTTP method.
     */
     public function actionBulkAction()
    {
         if (Yii::$app->request->post('action') == 'delete') {
            foreach (Yii::$app->request->post('ids') as $id) {
                $this->findModel($id)->delete();
            }
        }
    }

    /**
     * Finds the Client model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Client the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Client::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
