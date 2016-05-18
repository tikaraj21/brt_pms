<?php
/**
 * @link      http://www.writesdown.com/
 * @author    Agiel K. Saputra <13nightevil@gmail.com>
 * @copyright Copyright (c) 2015 WritesDown
 * @license   http://www.writesdown.com/license/
 */

use codezeen\yii2\adminlte\widgets\Alert;
use yii\helpers\Html;
use yii\widgets\Breadcrumbs;

/* @var $this yii\web\View */
/* @var $content string */
?>
<?php $this->beginContent('@app/views/layouts/blank.php') ?>

    <?= $this->render('main-header') ?>
    <?php // $this->render('main-sidebar') ?>
    <div style="padding: 20px;">
     <div class="panel panel-default">
      <div class="panel-heading"> 
          <div class="row" style="margin-bottom: -15px;">
              <div class="col-md-5">
	          
	            <?= Breadcrumbs::widget([
                'homeLink'     => [
                    'label' => Html::a(
                        '<i class="fa fa-dashboard"></i> ' . Yii::t('writesdown', 'Home'),
                        Yii::$app->homeUrl
                    ),
                ],
                'encodeLabels' => false,
                'links'        => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
            ]) ?>
              </div>
              <div class="col-md-7">
        		  <h3 style="margin-top: 0px;"><strong><?= $this->title ?></strong></h3>
              </div>
            </div>
        </div>
        <div class="panel-body">
            <?= Alert::widget() ?>
            
            <?= $content ?>
        </div>
       </div>
       </div>
    <?= $this->render('main-footer') ?>

<?php $this->endContent() ?>
