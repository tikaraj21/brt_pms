<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Auditlog */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Auditlog',
]) . ' ' . $model->auditlog_id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Auditlogs'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->auditlog_id, 'url' => ['view', 'id' => $model->auditlog_id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="panel panel-default" style="margin-top: 10px;">
   <div class="panel-heading"><h4><i class="glyphicon glyphicon-ok"></i> <?= Html::encode($this->title) ?></h4></div>
        <div class="panel-body">
			<div class="auditlog-update">
			    <?= $this->render('_form', [
			        'model' => $model,
			    ]) ?>
			
			</div>
    </div>
</div>