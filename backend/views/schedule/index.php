<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\models\Task;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ScheduleSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Schedules';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="schedule-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Schedule', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

          //  'schedule_id',
          //  'task_id',
            [
            'attribute' => 'task_id',
            'value' => 'task.task_title',
            'filter' => Html::activeDropDownList($searchModel, 'task_id', ArrayHelper::map(Task::find()->all(), 'task_id', 'task_title'),['class'=>'form-control','prompt' => 'Select Task']),
            ],
            
            [
            'attribute' => 'user_id',
            'value' => 'taskuser.full_name',
         
            ],
            'schedule_date',
            'schedule_hour',
            'remarks',
            // 'status',
            // 'complate_percent',
            // 'crtd_by',
            // 'crtd_dt',
            // 'updt_dt',
            // 'updt_by',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
