<?php

use yii\helpers\Html;
use kartik\grid\GridView;
use common\models\User;
use app\models\Task;
use yii\helpers\ArrayHelper;
use app\models\Project;
use yii\helpers\BaseStringHelper;

/* @var $this yii\web\View */
/* @var $searchModel app\models\TimelineSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Date Wise Report';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="timeline-index">
  <div class="panel panel-default">
  <div class="panel-body">
    <?php  echo $this->render('_search', ['model' => $model]); ?>
    </div>
  </div>
  <?php 
    $gridColumns =[
            ['class' => 'yii\grid\SerialColumn'],

          //  'timeline_id:datetime',
            [
            'format' => 'raw',
            'label' => 'Project',
            'attribute' => 'projectname',
           ],
           [
           'attribute' => 'schedule_id',
           'value' => 'task.task_title',
           'filter' => Html::activeDropDownList($searchModel, 'schedule_id', ArrayHelper::map(Task::find()->all(), 'task_id', 'task_title'),['class'=>'form-control','prompt' => 'Select Task']),
           ],
           [
           'attribute' => 'user_id',
           'value' => 'userassign.full_name',
           'filter' => Html::activeDropDownList($searchModel, 'user_id', ArrayHelper::map(User::find()->all(), 'id', 'full_name'),['class'=>'form-control','prompt' => 'Select User']),
           ],
            'timeline_date',
            'work_hour',
          
        	 [
			    'format' => 'html',
			    'attribute' => 'remarks',
			    'value' => function ($data) {
			        $url = $data->remarks;
			        return BaseStringHelper::truncateWords($url,15,null,true);
			    },
			],
            // 'status',
             'complate_percent',
            // 'crtd_by',
            // 'crtd_dt',
            // 'updt_dt',
            // 'updt_by',
           
          //   'error',
             [
             'format' => 'html',
             'attribute' => 'error',
             'value' => function ($data) {
             	$url = $data->error;
             	return BaseStringHelper::truncateWords($url,15,null,true);
             },
             ],
          
             [
             'attribute' => 'audit_by',
             'value' => 'user.full_name',
             'filter' => Html::activeDropDownList($searchModel, 'audit_by', ArrayHelper::map(User::find()->all(), 'id', 'full_name'),['class'=>'form-control','prompt' => 'Select User']),
             ],
             'audit',
          
             ];
  
    ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
     //   'filterModel' => $searchModel,
        'columns' => $gridColumns,
        'responsive'=>true,
         'containerOptions' => ['style'=>'overflow: auto; border:1px solid #ccc'], // only set when $responsive = false
         'toolbar' =>  [
         		'{export}',
         		
         ],

         
         'panel' => [
                'heading'=>false,
         		'type' => GridView::TYPE_ACTIVE,
         		'footer'=>false,
         ],
    ]); ?>
</div>
