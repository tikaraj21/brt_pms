<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use dosamigos\datepicker\DatePicker;
/* @var $this yii\web\View */
/* @var $model app\models\TimelineSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="timeline-search row">

    <?php /* $form = ActiveForm::begin([
        'action' => ['monthlyreport'],
        'method' => 'post',
    ]); */?>
<?php $form = ActiveForm::begin(); ?>
    <?php // $form->field($model, 'timeline_id') ?>

    <?php // $form->field($model, 'schedule_id') ?>
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
    <?php // $form->field($model, 'work_hour') ?>

    <?php // $form->field($model, 'remarks') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'complate_percent') ?>

    <?php // echo $form->field($model, 'crtd_by') ?>

    <?php // echo $form->field($model, 'crtd_dt') ?>

    <?php // echo $form->field($model, 'updt_dt') ?>

    <?php // echo $form->field($model, 'updt_by') ?>

    <?php // echo $form->field($model, 'error') ?>

    <?php // echo $form->field($model, 'audit_by') ?>

    <?php // echo $form->field($model, 'audit') ?>
    <div class="col-md-1"></div>
   <div class="col-md-2">
    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
       
    </div>
   </div>
    <?php ActiveForm::end(); ?>

</div>
