<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Timeline */

$this->title = 'Update Timeline: ' . ' ' . $model->timeline_id;
$this->params['breadcrumbs'][] = ['label' => 'Timelines', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->timeline_id, 'url' => ['view', 'id' => $model->timeline_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="timeline-update">


    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
