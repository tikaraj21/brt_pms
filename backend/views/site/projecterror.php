<?php


use app\models\Timeline;
use app\models\Task;
use app\models\Project;
use common\models\User;
/* @var $this yii\web\View */
/* @var $searchModel app\models\TimelineSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Error';
$this->params['breadcrumbs'][] = $this->title;
?>

	<div class="row" style="border-bottom: 0.5px solid #eee; padding-bottom: 10px;">
	   <div class="col-md-1"><strong>S.N.</strong></div>
	   <div class="col-md-2"><strong>Project</strong></div>
	   <div class="col-md-2"><strong>Task</strong></div>
	   <div class="col-md-2"><strong>Assign To</strong></div>
	   <div class="col-md-2"><strong>Audit By</strong></div>
	   <div class="col-md-3"><strong>Error Details</strong></div>
	</div><br>
		<?php 
		if (Yii::$app->user->can('superadmin')
				|| (Yii::$app->user->can('administrator')
						&& !Yii::$app->authManager->checkAccess($model->id, 'administrator'))
		) {
			$timeline = Timeline::find()->orderBy(['timeline_date'=>SORT_DESC])->all();
		}else {
			$id = Yii::$app->user->identity->id;
			$timeline = Timeline::find()->where("user_id='$id' OR audit_by='$id'")->orderBy(['timeline_date'=>SORT_DESC])->all();
		}
		
		$sn = 1;
		foreach ($timeline as $timelines){
			if ($timelines->error){
			$task = Task::find()->where("task_id='$timelines->schedule_id'")->one();
			$project = Project::find()->where("project_id='$task->project_id'")->one();
			$user = User::find()->where("id='$task->assign_to'")->one();
			$audit  = User::find()->where("id='$timelines->audit_by'")->one();
		?>
		<a href="#myPopup" data-rel="popup" data-toggle="modal" data-target="#myModal<?= $sn?>" style="color: #555">
		<div class="row">
		   <div class="col-md-1" style="border-bottom: 0.5px solid #eee; padding-bottom: 8px;"><strong><?= $sn?></strong></div>
		   <div class="col-md-2" style="border-bottom: 0.5px solid #eee; padding-bottom: 8px;"><?= $project->project_no?></div>
		   <div class="col-md-2" style="border-bottom: 0.5px solid #eee; padding-bottom: 8px;"><?= $task->task_title?></div>
		   <div class="col-md-2" style="border-bottom: 0.5px solid #eee; padding-bottom: 8px;"><?= $user->full_name?></div>
		   <div class="col-md-2" style="border-bottom: 0.5px solid #eee; padding-bottom: 8px;"><?= $audit->full_name?></div>
		   <div class="col-md-3" style="border-bottom: 0.5px solid #eee; padding-bottom: 8px;">
		   <?php
		   if(strlen( $timelines->error) > 35)
		   {
		   	$str = substr( $timelines->error, 0, 35) . '..';
		   }else{
		   	$str =  $timelines->error;
		   }
		   echo $str;
		   ?></div>
		</div><br></a>
		<!-- Modal -->
		<div class="modal fade" id="myModal<?= $sn?>" tabindex="-1" role="dialog" aria-labelledby="myModalExp">
		  <div class="modal-dialog modal-lg" role="document">
			<div class="modal-content" style="background-color:#eee">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalExp"><?= $project->project_no?></h4>
			  </div>
			  <div class="col-md-12" style="margin-top: 10px;">
			  <div class="panel panel-default">
			  <div class="panel-body">
				<strong><?= $task->task_title?></strong><br><br>
				<strong>Assign To : </strong><?= $user->full_name?><br><br>
				<strong>Audit By : </strong><?= $audit->full_name?><br><br>
				<strong>Error Details : </strong>
				<p><?= $timelines->error?></p>
				</div>
				</div>
				</div>
			  <div class="modal-footer">
				<button id="onclickChange2" type="button" data-dismiss="modal" class="btn btn-primary" onclick="getValueAddExp2()" style="display: none">Update</button>
			  </div>
			</div>
		  </div>
		</div>
		<?php 	
			}
			$sn ++;
		} ?>