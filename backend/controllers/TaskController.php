<?php

namespace backend\controllers;

use Yii;
use app\models\Task;
use app\models\TaskSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\models\Project;
use app\models\Schedule;

/**
 * TaskController implements the CRUD actions for Task model.
 */
class TaskController extends Controller
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
     * Lists all Task models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new TaskSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Task model.
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
     * Creates a new Task model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Task();
   
        if ($model->load(Yii::$app->request->post()) ) {
        	$model->task_date = date('Y-m-d');
        	$model->save();
        	$description_info = 'Create Task '.$model->task_title;
        	AuditlogController::AuditLog($description_info,$model->task_id);
            return $this->redirect(['index', 'id' => $model->task_id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Task model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
        	$description_info = 'Update Task '.$model->task_title;
        	AuditlogController::AuditLog($description_info,$model->task_id);
            return $this->redirect(['index', 'id' => $model->task_id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    public function actionsEdit()
    {
    	return ArrayHelper::merge(parent::actions(), [
    			'editbook' => [                                       // identifier for your editable column action
    					'class' => EditableColumnAction::className(),     // action class name
    					'modelClass' => Book::className(),                // the model for the record being edited
    					'outputValue' => function ($model, $attribute, $key, $index) {
    						return (int) $model->$attribute / 100;      // return any custom output value if desired
    					},
    					'outputMessage' => function($model, $attribute, $key, $index) {
    						return '';                                  // any custom error to return after model save
    					},
    					'showModelErrors' => true,                        // show model validation errors after save
    					'errorOptions' => ['header' => '']                // error summary HTML options
    					// 'postOnly' => true,
    					// 'ajaxOnly' => true,
    					// 'findModel' => function($id, $action) {},
    					// 'checkAccess' => function($action, $model) {}
    	]
    	]);
    }
    /**
     * Deletes an existing Task model.
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
    	}
    	$description_info = 'Delete Task '.$model->task_title;
    	AuditlogController::AuditLog($description_info,$model->task_id);
        return $this->redirect(['index']);
    }

    public function actionLoaddata($id){
    	
    	$project = Project::find()->where("project_id='$id'")->one();
    		return $project->project_no;
    }
    public function actionLoaddatas($id){
    	
    	$task = Task::find()->where("assign_to='$id'")->all();
    	$sn=1;
    	foreach($task as $tasks){
    		if ($tasks->status!=4){
    		$project = Project::find()->where("project_id='$tasks->project_id'")->one();
    		if ($tasks->status==1){
    			$status = 'Passive';
    		}
    		elseif ($tasks->status==2){
    			$status = 'Active';
    		}
    		elseif ($tasks->status==3){
    			$status = 'WIS';
    		}
    		elseif ($tasks->status==4){
    			$status = 'Complete';
    		}
    		echo '<div class="row">
		                <div class="col-md-1">'.$sn.'</div>
		                <div class="col-md-2">'.$project->project_no.'</div>
		                <div class="col-md-3">'.$tasks->task_title.'</div>
		                <div class="col-md-4">'.$tasks->task_due_date.'</div>
		                <div class="col-md-2">'.$status.'</div>
		             </div>';
    		echo '<br>';
    		$sn++;
    	}
    	}
    }
    /**
     * Finds the Task model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Task the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Task::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
