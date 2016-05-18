<?php
/**
 * @link      http://www.writesdown.com/
 * @author    Agiel K. Saputra <13nightevil@gmail.com>
 * @copyright Copyright (c) 2015 WritesDown
 * @license   http://www.writesdown.com/license/
 */

use cebe\gravatar\Gravatar;
use yii\helpers\Html;
use codezeen\yii2\adminlte\widgets\Menu;
use common\models\Option;
use common\models\PostType;
use yii\helpers\ArrayHelper;
/* @var $this yii\web\View */
?>
	<div class="wrapper">
	<h1 style="padding-left: 30px;">
	<strong>PROJECT MANAGEMENT SYSTEM</strong>
	</h1>
	</div>
    <div style="position:fixed; z-index:665; left:89%; top:-10px; color:#000;">
            <nav class="navbar navbar-static-top">
									<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
										<span class="sr-only">Toggle navigation</span>
									</a>
									<div class="navbar-custom-menu">
										<ul class="nav navbar-nav">
											<?php if (!Yii::$app->user->isGuest): ?>
												<li class="dropdown user user-menu">
													<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color:#eee;">
														<?= Gravatar::widget([
															'email'   => Yii::$app->user->identity->email,
															'options' => [
																'alt'   => Yii::$app->user->identity->username,
																'class' => 'user-image',
															],
															'size'    => 25,
														]) ?>
														<span class="hidden-xs" style="color:#000;"><?= Yii::$app->user->identity->username ?></span>
													</a>
													<ul class="dropdown-menu"  style="width:200px; background-color: #FF3E00 ">
														<li class="user-header">
															<?= Gravatar::widget([
																'email'   => Yii::$app->user->identity->email,
																'options' => [
																	'alt'   => Yii::$app->user->identity->username,
																	'class' => 'img-circle',
																],
																'size'    => 84,
															]) ?>
															<p>
																<?= Yii::$app->user->identity->username ?>
																<small>
																	<?= Yii::t('writesdown', 'Member since {date}', [
																		'date' => Yii::$app
																			->formatter
																			->asDate(Yii::$app->user->identity->created_at, 'php:F d, Y'),
																	]) ?>
																</small>
															</p>
														</li>
														<li class="user-footer">
															<div class="pull-left">
																<?= Html::a(
																	Yii::t('writesdown', 'Profile'),
																	['/user/profile'],
																	['class' => 'btn btn-default btn-flat']
																) ?>
															</div>
															<div class="pull-right">
																<?= Html::a(
																	Yii::t('writesdown', 'Sign Out'),
																	['/site/logout'],
																	['class' => 'btn btn-default btn-flat', 'data-method' => 'post']
																) ?>
															</div>
														</li>
													</ul>
												</li>
											<?php endif ?>
										</ul>
									</div>
								</nav>
     </div>
	<div class="main-wrapper">
               <div class="row">
					  <div class="col-md-12">
                    	<nav class="navbar navbar-inverse">
                            <div class="navbar-header">
                              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
                              data-target="#headernav" aria-expanded="false" aria-controls="navbar">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                              </button>
                             <!-- <a class="navbar-brand" href="#">Project name</a>-->
                            </div>
                            <div id="headernav" class="navbar-collapse collapse">
                              <ul class="nav navbar-nav" style="padding-left:15px;">
                                <li><a href="<?= Yii::$app->request->baseUrl.'/index.php' ?>"><i class="fa fa-dashboard" style="font-size: 20px"></i> DASHBOARD</a></li>
								<li><a href="<?= Yii::$app->request->baseUrl.'/index.php/user/index' ?>"><i class="fa fa-user" style="font-size: 20px"></i> USER</a></li>
                              <!-- <li><a href="#">BRANCH</a></li> -->  
								<li><a href="<?= Yii::$app->request->baseUrl.'/index.php/client/index' ?>"><i class="fa fa-users" style="font-size: 20px"></i> CLIENTS</a></li>
                                <li><a href="<?= Yii::$app->request->baseUrl.'/index.php/project/index' ?>"><i class="fa fa-product-hunt" style="font-size: 20px"></i> PROJECT</a></li>
                                <li><a href="<?= Yii::$app->request->baseUrl.'/index.php/task/index' ?>"><i class="fa fa-bars" style="font-size: 20px"></i> TASK</a></li>
                                <li><a href="<?= Yii::$app->request->baseUrl.'/index.php/timeline/index' ?>"><i class="fa fa-bar-chart" style="font-size: 20px"></i> TIMELINE</a></li>
                                 <li><a href="<?= Yii::$app->request->baseUrl.'/index.php/site/projecterror' ?>"><i class="fa fa-exclamation-circle" style="font-size: 20px"></i> ERRORS</a></li>
								
								<li class="dropdown">
                                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-files-o" style="font-size: 20px"></i> REPORTS<span class="caret"></span></a>
                                  <ul class="dropdown-menu" role="menu">
                                    <li><a href="<?= Yii::$app->request->baseUrl.'/index.php/user/index' ?>"><i class="fa fa-user" style="font-size: 20px"></i>User Wise Report</a></li>
                                    <li><a href="<?= Yii::$app->request->baseUrl.'/index.php/project/projectreport' ?>"><i class="fa fa-product-hunt" style="font-size: 20px"></i>Project Wise Report</a></li>
                                    <li><a href="<?= Yii::$app->request->baseUrl.'/index.php/client/index' ?>"><i class="fa fa-users" style="font-size: 20px"></i>Client Wise Report</a></li>
                                    <li><a href="<?= Yii::$app->request->baseUrl.'/index.php/timeline/monthlyreport' ?>"><i class="fa fa-clock-o" style="font-size: 20px"></i>Date Wise Report</a></li>
                                  </ul>
                                </li>
                                <li class="dropdown">
                                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-cog" style="font-size: 20px"></i> SETTINGs<span class="caret"></span></a>
                                  <ul class="dropdown-menu" role="menu">
                                  <li><a href="<?= Yii::$app->request->baseUrl.'/index.php/post/index?post_type=2' ?>"><i class="fa fa-file" style="font-size: 20px"></i> PAGES</a></li>
                                    <li><a href="<?= Yii::$app->request->baseUrl.'/index.php/auditlog/index'?>"><i class="fa fa-bookmark" style="font-size: 20px"></i>Log </a></li>
                                    <li><a href="<?= Yii::$app->request->baseUrl.'/index.php/user/reset-password'?>"><i class="fa fa-lock" style="font-size: 20px"></i>Password</a></li>
                                    <li><a href="<?= Yii::$app->request->baseUrl.'/index.php/menu'?>"><i class="fa fa-bars" style="font-size: 20px"></i>Menu Frontend</a></li>
                                    <li><a href="<?= Yii::$app->request->baseUrl.'/index.php/backup'?>"><i class="fa fa-database" style="font-size: 20px"></i>DataBase Backup</a></li>
                                  </ul>
                                </li>
						     </ul>
                            </div>
        				</nav>
				 </div><!--col-md-12--> 
             </div><!-- row  -->  
        
    </div><!-- main-wrapper -->


