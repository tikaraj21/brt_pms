<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Auditlog */

$this->title = "View Audit Log: ".$model->auditlog_id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Auditlogs'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="panel panel-default" style="margin-top: 10px;">
   <div class="panel-heading"><h4><i class="glyphicon glyphicon-ok"></i> <?= Html::encode($this->title) ?></h4></div>
        <div class="panel-body">
			<div class="auditlog-view">
			    <p>
			        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->auditlog_id], ['class' => 'btn btn-primary']) ?>
			        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->auditlog_id], [
			            'class' => 'btn btn-danger',
			            'data' => [
			                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
			                'method' => 'post',
			            ],
			        ]) ?>
			    </p>
			
			    <?= DetailView::widget([
			        'model' => $model,
			        'attributes' => [
			            'auditlog_id',
			            'datetime',
			            'type',
			            'user_id',
			            'description:ntext',
			        ],
			    ]) ?>
			
			</div>
      </div>
</div>