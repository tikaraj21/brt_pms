<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\AuditlogSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Auditlogs');
$this->params['breadcrumbs'][] = $this->title;
?>

			<div class="auditlog-index">
			
			    <?= GridView::widget([
			        'dataProvider' => $dataProvider,
			        'filterModel' => $searchModel,
			        'columns' => [
			            ['class' => 'yii\grid\SerialColumn'],
			
			         //   'auditlog_id',
			            'datetime',
			            'module',
			            'type',
			            'id',
			             [
				           'attribute' => 'user_id',
				           'value'=>'user.username',
				         ],
			            'description:ntext',
						
			            ['class' => 'yii\grid\ActionColumn'],
			        ],
			    ]); ?>
			
			</div>
   