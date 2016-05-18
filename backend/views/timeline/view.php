<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Timeline */

$this->title = $model->timeline_id;
$this->params['breadcrumbs'][] = ['label' => 'Timelines', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="timeline-view">

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->timeline_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->timeline_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'timeline_id:datetime',
            'schedule_id',
            'timeline_date',
            'work_hour',
            'remarks',
            'status',
            'complate_percent',
            'crtd_by',
            'crtd_dt',
            'updt_dt',
            'updt_by',
            'error',
            'audit_by',
            'audit',
        ],
    ]) ?>

</div>
