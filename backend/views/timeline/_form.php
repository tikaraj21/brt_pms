<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\Task;
use yii\helpers\ArrayHelper;
use app\models\Project;
use dosamigos\datepicker\DatePicker;
use common\models\User;
use app\models\Timeline;
/* @var $this yii\web\View */
/* @var $model app\models\Timeline */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="timeline-form">
	<div class="row">
	    <?php $form = ActiveForm::begin(); ?>
	   <div class="col-md-6">
	     <?php
	     if (Yii::$app->user->can('superadmin')
	     		|| (Yii::$app->user->can('administrator')
	     				&& !Yii::$app->authManager->checkAccess($model->id, 'administrator'))
	     ) {
	     $disable = FALSE;
	     }else {
	     $disable = TRUE;
	     }
	     $listData = ArrayHelper::map(User::find()->orderBy('full_name')->all(), 'id', 'full_name') ?>
	   
	   <?= $form->field($model, 'user_id')->dropDownList($listData, ['disabled' => $disable,
	    		'prompt' => 'Select User'
	    ] );?>
	    
	    <?php $listData = ArrayHelper::map(Project::find()->orderBy('project_title')->all(), 'project_id', 'project_title') ?>
		    <?php if($model->isNewRecord!='1'){ 
		      $taskid = $model->schedule_id;
		      $task = Task::find()->where("task_id='$taskid'")->one();
		      $model->project_id = $task->project_id;
		    }?>
		    <?= $form->field($model, 'project_id')->dropDownList($listData, [
		    		'prompt' => 'Select Project',
		    		'onchange'=>'
                $.post( "'.Yii::$app->urlManager->createUrl('timeline/lists?id=').'"+$(this).val(), function( data ) {
                  $( "select#title" ).html( data );
                });
            '
		    ]); ?>
		    
		     <?php 
			    $dataPost=ArrayHelper::map(Task::find()->orderBy('task_title')->all(), 'task_id', 'task_title');
			    echo $form->field($model, 'schedule_id')
			    ->dropDownList(
			    		$dataPost,
			    		['id'=>'title']
			    );
			    ?>
	    
	
	    <?= $form->field($model, 'work_hour')->textInput(['maxlength' => true]) ?>
	
	    <?= $form->field($model, 'remarks')->textarea(['rows'=>6]) ?>
	
	</div>
	<div class="col-md-6">
	    <?= $form->field($model, 'complate_percent')->textInput(['maxlength' => true]) ?>
	
	    <?= $form->field($model, 'error')->textarea(['rows'=>4]) ?>
	
	    <?= $form->field($model, 'status')->dropDownList(['1'=>'WIP','2'=>'Complate']) ?>
	    
	    <?php $listData = ArrayHelper::map(User::find()->orderBy('full_name')->all(), 'id', 'full_name') ?>
	   
	   <?= $form->field($model, 'audit_by')->dropDownList($listData, [
	    		'prompt' => 'Select User'
	    ] );?>
		<?php 
	     $disable = true;
	     $id = Yii::$app->user->identity->id;
	     if($model->isNewRecord!='1'){ 
	     	if (Yii::$app->user->can('superadmin') || ($model->audit_by == $id)
	     			|| (Yii::$app->user->can('administrator')
	     					&& !Yii::$app->authManager->checkAccess($model->id, 'administrator'))
	     	) {
	     	$disable = false;
	     	}
	     }?>
	    <?= $form->field($model, 'audit')->dropDownList(['No' => 'No','Yes' => 'Yes'], ['disabled' => $disable]) ?>
	    
	     <div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	</div>
	   
	
	    <?php ActiveForm::end(); ?>
	</div>
</div>
