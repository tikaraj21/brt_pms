<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\VisitorTracker */

$this->title = 'Create Visitor Tracker';
$this->params['breadcrumbs'][] = ['label' => 'Visitor Trackers', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="visitor-tracker-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
