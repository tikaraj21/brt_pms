<?php

use yii\helpers\Html;
use yii\grid\GridView;

use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ClientSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Clients';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="client-index">
    <div class="form-inline grid-nav" role="form">
        <div class="form-group">
            <?= Html::dropDownList('bulk-action', null, ['delete' => 'Delete'], ['prompt' => 'Bulk Action', 'class' => 'bulk-action form-control']); ?>
            <?= Html::button(Yii::t('writesdown', 'Apply'), ['class' => 'btn btn-flat btn-warning bulk-button']); ?>

            <?= Html::a(Yii::t('writesdown', 'Add New Client'), ['create'],
                ['class' => 'btn btn-flat btn-primary']) ?>

        </div>
    </div>
    <?php Pjax::begin() ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
		'id'           => 'client-grid-view',
        'columns' => [
           ['class' => 'yii\grid\CheckboxColumn'],

          //  'client_id',
            'client_name',
            'mobile',
            'email:email',
            'phone',
            // 'address',
            // 'status',
          
            [
        	'header'=>'Up Order', 
            'format' => 'raw',
            'value'=>function ($data) {
            if($data->order == 1){
            	$url = Url::to(['/client/down?id='.$data->client_id]);
            	return Html::a(Html::img(
            			Yii::$app->urlManagerBack->baseUrl.'/img/down.png',
            			['width' => '20px','height' => '20px']
            	),$url);
            	
            	
            }else {
            	$url = Url::to(['/client/down?id='.$data->client_id]);
            	return Html::a(Html::img(
            			Yii::$app->urlManagerBack->baseUrl.'/img/down.png',
            			['width' => '20px','height' => '20px']
            	),$url);
            	
           }
            }, 		
           ],
           [
           'header'=>'Down Order',
           'format' => 'raw',
           'value'=>function ($data) {
           	if($data->order == 1){
           		$url = Url::to(['/client/down?id='.$data->client_id]);
           		return Html::a(Html::img(
           				Yii::$app->urlManagerBack->baseUrl.'/img/down.png',
           				['width' => '20px','height' => '20px']
           		),$url);
           	}else {
           		$url = Url::to(['/client/up?id='.$data->client_id]);
           		return Html::a(Html::img(
           				Yii::$app->urlManagerBack->baseUrl.'/img/up.png',
           				['width' => '20px','height' => '20px']
           		),$url);
           	}
           	
           },
           ],
           
            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
	 <?php Pjax::end() ?>
</div>

<?php
$this->registerJs('
jQuery(".bulk-button").click(function(e){
    e.preventDefault();
    if(confirm("' . Yii::t("app", "Are you sure to do this?") . '")){
        var ids     = $("#client-grid-view").yiiGridView("getSelectedRows"); // returns an array of pkeys, and #grid is your grid element id
        var action  = $(this).parents(".form-group").find(".bulk-action").val();
        $.ajax({
            url: "' . Url::to(["/client/bulk-action"]) . '",
            data: { ids: ids, action: action, _csrf: yii.getCsrfToken() },
            type:"POST",
            success: function(data){
                $.pjax.reload({container:"#client-grid-view"});
            }
        });
    }
});'
);