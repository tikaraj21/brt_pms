<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use app\models\Project;

/* @var $this yii\web\View */
/* @var $model app\models\Client */

$this->title = $model->client_name;
$this->params['breadcrumbs'][] = ['label' => 'Clients', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="client-view">

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->client_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->client_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>
	<div class="row">
	   <div class="col-md-5">
	    <?= DetailView::widget([
	        'model' => $model,
	        'attributes' => [
	           // 'client_id',
	            'client_name',
	            'mobile',
	            'email:email',
	            'phone',
	            'address',
	         //   'status',
	        ],
	    ]) ?>
	    </div>
	    <div class="col-md-7">
		    <div class="panel panel-default">
		        <div class="panel-heading"><h4><strong>Projects</strong></h4></div>
		        <div class="panel-body">
		          <div class="row">
		             <div class="col-md-1"><strong>SN</strong></div>
		             <div class="col-md-3"><strong>Project No.</strong></div>
		             <div class="col-md-8"><strong>Project Title</strong></div>
		             <hr>
		             <?php $project = Project::find()->where("client_id='$model->client_id'")->all();
		             $sn = 1;
		             foreach ($project as $projects){
		             	?>
		             <div class="col-md-1"><?= $sn?></div>
		             <div class="col-md-3"><?= $projects->project_no ?></div>
		             <div class="col-md-8"><?= $projects->project_title ?></div>
		             <br>
		             <?php 
		             $sn++;
		             }
		             ?>
		          </div>
		        </div>
		    </div>
	    </div>
	</div>
</div>
