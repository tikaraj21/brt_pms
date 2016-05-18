<?php
/**
 * @link      http://www.writesdown.com/
 * @copyright Copyright (c) 2015 WritesDown
 * @license   http://www.writesdown.com/license/
 */

namespace backend\controllers;

use common\models\LoginForm;
use common\models\Option;
use common\models\PasswordResetRequestForm;
use common\models\Post;
use common\models\PostComment;
use app\models\VisitorTracker;
use common\models\ResetPasswordForm;
use common\models\SignupForm;
use common\models\User;
use Yii;
use yii\base\InvalidParamException;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use app\models\Auditlog;
use app\models\Project;

/**
 * Site controller.
 *
 * @author  Agiel K. Saputra <13nightevil@gmail.com>
 * @since   0.1.0
 */
class SiteController extends Controller
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
                        'actions' => [
                            'login',
                            'request-password-reset',
                            'reset-password',
                            'forbidden',
                            'not-found',
                            'terms',
                        ],
                        'allow'   => true,
                    ],
                    [
                        'actions' => ['logout', 'index', 'error','projecterror'],
                        'allow'   => true,
                        'roles'   => ['@'],
                    ],
                    [
                        'actions'       => ['signup'],
                        'allow'         => true,
                        'matchCallback' => function () {
                            return Option::get('allow_signup') && Yii::$app->user->isGuest;
                        },
                    ],
                ],
            ],
            'verbs'  => [
                'class'   => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    /**
     * Show user count, post count, post-comment count on index (dashboard).
     *
     * @return string
     */
    public function actionIndex()
    {
        // Get list User model
        $userQuery = User::find()->andWhere(['status' => '10']);
        $userCloneQuery = clone $userQuery;
        $userCount = $userCloneQuery->count();
        $users = $userQuery->limit(8)->orderBy(['id' => SORT_DESC])->all();
        // Get list Post model
        $postQuery = Auditlog::find();
        $postCloneQuery = clone $postQuery;
        $postCount = $postCloneQuery->count();
        $posts = $postQuery->limit(8)->orderBy(['auditlog_id' => SORT_DESC])->all();
        
        $projectQuery = Project::find();
        $projectCloneQuery = clone $projectQuery;
        $projectCount = $projectCloneQuery->count();
        // Get list PostComment model
        $commentQuery = PostComment::find()->andWhere(['comment_approved' => 'approved']);
        $commentCloneQuery = clone $commentQuery;
        $commentCount = $commentCloneQuery->count();
        $comments = $commentQuery->limit(3)->orderBy(['id' => SORT_DESC])->all();
		
		$visitorsQuery = VisitorTracker::find();
        $visitorsCloneQuery = clone $visitorsQuery;
        $visitorsCount = $visitorsCloneQuery->count();
        $visitors = $visitorsQuery->limit(3)->orderBy(['id' => SORT_DESC])->all();

        return $this->render('index', [
            'users'        => $users,
            'posts'        => $posts,
            'comments'     => $comments,
			'visitors'     => $visitors,
            'userCount'    => $userCount,
            'postCount'    => $postCount,
            'commentCount' => $commentCount,
        	'projectCount'=> $projectCount,
        ]);
    }

    /**
     * Show login page and process login page.
     *
     * @return string|\yii\web\Response
     */
    public function actionLogin()
    {
        // Set layout and bodyClass for login-page
        $this->layout = 'blank';
        Yii::$app->params['bodyClass'] = 'login-page';

        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();

        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        }

        return $this->render('login', [
            'model' => $model
        ]);
    }

    /**
     * Logout for current user and redirect to home of backend.
     *
     * @return \yii\web\Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Show signup for guest to register on site while Option::get('allow_signup') is true.
     *
     * @return string|\yii\web\Response
     */
    public function actionSignup()
    {
        // Set layout and body class of register-page
        $this->layout = 'blank';
        Yii::$app->params['bodyClass'] = 'register-page';
        $model = new SignupForm();

        if ($model->load(Yii::$app->request->post())) {
            if ($user = $model->signup()) {
                if (Yii::$app->getUser()->login($user)) {
                    return $this->goHome();
                }
            }
        }

        return $this->render('signup', [
            'model' => $model,
        ]);
    }
    
    public function actionProjecterror()
    {    
    	
    	return $this->render('projecterror');
    }
    
    /**
     * Generate and send token to user's email for resetting password.
     *
     * @return string|\yii\web\Response
     */
    public function actionRequestPasswordReset()
    {
        // Change layout and body class of register page
        $this->layout = 'blank';
        Yii::$app->params['bodyClass'] = 'register-page';
        $model = new PasswordResetRequestForm();

        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail()) {
                Yii::$app->getSession()->setFlash('success', 'Check your email for further instructions.');

                return $this->goHome();
            } else {
                Yii::$app->getSession()->setFlash(
                    'error',
                    'Sorry, we are unable to reset password for email provided.'
                );
            }
        }

        return $this->render('request-password-reset-token', [
            'model' => $model,
        ]);
    }

    /**
     * Show reset password. It requires param $token that generated on actionRequestPasswordReset which is sent to
     * user's email.
     *
     * @param $token
     *
     * @return string|\yii\web\Response
     * @throws \yii\web\BadRequestHttpException
     */
    public function actionResetPassword($token)
    {
        // Change layout and body class of reset password page
        $this->layout = 'blank';
        Yii::$app->params['bodyClass'] = 'register-page';

        try {
            $model = new ResetPasswordForm($token);
        } catch (InvalidParamException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->resetPassword()) {
            Yii::$app->getSession()->setFlash('success', 'New password was saved.');

            return $this->goHome();
        }

        return $this->render('reset-password', [
            'model' => $model,
        ]);
    }

    /**
     * Render term and condition
     */
    public function actionTerms()
    {
        $this->layout = 'blank';
        Yii::$app->params['bodyClass'] = 'skin-blue layout-boxed sidebar-mini';

        return $this->render('terms');
    }

    /**
     * @throws \yii\web\ForbiddenHttpException
     */
    public function actionForbidden()
    {
        throw new ForbiddenHttpException(Yii::t('writesdown', 'You are not allowed to perform this action.'));
    }

    /**
     * @throws \yii\web\NotFoundHttpException
     */
    public function actionNotFound()
    {
        throw new NotFoundHttpException(Yii::t('writesdown', 'Page not found'));
    }
}
