<?php

namespace backend\controllers;

use Yii;
use app\models\Project;
use app\models\ProjectSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\ForbiddenHttpException;
use yii\helpers\Url;
use app\models\Task;
/**
 * ProjectController implements the CRUD actions for Project model.
 */
class ProjectController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Project models.
     * @return mixed
     */
    public function actionIndex()
    {
    	$project = Project::find()->all();
    	foreach ($project as $projects)
    	{
    		
    		$task = Task::find()->where(['project_id'=>$projects->project_id])->all();
    		
    		foreach ($task as $tasks)
    		{
    			
    			if ($tasks->complate_percent=='100%' && $tasks->status==4){
    				
    		   	$model = $this->findModel($projects->project_id);
    		   	$model->complate_percent='100%';
    		   
    		 	$model->save(TRUE);
    		 	
    			}else {
    				$model = $this->findModel($projects->project_id);
    				$model->complate_percent='WIP';
    					
    				$model->save(TRUE);
    			}
    		 
    		}
    		
    	}
    	
    	/*
    	$url = Url::current();
        $r = explode('?', $url);
        $en = $r[1];
        $searchModel = new ProjectSearch();
        if($en){
        	$id = $_GET['id'];
        	$dataProvider = $searchModel->searchfromtask($id);
        }else {
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        }
        */
    	$searchModel = new ProjectSearch();
    	$dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
    
    public function actionProjectreport()
    {
    	$model = new Project();
    	$searchModel = new ProjectSearch();
    	if ($model->load(Yii::$app->request->post())) {
    
    		$dataProvider = $searchModel->searchreport($model->from,$model->to);
    	}else {
    		$model->from =  date("Y-m-d", strtotime("-30 days"));
    		$model->to = date('Y-m-d');
    		 
    		$dataProvider = $searchModel->searchreport($model->from,$model->to);
    	}
    	return $this->render('projectreport', [
    			'searchModel' => $searchModel,
    			'dataProvider' => $dataProvider,
    			'model' => $model,
    	]);
    }
    public function actionIndexfromtask($id)
    {
    	$searchModel = new ProjectSearch();
    	$dataProvider = $searchModel->searchfromtask($id);
    
    	return $this->render('index', [
    			'searchModel' => $searchModel,
    			'dataProvider' => $dataProvider,
    	]);
    }
    
    /**
     * Displays a single Project model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->renderAjax('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Project model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
    	if (Yii::$app->user->can('superadmin')
    			|| (Yii::$app->user->can('administrator')
    					&& !Yii::$app->authManager->checkAccess($model->id, 'administrator'))
    	) {
        $model = new Project();

        if ($model->load(Yii::$app->request->post())) {
        	$model->crtd_by = Yii::$app->user->id;
        	$model->crtd_dt = date('Y-m-d');
        	$model->save();
        	$description_info = 'Create project '.$model->project_title;
        	AuditlogController::AuditLog($description_info,$model->project_id);
            return $this->redirect(['index', 'id' => $model->project_id]);
        } else {
            return $this->renderAjax('create', [
                'model' => $model,
            ]);
        }
        }else {
        	throw new ForbiddenHttpException(Yii::t('writesdown', 'You are not allowed to perform this action.'));
        }
    }

    /**
     * Updates an existing Project model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
    	if (Yii::$app->user->can('superadmin')
    			|| (Yii::$app->user->can('administrator')
    					&& !Yii::$app->authManager->checkAccess($model->id, 'administrator'))
    	) {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post())) {
        	$model->updt_by = Yii::$app->user->id;
        	$model->updt_dt = date('Y-m-d');
        	if ($model->status==3)
        	{
        		if ($model->complate_percent=='100%'){
        			$model->status = $model->status;
        		}else {
        			$model->status = 2;
        		}
        	
        	}
            $model->save();
            $description_info = 'Update project '.$model->project_title;
            AuditlogController::AuditLog($description_info,$model->project_id);
            return $this->redirect(['index', 'id' => $model->project_id]);
        } else {
            return $this->renderAjax('update', [
                'model' => $model,
            ]);
        }
        }else {
        	throw new ForbiddenHttpException(Yii::t('writesdown', 'You are not allowed to perform this action.'));
        }
    }

    /**
     * Deletes an existing Project model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
    	if (Yii::$app->user->can('superadmin')
    			|| (Yii::$app->user->can('administrator')
    					&& !Yii::$app->authManager->checkAccess($model->id, 'administrator'))
    	) {
    
        $this->findModel($id)->delete();
        }else {
        	throw new ForbiddenHttpException(Yii::t('writesdown', 'You are not allowed to perform this action.'));
        }
        $description_info = 'Delete project '.$model->project_title;
        AuditlogController::AuditLog($description_info,$model->project_id);
        return $this->redirect(['index']);
        
    }

    /**
     * Finds the Project model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Project the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Project::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
   
}
