<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Schedule */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="schedule-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'task_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'schedule_date')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'schedule_hour')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'remarks')->textInput() ?>

    <?= $form->field($model, 'status')->textInput() ?>

    <?= $form->field($model, 'complate_percent')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'crtd_by')->textInput() ?>

    <?= $form->field($model, 'crtd_dt')->textInput() ?>

    <?= $form->field($model, 'updt_dt')->textInput() ?>

    <?= $form->field($model, 'updt_by')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
