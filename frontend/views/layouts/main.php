<?php
/**
 * @link      http://www.writesdown.com/
 * @author    Agiel K. Saputra <13nightevil@gmail.com>
 * @copyright Copyright (c) 2015 WritesDown
 * @license   http://www.writesdown.com/license/
 */

use common\models\Menu;
use common\models\Option;
use frontend\assets\AppAsset;
use frontend\widgets\Alert;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\helpers\Html;
use yii\widgets\Breadcrumbs;

/* @var $this \yii\web\View */
/* @var $content string */

AppAsset::register($this);

// Canonical
$this->registerLinkTag(['rel' => 'canonical', 'href' => Yii::$app->request->absoluteUrl]);

// Favicon
$this->registerLinkTag(['rel' => 'icon', 'href' => Yii::getAlias('@web/favicon.ico'), 'type' => 'image/x-icon']);

// Add meta robots noindex, nofollow when option disable_site_indexing = true
if (Option::get('disable_site_indexing')) {
    $this->registerMetaTag(['name' => 'robots', 'content' => 'noindex, nofollow']);
}

$this->beginPage()
?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= $this->title ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>
<?php
NavBar::begin([
    'brandLabel' => Html::img(Yii::getAlias('@web/img/logo.png'), ['url' => '/site/index','style'=>'height:50px; margin-top:-15px;'], ['alt' => 'Logo']),
    'brandUrl'   => Yii::$app->homeUrl,
    'options'    => [
        'class' => 'navbar-static-top',
        'id'    => 'navbar-primary',
    ],
]);
echo Nav::widget([
    'options'      => ['class' => 'navbar-nav'],
    'items'        => Menu::getMenu('primary'),
    'encodeLabels' => false,
]);
NavBar::end();
?>
<header id="header-primary">
    <div class="container">
        <?php if (Yii::$app->controller->route == 'site/index'): ?>
            <h1 id="site-title" class="site-title"><?= Option::get('sitetitle'); ?></h1>
        <?php else: ?>
            <span id="site-title" class="h1 site-title"><?= Option::get('sitetitle'); ?></span>
        <?php endif ?>
        <span id="site-tagline" class="h3 site-tagline"><?= Option::get('tagline'); ?></span>
        <a href="<?= Yii::$app->request->baseUrl.'/admin/'?>" target="_blank"><button class="btn btn-default">Login</button></a>
    </div>
</header>
<div id="breadcrumb-primary" class="hidden-xs">
    <div class="container">
        <?= Breadcrumbs::widget(['links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : []]) ?>

    </div>
</div>
<div class="container">
    <div id="content-wrapper">
                <div id="content">
                    <?= Alert::widget() ?>

                    <?= $content ?>

                </div>
           
                <?php // $this->render('sidebar') ?>
          
    </div>
</div>
<?= $this->render('footer') ?>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
