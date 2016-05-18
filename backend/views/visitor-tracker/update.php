<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\VisitorTracker */

$this->title = 'Update Visitor Tracker: ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Visitor Trackers', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="visitor-tracker-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
