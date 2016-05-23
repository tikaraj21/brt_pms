<?php

use yii\helpers\Html;
use kartik\grid\GridView;
use app\models\Client;
use yii\helpers\ArrayHelper;
use yii\bootstrap\Modal;
use yii\helpers\Url;
/* @var $this yii\web\View */
/* @var $searchModel app\models\ProjectSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Projects Wise Report';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="project-index">
   <div class="timeline-index">
  <div class="panel panel-default">
  <div class="panel-body">
    <?php  echo $this->render('_search', ['model' => $model]); ?>
    </div>
  </div>
  
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
    $gridColumns =[
    		
    		['class' => 'yii\grid\SerialColumn'],
    		
    		//  'project_id',
    		'project_no',
    		
    		'project_title',
    		'project_type',
    		 
    		[
    				'attribute'=>'client_id',
    				'value'=>'client.client_name',
    				 
    		],
    		// 'project_details:ntext',
    		'project_date',
    		'project_due_date',
    		
    		[
    				'attribute' => 'status',
    				'value' => function ($data) {
    					if($data->status==1)
    					{
    						return 'Passive';
    					}
    					elseif($data->status==2){
    						return 'Active';
    					}
    					elseif($data->status==3){
    						return 'Done';
    					}
    					else {
    						return 'Inactive';
    					}
    				},
    		
    				],
    				'complate_percent',
    				 
          
             ];
  
    ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
      //  'filterModel' => $searchModel,
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

