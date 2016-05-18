<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Project */

$this->title = $model->project_no;
$this->params['breadcrumbs'][] = ['label' => 'Projects', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="project-view">


   

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
          //  'project_id',
            'project_no',
            'project_title',
            'project_type',
            'client_id',
            'project_details:ntext',
            'project_date',
            'project_due_date',
            'status',
            'complate_percent',
            'crtd_by',
            'crtd_dt',
            'updt_dt',
            'updt_by',
        ],
    ]) ?>

</div>
