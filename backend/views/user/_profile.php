<?php
/**
 * @link      http://www.writesdown.com/
 * @author    Agiel K. Saputra <13nightevil@gmail.com>
 * @copyright Copyright (c) 2015 WritesDown
 * @license   http://www.writesdown.com/license/
 */

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\User */
/* @var $form yii\widgets\ActiveForm */
?>
<div class="user-form">
    <?php $form = ActiveForm::begin(['id' => 'user-profile-form']) ?>

    <?= $form->field($model, 'username')->textInput([
        'maxlength'   => 255,
        'placeholder' => $model->getAttributeLabel('username'),
    ]) ?>

    <?= $form->field($model, 'email')->textInput([
        'maxlength'   => 255,
        'placeholder' => $model->getAttributeLabel('email'),
    ])->hint(Yii::t('writesdown', 'The email is used for notification and reset password')) ?>

    <?= $form->field($model, 'full_name')->textInput([
        'maxlength'   => 255,
        'placeholder' => $model->getAttributeLabel('full_name'),
    ]) ?>

    <?= $form->field($model, 'display_name')->textInput([
        'maxlength'   => 255,
        'placeholder' => $model->getAttributeLabel('display_name'),
    ])->hint(Yii::t('writesdown', 'This name will appear on public')) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('writesdown', 'Update'), ['btn btn-flat btn-primary']) ?>

    </div>
    <?php ActiveForm::end() ?>

</div>
