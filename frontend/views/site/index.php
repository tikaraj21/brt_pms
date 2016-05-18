<?php
/**
 * @link      http://www.writesdown.com/
 * @author    Agiel K. Saputra <13nightevil@gmail.com>
 * @copyright Copyright (c) 2015 WritesDown
 * @license   http://www.writesdown.com/license/
 */

use common\models\Option;
use yii\helpers\Html;
use yii\widgets\LinkPager;
use app\models\Project;
use app\models\Task;
use app\models\Auditlog;
use app\models\Timeline;
use common\models\User;
use app\models\Client;
/* @var $this yii\web\View */
/* @var $posts common\models\Post[] */
/* @var $tags common\models\Term[] */
/* @var $pages yii\data\Pagination */

$this->title = Html::encode(Option::get('sitetitle') . ' - ' . Option::get('tagline'));
$this->params['breadcrumbs'][] = Html::encode(Option::get('sitetitle'));
?>
<div class="archive site-index">
     <div class="row">
         <div class="col-md-4">
           <div class="panel panel-default">
           	 <div class="panel-heading"><h4><strong>Projects</strong></h4></div>
               <div class="panel-body">
                 <?php $projects = Project::find()->limit(8)->orderBy(['project_date'=>SORT_DESC])->all();
                   foreach ($projects as $project){
                   	$client = Client::find()->where("client_id='$project->client_id'")->one();
                   	echo $project->project_no.' ['.$project->project_date.']'.' ['.$client->client_name.']'.' ['.$project->complate_percent.']'.'<hr>';
                   }
                 ?>
               </div>
             </div>
             <div class="panel panel-default">
               <div class="panel-heading"><h4><strong>Timeline</strong></h4></div>
               <div class="panel-body">
                 <?php $timelines = Timeline::find()->limit(8)->orderBy(['timeline_date'=>SORT_DESC])->all();
                   foreach ($timelines as $timeline){
                   	$task = Task::find()->where("task_id=$timeline->schedule_id")->one();
                   	$user = User::find()->where("id='$task->assign_to'")->one();
                   	echo $task->task_title.' ['.$user->full_name.']'.'<hr>';
                   }
                 ?>
               </div>
           </div>
            <div class="panel panel-default">
           	 <div class="panel-heading"><h4><strong>Errors</strong></h4></div>
               <div class="panel-body">
                  <div class="row" style="border-bottom: 0.5px solid #eee; padding-bottom: 10px;">
					 
					   <div class="col-md-3"><strong>Project</strong></div>
					   <div class="col-md-5"><strong>Task</strong></div>
					   <div class="col-md-4"><strong>Assign To</strong></div>
					 
					</div><br>
						<?php $timeline = Timeline::find()->limit(8)->orderBy(['timeline_date'=>SORT_DESC])->all();
						$sn = 1;
						foreach ($timeline as $timelines){
							if ($timelines->error){
							$task = Task::find()->where("task_id='$timelines->schedule_id'")->one();
							$project = Project::find()->where("project_id='$task->project_id'")->one();
							$user = User::find()->where("id='$task->assign_to'")->one();
						?>
						<a href="#myPopup" data-rel="popup" data-toggle="modal" data-target="#myModal<?= $sn?>" style="color: #555">
						<div class="row">
						  
						   <div class="col-md-3" style="padding-bottom: 8px;"><?= $project->project_no?></div>
						   <div class="col-md-5" style="padding-bottom: 8px;"><?= $task->task_title?></div>
						   <div class="col-md-4" style=" padding-bottom: 8px;"><?= $user->full_name?></div>
						   
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
               </div>
           </div>
         </div>
         <div class="col-md-4">
          <p style="text-align: center;"><?= Html::img(Yii::getAlias('@web/img/project-management.png'),['style'=>'height:250px;']) ?></p>
             <div class="panel panel-default">
           	 <div class="panel-heading"><h4><strong>Tasks</strong></h4></div>
               <div class="panel-body">
                   <?php $tasks = Task::find()->limit(25)->orderBy(['task_date'=>SORT_DESC])->all();
                   foreach ($tasks as $task){
                   	echo $task->task_title.' ['.$task->task_date.']'.'<hr>';
                   }
                 ?>
               </div>
           </div>
         </div>
         <div class="col-md-4">
            <div class="panel panel-default">
           	 <div class="panel-heading"><h4><strong>Updates</strong></h4></div>
               <div class="panel-body">
                   <?php $updates = Auditlog::find()->limit(24)->orderBy(['datetime'=>SORT_DESC])->all();
                   foreach ($updates as $update){
                   	echo $update->description.' ['.$update->datetime.']'.'<hr>';
                   }
                 ?>
               </div>
           </div>
         </div>
     </div>
</div>
