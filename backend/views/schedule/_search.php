<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ScheduleSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="schedule-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'schedule_id') ?>

    <?= $form->field($model, 'task_id') ?>

    <?= $form->field($model, 'schedule_date') ?>

    <?= $form->field($model, 'schedule_hour') ?>

    <?= $form->field($model, 'remarks') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'complate_percent') ?>

    <?php // echo $form->field($model, 'crtd_by') ?>

    <?php // echo $form->field($model, 'crtd_dt') ?>

    <?php // echo $form->field($model, 'updt_dt') ?>

    <?php // echo $form->field($model, 'updt_by') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
