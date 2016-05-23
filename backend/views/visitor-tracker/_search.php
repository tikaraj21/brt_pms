<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\VisitorTrackerSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="visitor-tracker-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'country') ?>

    <?= $form->field($model, 'city') ?>

    <?= $form->field($model, 'date') ?>

    <?= $form->field($model, 'time') ?>

    <?php // echo $form->field($model, 'ip') ?>

    <?php // echo $form->field($model, 'web_page') ?>

    <?php // echo $form->field($model, 'query_string') ?>

    <?php // echo $form->field($model, 'http_referer') ?>

    <?php // echo $form->field($model, 'http_user_agent') ?>

    <?php // echo $form->field($model, 'is_bot') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
