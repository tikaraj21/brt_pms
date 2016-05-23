<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\models\Client;
use yii\helpers\ArrayHelper;
use yii\bootstrap\Modal;
use yii\helpers\Url;
/* @var $this yii\web\View */
/* @var $searchModel app\models\ProjectSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Projects';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="project-index">
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?php // Html::a('Create Project', ['create'], ['class' => 'btn btn-success']) ?>
         <?= Html::button('<i class="fa fa-plus"></i> Create Project', ['value'=>url::to('create'), 'class' => 'btn btn-success','id'=>'modalButton']) ?>
    </p>
    <?php
            Modal::begin([
                      'id'=>'modal',
                      'size'=>'modal-lg',
                ]);

            echo "<div id='modalContent'></div>";
            Modal::end(); 

    ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

          //  'project_id',
            'project_no',
            
            'project_title',
            'project_type',
           
            [
            'attribute'=>'client_id',
            'value'=>'client.client_name',
            'filter' => Html::activeDropDownList($searchModel, 'client_id', ArrayHelper::map(Client::find()->all(), 'client_id', 'client_name'),['class'=>'form-control','prompt' => 'Select Client']),
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
            	return 'Complated';
            }
            else {
            	return 'Inactive';
            }
            },
            'filter' => html::activeDropDownList($searchModel, 'status', ['1'=>'Passive','2'=>'Active','3'=>'Done'],['class'=>'form-control','prompt' => 'Select Status']),
            ],
             'complate_percent',
            // 'crtd_by',
            // 'crtd_dt',
            // 'updt_dt',
            // 'updt_by',

        //    ['class' => 'yii\grid\ActionColumn'],
            
            [
            'class' => 'yii\grid\ActionColumn',
            'header'=>'Actions',
            'template' => '{view}{update}{delete}',
            'buttons' => [
                     'view' => function ($url, $model)
                               {
								 return Html::a('<span class="glyphicon glyphicon-eye-open"></span>',null,
                                   [
                                      'style'=>'cursor:pointer;',
                                       'value'=>  Url::to(['view','id'=>$model->project_id]),
                                        'class'=>'EditId'

                                    ]
                                      );

                                  },
                                  
                                  'update' => function ($url, $model)
                                  {
                                  	return Html::a('<span class="glyphicon glyphicon-pencil"></span>',null,
                                  			[
                                  					'style'=>'cursor:pointer;',
                                  					'value'=>  Url::to(['update','id'=>$model->project_id]),
                                  					'class'=>'EditId'
                                  
                                  			]
                                  	);
                                  
                                  },
                              
             ],
            ],
            
        ],
    ]); ?>
    
</div>

<?php 
$script = <<< JS
 $('.EditId').on('click',function(){
        Url = $(this).attr("value");
        document.getElementById('modalButton').setAttribute("value",Url);
        document.getElementById('modalButton').click();
     });
JS;
$this->registerJs($script);