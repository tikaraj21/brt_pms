<?php

namespace backend\controllers;

use Yii;
use app\models\Timeline;
use app\models\TimelineSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\models\Task;

/**
 * TimelineController implements the CRUD actions for Timeline model.
 */
class TimelineController extends Controller
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
     * Lists all Timeline models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new TimelineSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
    
    public function actionMonthlyreport()
    {
    	$model = new Timeline();
    	$searchModel = new TimelineSearch();
    	if ($model->load(Yii::$app->request->post())) {
    
    		$dataProvider = $searchModel->searchs($model->from,$model->to);
    	}else {
    	$model->from =  date("Y-m-d", strtotime("-30 days"));
    	$model->to = date('Y-m-d'); 
    	
    	$dataProvider = $searchModel->searchs($model->from,$model->to);
    	}
    	return $this->render('monthlyreport', [
    			'searchModel' => $searchModel,
    			'dataProvider' => $dataProvider,
    			'model' => $model,
    	]);
    }
    
    /**
     * Displays a single Timeline model.
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
     * Creates a new Timeline model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Timeline();
        $model->user_id = Yii::$app->user->identity->id;
        if ($model->load(Yii::$app->request->post())) {
        	$model->timeline_date = date('Y-m-d');
        	$modelTask = $this->findModeltask($model->schedule_id);
        	$modelTask->complate_percent = $model->complate_percent;
          
        	$modelTask->save(FALSE);
            $model->save();
           
        	$task = Task::find()->where("task_id='$model->schedule_id'")->one();
        	$description_info = 'Create Timeline '.$task->task_title;
        	AuditlogController::AuditLog($description_info,$model->timeline_id);
            return $this->redirect(['index', 'id' => $model->timeline_id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Timeline model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post())) {
        	$model->timeline_date = date('Y-m-d');
        	$modelTask = $this->findModeltask($model->schedule_id);
        	$modelTask->complate_percent = $model->complate_percent;
        	
        	$modelTask->save(FALSE);
        	$model->save();
        	$task = Task::find()->where("task_id='$model->schedule_id'")->one();
        	$description_info = 'Update Timeline '.$task->task_title;
        	AuditlogController::AuditLog($description_info,$model->timeline_id);
            return $this->redirect(['index', 'id' => $model->timeline_id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    public function actionLists($id)
    {
    	$countPosts = Task::find()
    	->where(['project_id' => $id])
    	->count();
    
    	$posts = Task::find()
    	->where(['project_id' => $id])
    	->orderBy('task_title ASC')
    	->all();
    
    	if($countPosts>0){
    		foreach($posts as $post){
    			echo "<option value='".$post->task_id."'>".$post->task_title."</option>";
    		}
    	}
    	else{
    		echo "<option>-</option>";
    	}
    
    }
    /**
     * Deletes an existing Timeline model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();
        $task = Task::find()->where("task_id='$model->schedule_id'")->one();
        $description_info = 'Delete Timeline '.$task->task_title;
        AuditlogController::AuditLog($description_info,$model->timeline_id);
        return $this->redirect(['index']);
    }

    /**
     * Finds the Timeline model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Timeline the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Timeline::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    protected function findModeltask($id)
    {
    	if (($modelTask = Task::findOne($id)) !== null) {
    		return $modelTask;
    	} else {
    		throw new NotFoundHttpException('The requested page does not exist.');
    	}
    }
    
}
