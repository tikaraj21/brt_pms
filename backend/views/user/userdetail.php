<?php 

use app\models\Task;
use app\models\Project;

?>
<div class="container">
	<div class="row">
	   <div class="panel panel-default">
	      <div class="panel-heading"><h3 style="text-align: center;"><strong>User Work Details</strong></h3></div>
		      <div class="panel-body">
		       <div class="col-md-1"><strong>SN</strong></div>
		       <div class="col-md-2"><strong>Project No.</strong></div>
		       <div class="col-md-2"><strong>Project Title </strong></div>
		       <div class="col-md-2"><strong>Task Title </strong></div>
		       <div class="col-md-2"><strong>Task Due Date </strong></div>
		       <div class="col-md-2"><strong>Complate Percent</strong></div>
		      <hr>
		      <?php 
		      $task = Task::find()->where("assign_to='$id'")->all();
		      $sn = 1;
		      foreach ($task as $tasks){
		      $project = Project::find()->where("project_id='$tasks->project_id'")->one();
		      ?>
		     <div style="padding-bottom: 10px; padding-top: 10px;<?php if ($sn%2==0){?> background-color: #eee; <?php }?>">
		       <div class="col-md-1"><?= $sn ?></div>
		       <div class="col-md-2"><?= $project->project_no ?></div>
		       <div class="col-md-2"><?= $project->project_title ?></div>
		       <div class="col-md-2"><?= $tasks->task_title ?></div>
		       <div class="col-md-2"><?= $tasks->task_due_date ?></div>
		       <div class="col-md-2"><?= $tasks->complate_percent ?></div>
		      <br>
		      </div>	
		     <?php 
		     $sn++;
		      }
		      ?>
		      </div>
	   </div>
	</div>
</div>