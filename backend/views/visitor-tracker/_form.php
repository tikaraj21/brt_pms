<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\VisitorTracker */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="visitor-tracker-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'country')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'city')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'date')->textInput() ?>

    <?= $form->field($model, 'time')->textInput() ?>

    <?= $form->field($model, 'ip')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'web_page')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'query_string')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'http_referer')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'http_user_agent')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'is_bot')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
