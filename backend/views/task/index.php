<?php

use yii\helpers\Html;
use kartik\grid\GridView;
use common\models\User;
use yii\helpers\ArrayHelper;
use app\models\Project;
use kartik\editable\Editable;
use yii\helpers\Url;
use yii\bootstrap\Modal;
/* @var $this yii\web\View */
/* @var $searchModel app\models\TaskSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Tasks';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="task-index">
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p style="position: absolute; z-index: 34;">
        <?= Html::a('Create Task', ['create'], ['class' => 'btn btn-success']) ?>
         <?= Html::button('Create Project', ['value'=>url::to('create'), 'class' => 'btn btn-success','id'=>'modalButton','style'=>'display:none;']) ?>
    </p>
     <?php
            Modal::begin([
                      'id'=>'modal',
                      'header'=>'<h4 style="text-align:center;"> <strong>Projects</strong></h4>',                    
                      'size'=>'modal-lg',
                ]);

            echo "<div id='modalContent'></div>";
            Modal::end(); 

    ?>
    <?php 
    $gridColumns = [
    		['class' => 'kartik\grid\CheckboxColumn'],
    		['class' => 'kartik\grid\SerialColumn'],
    		
    		[
    		'class' => 'kartik\grid\ExpandRowColumn',
    		'value' => function ($model, $key, $index, $column) {
    		
    			return GridView::ROW_COLLAPSED;
    		},
    		
    		'allowBatchToggle'=>true,
    		'detail'=>function ($model) {
    			return Yii::$app->controller->renderPartial('view', ['model'=>$model]);
    		},
    		'detailOptions'=>[
    				'class'=> 'kv-state-enable',
    		],
    		
    		],
    		/*
           [
            'attribute' => 'project_id',
            'value' => 'project.project_no',
            'filter' => Html::activeDropDownList($searchModel, 'project_id', ArrayHelper::map(Project::find()->all(), 'project_id', 'project_no'),['class'=>'form-control','prompt' => 'Select Project']),
            ],
            
            [
            'attribute' => 'project_id',
            'format' => 'raw',
            'filter' => Html::activeDropDownList($searchModel, 'project_id', ArrayHelper::map(Project::find()->all(), 'project_id', 'project_no'),['class'=>'form-control','prompt' => 'Select Project']),
            'value' => function ($data) {
            	 $url = Url::to(['project/view','id'=>$data->project_id]);
            	 
                return Html::a($data->getProjectName(), $url, ['title' => $data->getProjectName()]);
            
            },
            
            ],
            */
            [
            'label'=>'Projects',
            'format'=>'raw',
            'filter' => Html::activeDropDownList($searchModel, 'project_id', ArrayHelper::map(Project::find()->all(), 'project_id', 'project_no'),['class'=>'form-control','prompt' => 'Select Project']),
            'value' => function($data){
            $baseUrl = Yii::$app->request->baseUrl;
         
            	return Html::a($data->getProjectName(),null,
            					[
            							'style'=>'cursor:pointer;',
            							'value' => $baseUrl.'/index.php/project/view?id='.$data->project_id,
            							'class'=>'EditId'
            
            					]
            			);
            }
            ],
           
            'task_title',
     		 /*
     				[
     						'class' => 'kartik\grid\EditableColumn',
     						'attribute'=>'task_title',
     						//'label' => 'Task Title',
     						'vAlign'=>'middle',
     						'editableOptions' => function ($model, $key, $index) {
					                return [
					                    'header' => 'Task Title ',
					                    'placement' => 'left',
					                  //  'inputType' => \kartik\editable\Editable::INPUT_TEXTAREA,
					                    'formOptions' => [
					                        'action' => ['index'],
					                    ]
					                ];
					            },
     						],
     					*/	
            'task_type',
            'task_hour',
            // 'task_details:ntext',
             'task_date',
             'task_due_date',
             'complate_percent',
            // 'assign_to',
             [
             'attribute' => 'assign_to',
             'value' => 'user.full_name',
             'filter' => Html::activeDropDownList($searchModel, 'assign_to', ArrayHelper::map(User::find()->all(), 'id', 'full_name'),['class'=>'form-control','prompt' => 'Select User']),
             ],
         //    'status',
             [
             'attribute' => 'status',
             'value' => function ($data){
                  if ($data->status==1){
             	  return 'Passive';
                  }
                  elseif ($data->status==2){
                  	return 'Active';
                  }
                  elseif ($data->status==3){
                  	return 'WIS';
                  }
                  elseif ($data->status==4){
                  	return 'Complete';
                  }
               },
               'filter' => Html::activeDropDownList($searchModel, 'status', ['1'=>'Passive','2'=>'Active','3'=>'WIP','4'=>'Complete'],['class'=>'form-control','prompt' => 'Select Status']),               
             ],
      
             [
           'class' => 'kartik\grid\ActionColumn',
          ],
        ];
  
    ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
         'columns' => $gridColumns,
         'containerOptions' => ['style'=>'overflow: auto; border:1px solid #ccc'], // only set when $responsive = false
         
         'toolbar' =>  [
         		
                     		'{export}',
                     		'{toggleData}'
                     ],
                     
			    'pjax' => true,
			    'bordered' => true,
			    'striped' => false,
			    'condensed' => false,
                     		'responsive' => true,
                     		'hover' => true,
                     		'floatHeader' => true,
                     		'floatHeaderOptions' => ['scrollingTop' => $scrollingTop],
                     		
                     		'panel' => [
                 'type' => GridView::TYPE_ACTIVE
             ],
    ]); ?>
</div>
<?php 
$script = <<< JS
 $('.EditId').on('click',function(){
		
        Url = $(this).attr("value");
		alert('View project details');
        document.getElementById('modalButton').setAttribute("value",Url);
        document.getElementById('modalButton').click();
     });
JS;
$this->registerJs($script);