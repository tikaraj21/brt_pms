<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ChecklistSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="checklist-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'cheklist_id') ?>

    <?= $form->field($model, 'schedule_id') ?>

    <?= $form->field($model, 'cheklist_date') ?>

    <?= $form->field($model, 'cheklist_hour') ?>

    <?= $form->field($model, 'remarks') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'crtd_by') ?>

    <?php // echo $form->field($model, 'crtd_dt') ?>

    <?php // echo $form->field($model, 'updt_dt') ?>

    <?php // echo $form->field($model, 'updt_by') ?>

    <?php // echo $form->field($model, 'error') ?>

    <?php // echo $form->field($model, 'chek_by') ?>

    <?php // echo $form->field($model, 'cheklist_title') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
