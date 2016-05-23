<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use dosamigos\datepicker\DatePicker;
/* @var $this yii\web\View */
/* @var $model app\models\ProjectSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="project-search">

    <?php $form = ActiveForm::begin(); ?>

   <div class="col-md-1">
   
     <p style="margin-top: 10px;"><strong>From Date:</strong>  </p>
     </div>  
	   <div class="col-md-3">
		<?= DatePicker::widget([
		    'model' => $model,
		    'attribute' => 'from',
		    'template' => '{addon}{input}',
		        'clientOptions' => [
		            'autoclose' => true,
		            'format' => 'yyyy-mm-dd',
		        ]
		]);?>
		</div>
		<div class="col-md-1"></div>
		
		<div class="col-md-1">
   
	     <p style="margin-top: 10px;"><strong>To Date: </strong>  </p>
	     </div>  
		   <div class="col-md-3">
			<?= DatePicker::widget([
			    'model' => $model,
			    'attribute' => 'to',
			    'template' => '{addon}{input}',
			        'clientOptions' => [
			            'autoclose' => true,
			            'format' => 'yyyy-mm-dd',
			        ]
			]);?>
			</div>

    <?php // echo $form->field($model, 'project_details') ?>

    <?php // echo $form->field($model, 'project_date') ?>

    <?php // echo $form->field($model, 'project_due_date') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'complate_percent') ?>

    <?php // echo $form->field($model, 'crtd_by') ?>

    <?php // echo $form->field($model, 'crtd_dt') ?>

    <?php // echo $form->field($model, 'updt_dt') ?>

    <?php // echo $form->field($model, 'updt_by') ?>

   <div class="col-md-1"></div>
   <div class="col-md-2">
    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
       
    </div>
   </div>

    <?php ActiveForm::end(); ?>

</div>
