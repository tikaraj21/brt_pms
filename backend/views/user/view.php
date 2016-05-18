<?php
/**
 * @link      http://www.writesdown.com/
 * @author    Agiel K. Saputra <13nightevil@gmail.com>
 * @copyright Copyright (c) 2015 WritesDown
 * @license   http://www.writesdown.com/license/
 */

use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\User */

$this->title = 'Users';
?>
<div class="user-view">

    <?php if (Yii::$app->user->can('superadmin')
        || (Yii::$app->user->can('administrator')
            && !Yii::$app->authManager->checkAccess($model->id, 'administrator'))
    ): ?>
        <p>
            <?= Html::a(Yii::t('writesdown', 'Update'), ['update', 'id' => $model->id], [
                'class' => 'btn btn-flat btn-primary',
            ]) ?>
            <?= Html::a(Yii::t('writesdown', 'Delete'), ['delete', 'id' => $model->id], [
                'class' => 'btn btn-flat btn-danger',
                'data'  => [
                    'confirm' => Yii::t('writesdown', 'Are you sure you want to delete this item?'),
                    'method'  => 'post',
                ],
            ]) ?>
        </p>
    <?php endif ?>

    <?= DetailView::widget([
        'model'      => $model,
        'attributes' => [
            'username',
            'email:email',
            'full_name',
            'display_name',
            [
                'attribute' => 'status',
                'value'     => $model->getStatusText(),
            ],
            [
                'attribute' => 'role',
                'value'     => implode(', ',
                    ArrayHelper::getColumn(Yii::$app->authManager->getRolesByUser($model->id), 'name')),
            ],
            'created_at:datetime',
            'updated_at:datetime',
            'login_at:datetime',
        ],
    ]) ?>

</div>
