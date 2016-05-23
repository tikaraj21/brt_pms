<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Checklist */

$this->title = 'Update Checklist: ' . ' ' . $model->cheklist_id;
$this->params['breadcrumbs'][] = ['label' => 'Checklists', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cheklist_id, 'url' => ['view', 'id' => $model->cheklist_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="checklist-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
