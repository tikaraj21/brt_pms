<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Client */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="client-form">
 <div class="row">
	
	    <?php $form = ActiveForm::begin(); ?>
	 <div class="col-md-6">
	 <div  style="background-color: #cfe2f3; padding: 15px; margin-left: 5px; border-radius:5px;">
	    <?= $form->field($model, 'client_name')->textInput(['maxlength' => true]) ?>
	
	    <?= $form->field($model, 'mobile')->textInput(['maxlength' => true]) ?>
	
	    <?= $form->field($model, 'phone')->textInput(['maxlength' => true]) ?>
	    
	    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>
	
	    </div>
	</div>
	<div class="col-md-6">
	<div  style="background-color: #cfe2f3; padding: 15px; margin-left: 5px; border-radius:5px;">
	    <?= $form->field($model, 'address')->textInput(['maxlength' => true]) ?>
	
	    <?= $form->field($model, 'status')->dropDownList(['1'=>'Active','0'=>'Passive']) ?>
	    
	    <?= $form->field($model, 'order')->textInput(['type' => 'number']) ?>
	<br>
	    <div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	    </div>
	</div>
	    <?php ActiveForm::end(); ?>
	
  </div>
</div>
