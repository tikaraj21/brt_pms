<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\TaskSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="task-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'task_id') ?>

    <?= $form->field($model, 'project_id') ?>

    <?= $form->field($model, 'task_title') ?>

    <?= $form->field($model, 'task_type') ?>

    <?= $form->field($model, 'task_hour') ?>

    <?php // echo $form->field($model, 'task_details') ?>

    <?php // echo $form->field($model, 'task_date') ?>

    <?php // echo $form->field($model, 'task_due_date') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'complate_percent') ?>

    <?php // echo $form->field($model, 'crtd_by') ?>

    <?php // echo $form->field($model, 'crtd_dt') ?>

    <?php // echo $form->field($model, 'updt_dt') ?>

    <?php // echo $form->field($model, 'updt_by') ?>

    <?php // echo $form->field($model, 'assign_to') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
