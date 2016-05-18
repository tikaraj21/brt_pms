<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\Client;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use dosamigos\datepicker\DatePicker;
/* @var $this yii\web\View */
/* @var $model app\models\Project */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="project-form row">

    <?php $form = ActiveForm::begin(); ?>
    <div class="col-md-7">
    <div class="row">
   <div class="col-md-6">
    <?= $form->field($model, 'project_no')->textInput(['maxlength' => true]) ?>
   </div>
   <div class="col-md-6">
    <?= $form->field($model, 'project_title')->textInput(['maxlength' => true]) ?>
   </div>
   </div>
   <div class="row">
   <div class="col-md-6">
    <?= $form->field($model, 'project_type')->dropDownList(['WebSite'=>'WebSite','Application'=>'Application']) ?>
    </div>
   <div class="col-md-6">
    <?php
    $list = Client::find()->all();
    $data = ArrayHelper::map($list, 'client_id', 'client_name');
    echo $form->field($model, 'client_id')->dropDownList($data, [
	    		'prompt' => '--Select Client--'
	    ]);
    
   /*
    echo $form->field($model, 'client_id')->widget(Select2::classname(), [
    		'data' => $data,
    		'language' => 'en',
    		'options' => ['placeholder' => '--Select Client--'],
    		'pluginOptions' => [
    				'allowClear' => true
    		],
    ]);
    */
    /*
    echo Select2::widget([
    		'name' => 'client_id',
    		'value' => '',
    		'data' => $data,
    		'options' => ['multiple' => true, 'placeholder' => '--Select Client--']
    ]);
     
      */  
     ?>
    </div>
    </div>
    <div class="row">
   <div class="col-md-6">
    	<p><strong>Project Date</strong></p>    
	   
		<?= DatePicker::widget([
		    'model' => $model,
		    'attribute' => 'project_date',
		    'template' => '{addon}{input}',
		        'clientOptions' => [
		            'autoclose' => true,
		            'format' => 'yyyy-mm-dd',
		        ]
		]);?>
		
	    <br>
   </div>
   <div class="col-md-6">
    <p><strong>Project Due Date</strong></p>    
	   
		<?= DatePicker::widget([
		    'model' => $model,
		    'attribute' => 'project_due_date',
		    'template' => '{addon}{input}',
		        'clientOptions' => [
		            'autoclose' => true,
		            'format' => 'yyyy-mm-dd',
		        ]
		]);?>
   </div>
   </div>
   
  </div>
  <div class="col-md-5">
    <?= $form->field($model, 'project_details')->textarea(['rows' => 5]) ?>
    <div class="row">
   <div class="col-md-6" style="margin-top: -10px;">
     <?php 
     $disable = true;
     if($model->isNewRecord!='1'){ 
     	$disable = false;
     }?>
    <?= $form->field($model, 'status')->dropDownList(['1'=>'Passive','2'=>'Active','3'=>'Complated'], ['disabled' => $disable]) ?>
   </div>
   </div>
   </div>
   <div class="col-md-6">
    <div class="form-group pull-right">
        <?= Html::submitButton($model->isNewRecord ? 'Create <i class="fa fa-product-hunt"></i>' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>
   </div>
    <?php ActiveForm::end(); ?>

</div>
