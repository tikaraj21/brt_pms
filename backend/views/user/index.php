<?php
/**
 * @link      http://www.writesdown.com/
 * @author    Agiel K. Saputra <13nightevil@gmail.com>
 * @copyright Copyright (c) 2015 WritesDown
 * @license   http://www.writesdown.com/license/
 */

use kartik\grid\GridView;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\User */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('writesdown', 'Users');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-index">
    <div class="form-inline grid-nav" role="form">
        <div class="form-group">
            <?= Html::dropDownList('bulk-action', null, [
                'activated'   => Yii::t('writesdown', 'Activated'),
                'unactivated' => Yii::t('writesdown', 'Unactivated'),
                'removed'     => Yii::t('writesdown', 'Removed'),
                'deleted'     => Yii::t('writesdown', 'Delete permanently'),
            ], [
                'class'  => 'bulk-action form-control',
                'prompt' => 'Change Status',
            ]) ?>

            <?= Html::button(Yii::t('writesdown', 'Apply'), ['class' => 'btn btn-flat btn-warning bulk-button']) ?>

            <?php
            $role = ArrayHelper::map(Yii::$app->authManager->getRoles(), 'name', 'name');
            unset($role['superadmin']);

            if (Yii::$app->user->can('administrator') && !Yii::$app->authManager->checkAccess(Yii::$app->user->id,
                    'superadmin')
            ) {
                unset($role['administrator']);
            }

            echo Html::dropDownList('bulk-role', null, $role, [
                'class'  => 'bulk-role form-control',
                'prompt' => 'Change Role',
            ]);
            ?>

            <?= Html::button(Yii::t('writesdown', 'Apply'), ['class' => 'btn btn-flat btn-warning role-button']) ?>

            <?= Html::a(Yii::t('writesdown', 'Add New User'), ['create'],
                ['class' => 'btn btn-flat btn-primary']) ?>

            <?= Html::button(Html::tag('i', '', ['class' => 'fa fa-search']), [
                'class'       => 'btn btn-flat btn-info',
                "data-toggle" => "collapse",
                "data-target" => "#user-search",
            ]) ?>

        </div>
    </div>
    <?php Pjax::begin() ?>
    <?= $this->render('_search', ['model' => $searchModel]) ?>
     <?php /* GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel'  => $searchModel,
        'id'           => 'user-grid-view',
        'columns'      => [
            ['class' => 'yii\grid\CheckboxColumn'],
            'full_name',
            'username',
            'email:email',
            [
                'attribute' => 'role',
                'value'     => function ($model) {
                    return implode(', ',
                        ArrayHelper::getColumn(Yii::$app->authManager->getRolesByUser($model->id), 'name'));
                },
            ],
            [
                'attribute' => 'status',
                'value'     => function ($model) {
                    return $model->statustext;
                },
                'filter'    => $searchModel->getStatus(),
            ],
            [
                'class'   => 'yii\grid\ActionColumn',
                'buttons' => [
                    'update' => function ($url, $model) {
                        if (Yii::$app->user->can('superadmin')
                            || (Yii::$app->user->can('administrator')
                                && !Yii::$app->authManager->checkAccess($model->id, 'administrator'))
                        ) {
                            return Html::a('<span class="glyphicon glyphicon-pencil"></span>', $url, [
                                'title'     => Yii::t('yii', 'Update'),
                                'data-pjax' => '0',
                            ]);
                        }

                        return false;
                    },
                    'delete' => function ($url, $model) {
                        if (Yii::$app->user->can('superadmin')
                            || (Yii::$app->user->can('administrator')
                                && !Yii::$app->authManager->checkAccess($model->id, 'administrator'))
                        ) {
                            return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url, [
                                'title'        => Yii::t('yii', 'Delete'),
                                'data-confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
                                'data-method'  => 'post',
                                'data-pjax'    => '0',
                            ]);
                        }

                        return false;
                    },
                ],
            ],
        ],
    ])
    */ ?>
     <?php 
    $gridColumns = [
    		
    		['class' => 'kartik\grid\SerialColumn'],
    		
    		[
    		'class' => 'kartik\grid\ExpandRowColumn',
    		'value' => function ($model, $key, $index, $column) {
    		
    			return GridView::ROW_COLLAPSED;
    		},
    		
    		'allowBatchToggle'=>true,
    		'detail'=>function ($model) {
    			return Yii::$app->controller->renderPartial('userdetail', ['id'=>$model->id]);
    		},
    		'detailOptions'=>[
    				'class'=> 'kv-state-enable',
    		],
    		
    		],
    		

    		['class' => 'yii\grid\CheckboxColumn'],
    		'full_name',
    		'username',
    		'email:email',
    		[
    				'attribute' => 'role',
    				'value'     => function ($model) {
    					return implode(', ',
    							ArrayHelper::getColumn(Yii::$app->authManager->getRolesByUser($model->id), 'name'));
    				},
    				],
    				[
    						'attribute' => 'status',
    						'value'     => function ($model) {
    							return $model->statustext;
    						},
    						'filter'    => $searchModel->getStatus(),
    						],
    						[
    								'class'   => 'yii\grid\ActionColumn',
    								'buttons' => [
    										'update' => function ($url, $model) {
    											if (Yii::$app->user->can('superadmin')
    													|| (Yii::$app->user->can('administrator')
    															&& !Yii::$app->authManager->checkAccess($model->id, 'administrator'))
    											) {
    												return Html::a('<span class="glyphicon glyphicon-pencil"></span>', $url, [
    														'title'     => Yii::t('yii', 'Update'),
    														'data-pjax' => '0',
    												]);
    											}
    		
    											return false;
    										},
    										'delete' => function ($url, $model) {
    											if (Yii::$app->user->can('superadmin')
    													|| (Yii::$app->user->can('administrator')
    															&& !Yii::$app->authManager->checkAccess($model->id, 'administrator'))
    											) {
    												return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url, [
    														'title'        => Yii::t('yii', 'Delete'),
    														'data-confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
    														'data-method'  => 'post',
    														'data-pjax'    => '0',
    												]);
    											}
    		
    											return false;
    										},
    										],
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
                     		
                     		
    ]); ?>
    

    <?php Pjax::end() ?>

</div>
<?php $this->registerJs('jQuery(".bulk-button").click(function(e){
    e.preventDefault();
    if(confirm("' . Yii::t("writesdown", "Are you sure to do this?") . '")){
        var ids     = $("#user-grid-view").yiiGridView("getSelectedRows");
        var action  = $(this).parents(".form-group").find(".bulk-action").val();
        $.ajax({
            url: "' . Url::to(["/user/bulk-action"]) . '",
            data: { ids: ids, action: action, _csrf: yii.getCsrfToken() },
            type:"POST",
            success: function(response){
                $.pjax.reload({container:"#user-grid-view"});
            }
        });
    }
});
jQuery(".role-button").click(function(e){
    e.preventDefault();
    if(confirm("' . Yii::t("writesdown", "Are you sure to do this?") . '")){
        var ids     = $("#user-grid-view").yiiGridView("getSelectedRows");
        var role    = $(this).parents(".form-group").find(".bulk-role").val();
        $.ajax({
            url: "' . Url::to(["/user/bulk-action"]) . '",
            data: { ids: ids, action: "changerole", role: role, _csrf: yii.getCsrfToken() },
            type:"POST",
            success: function(response){
                $.pjax.reload({container:"#user-grid-view"});
            }
        });
    }
});') ?>
