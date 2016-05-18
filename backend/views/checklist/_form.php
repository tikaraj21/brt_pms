<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Checklist */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="checklist-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'schedule_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cheklist_date')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cheklist_hour')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'remarks')->textInput() ?>

    <?= $form->field($model, 'status')->textInput() ?>

    <?= $form->field($model, 'crtd_by')->textInput() ?>

    <?= $form->field($model, 'crtd_dt')->textInput() ?>

    <?= $form->field($model, 'updt_dt')->textInput() ?>

    <?= $form->field($model, 'updt_by')->textInput() ?>

    <?= $form->field($model, 'error')->textInput() ?>

    <?= $form->field($model, 'chek_by')->textInput() ?>

    <?= $form->field($model, 'cheklist_title')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
