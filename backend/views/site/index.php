<?php
/**
 * @link      http://www.writesdown.com/
 * @author    Agiel K. Saputra <13nightevil@gmail.com>
 * @copyright Copyright (c) 2015 WritesDown
 * @license   http://www.writesdown.com/license/
 */

use cebe\gravatar\Gravatar;
use yii\helpers\Html;
use app\models\Project;
use app\models\Client;
use common\models\User;

/* @var $postCount int */
/* @var $commentCount int */
/* @var $userCount int */
/* @var $users common\models\User[] */
/* @var $posts common\models\Post[] */
/* @var $comments common\models\PostComment[] */

$this->title = Yii::t('writesdown', 'Dashboard');

?>
<div class="site-index">
    <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box bg-aqua">
                <span class="info-box-icon info-box-icon"><i class="fa fa-product-hunt"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Projects</span>
                    <span class="info-box-number">
                    <?php $project = Project::find()->count();?>
                        <a aria-label="Follow @writesdown on GitHub" href="<?= Yii::$app->request->baseUrl.'/index.php/project/index' ?>"
                           class="github-button" style="color: #fff"><?= $project?></a>
                    </span>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box bg-red">
                <span class="info-box-icon"><i class="fa fa-users"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text"><?= Yii::t('writesdown', 'Clients') ?></span>
                    <?php $client = Client::find()->count();?>
                    <span class="info-box-number"><a href="<?= Yii::$app->request->baseUrl.'/index.php/client/index' ?>"
                      style="color: #fff"><?= $client?></a></span>
                </div>
            </div>
        </div>
        <div class="clearfix visible-sm-block"></div>
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box bg-green">
                <span class="info-box-icon"><i class="fa fa-comments-o"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text"><?= Yii::t('writesdown', 'Comments') ?></span>
                    <span class="info-box-number"><?= $commentCount ?></span>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box bg-yellow">
                <span class="info-box-icon"><i class="fa fa-users"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text"><?= Yii::t('writesdown', 'Users') ?></span>
                    <span class="info-box-number"><?= $userCount ?></span>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
	    <div class="col-sm-6">
	     <p style="text-align: center;">
	     <?= Html::img(Yii::getAlias('@web/img/2.jpg'),['style'=>'height:400px;']) ?>
	     </p>
		   <div class="box box-solid">
                <div class="box-header with-border">
                    <h3 class="box-title"><?= Yii::t('writesdown', 'Latest Projects') ?></h3>
                    <div class="box-tools pull-right">
                        <span class="label label-danger">
                            <?= Yii::t('writesdown', '{projectCount} Projects', ['projectCount' => $projectCount]) ?>

                        </span>
                        <button data-widget="collapse" class="btn btn-box-tool"><i class="fa fa-minus"></i></button>
                        <button data-widget="remove" class="btn btn-box-tool"><i class="fa fa-times"></i></button>
                    </div>
                </div>
				<div class="box-body">
					<div class="nav-tabs-custom">
						 <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
									<ol class="carousel-indicators">
										<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
										<li data-target="#carousel-example-generic" data-slide-to="1"></li>
										<li data-target="#carousel-example-generic" data-slide-to="2"></li>
									</ol>
									<div class="carousel-inner">
										<div class="item active">
											<?= Html::img(Yii::getAlias('@web/img/eng.png')) ?>
										</div>
										<div class="item">
											 <?= Html::img(Yii::getAlias('@web/img/pacific.png')) ?>
										</div>
										<div class="item">
											 <?= Html::img(Yii::getAlias('@web/img/tbnepal.png')) ?>
										</div>
									</div>
									<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev" style="margin-top:25%">
										<span class="glyphicon glyphicon-menu-left" style="font-size:20px; color:#1f2113;  text-shadow:none; padding-top:5px;"></span></a>
										<a class="right carousel-control"
									href="#carousel-example-generic" data-slide="next"  style="margin-top:25%"><span class="glyphicon glyphicon-menu-right" style="font-size:20px; color:#1f2113; padding-top:5px; text-shadow:none;">
									</span></a>
								</div>
								
					  </div><!-- /.nav-tabs-custom -->
			   </div>
			</div>  
		</div>
        <div class="col-sm-6">
          <p style="text-align: center;"><?= Html::img(Yii::getAlias('@web/img/1.png'),['style'=>'height:400px;']) ?></p>
            <div class="box box-solid">
                <div class="box-header with-border">
                    <h3 class="box-title"><?= Yii::t('writesdown', 'Latest Updates') ?></h3>
                    <div class="box-tools pull-right">
                        <span class="label label-danger">
                            <?= Yii::t('writesdown', '{postCount} Posts', ['postCount' => $postCount]) ?>

                        </span>
                        <button data-widget="collapse" class="btn btn-box-tool"><i class="fa fa-minus"></i></button>
                        <button data-widget="remove" class="btn btn-box-tool"><i class="fa fa-times"></i></button>
                    </div>
                </div>
                <div class="box-body">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th><?= Yii::t('writesdown', 'Update By') ?></th>
                            <th><?= Yii::t('writesdown', 'Title') ?></th>
                            <th><?= Yii::t('writesdown', 'Date') ?></th>
                            <th><?= Yii::t('writesdown', 'Views') ?></th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>

                        <?php foreach ($posts as $post): 
                        $user = User::find()->where("id='$post->user_id'")->one();
                        ?>
                            <tr>
                                <td><?= $user->full_name ?></td>
                                <td><?= substr(strip_tags($post->description), 0, 180) . '...' ?></td>
                                <td><?= $post->datetime ?></td>
                                
                                <td>
                                    <?= Html::a(
                                        '<span class="glyphicon glyphicon-eye-open"></span>',
                                       Yii::$app->request->baseUrl.'/index.php/'.$post->module.'/view?id='.$post->id,
                                        ['title' => Yii::t('writesdown', 'View Post')]
                                    ) ?>
                                </td>
                            </tr>
                        <?php endforeach ?>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
</div>
