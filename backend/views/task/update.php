<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Task */

$this->title = 'Update Task: ' . ' ' . $model->task_id;
$this->params['breadcrumbs'][] = ['label' => 'Tasks', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->task_id, 'url' => ['view', 'id' => $model->task_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="task-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
