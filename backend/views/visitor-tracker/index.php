<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\VisitorTrackerSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Visitor Trackers';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="visitor-tracker-index">
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Visitor Tracker', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

          //  'id',
          //  'country',
          //  'city',
            'date',
            'time',
            // 'ip',
            // 'web_page',
            // 'query_string',
            // 'http_referer',
            // 'http_user_agent',
            // 'is_bot',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
