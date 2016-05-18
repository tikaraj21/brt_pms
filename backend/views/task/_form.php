<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\Project;
use common\models\User;
use dosamigos\datepicker\DatePicker;
/* @var $this yii\web\View */
/* @var $model app\models\Task */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="task-form">
  <div class="row">
    <?php $form = ActiveForm::begin(); ?>
	   <div class="col-md-4">
	    <?php $listData = ArrayHelper::map(Project::find()->orderBy('project_title')->all(), 'project_id', 'project_title') ?>
	    
	    <?= $form->field($model, 'project_id')->dropDownList($listData, [
	    		'prompt' => 'Select Project'
	    ]); ?>
	    
	 
	    <?= $form->field($model, 'task_title')->textInput(['maxlength' => true]) ?>
	
	   <?= $form->field($model, 'task_hour')->textInput() ?>
	
	    <?= $form->field($model, 'task_details')->textarea(['rows' => 6]) ?>
	    
	   </div>
	   <div class="col-md-4">
	   
	   <?php $listData = ArrayHelper::map(User::find()->orderBy('full_name')->all(), 'id', 'full_name') ?>
	    <?php
	    $disable = true;
	     if (Yii::$app->user->can('superadmin')
    			|| (Yii::$app->user->can('administrator')
    					&& !Yii::$app->authManager->checkAccess($model->id, 'administrator'))
    	) {
    		$disable = false;
	    }?>
	   <?= $form->field($model, 'assign_to')->dropDownList($listData, ['disabled' => $disable], [
	    		'prompt' => 'Select User',
	   		'onchange'=>'
	             $.post("'.Yii::$app->urlManager->createUrl('task/loaddatas?id='.$model->assign_to).
	   			             '"+$(this).val(),function( data )
	                   {
	                              $( "#demo1" ).html( data );
	                            });
	                        '
	    ] );?>
	   
	    <?= $form->field($model, 'task_type')->dropDownList(['WebSite'=>'WebSite','Web Application'=>'Web Application','Desktop Application'=>'Desktop Application']) ?>
	   	
	   	<p><strong>Task Due Date</strong></p>    
	   
		<?= DatePicker::widget([
		    'model' => $model,
		    'attribute' => 'task_due_date',
		    'template' => '{addon}{input}',
		        'clientOptions' => [
		            'autoclose' => true,
		            'format' => 'yyyy-mm-dd',
		        ]
		]);?>
		
	    <br>
	   	    
	     <?= $form->field($model, 'status')->dropDownList(['1'=>'Passive','2'=>'Active','3'=>'WIP','4'=>'Complate']) ?>
	    
	    <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	   </div>
	   <div class="col-md-4">
	     <div class="panel panel-default" style="padding-right: 10px;">
	         <div class="panel-heading"> <div class="row">
		                <div class="col-md-1"><strong>SN</strong></div>
		                <div class="col-md-2"><strong>Project</strong></div>
		                <div class="col-md-3"><strong>Task</strong></div>
		                <div class="col-md-4"><strong>Task Due Date</strong></div>
		                <div class="col-md-2"><strong>Status</strong></div>
		             </div></div>
		         <div class="panel-body">
		             <div id="demo1">
		                 
		             </div>
		         </div>
	     </div>

	   </div>
    <?php ActiveForm::end(); ?>
  </div>
</div>
