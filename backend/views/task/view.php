<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Task */

$this->title = 'Tasks';

?>
<div class="task-view">
<p>
        <?= Html::a('Update', ['update', 'id' => $model->task_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->task_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>
	<div class="row">
	    <div class="col-md-6">
		    <?= DetailView::widget([
		        'model' => $model,
		        'attributes' => [
		        //    'task_id',
		  			'user.full_name',
		            'project.project_no',
		            'task_title',
		            'task_type',
		            'task_hour',
		        ],
		    ]) ?>
	    </div>
	     <div class="col-md-6">
		    <?= DetailView::widget([
		        'model' => $model,
		        'attributes' => [
		      
		            'task_date',
		            'task_due_date',
		         //   'status',
		            'complate_percent',
		            'task_details:ntext',
		           
		        ],
		    ]) ?>
	    </div>
	</div>
</div>
