<?php
/**
 * @link      http://www.writesdown.com/
 * @author    Agiel K. Saputra <13nightevil@gmail.com>
 * @copyright Copyright (c) 2015 WritesDown
 * @license   http://www.writesdown.com/license/
 */

use common\models\Option;
use frontend\assets\CommentAsset;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $post common\models\Post */
/* @var $comment common\models\PostComment */
/* @var $category common\models\Term */

$this->title = Html::encode($post->post_title . ' - ' . Option::get('sitetitle'));
$this->params['breadcrumbs'][] = [
    'label' => Html::encode($post->postType->post_type_sn),
    'url'   => ['/post/index', 'id' => $post->postType->id],
];
$category = $post->getTerms()->innerJoinWith(['taxonomy'])->andWhere(['taxonomy_name' => 'category'])->one();

if ($category) {
    $this->params['breadcrumbs'][] = ['label' => Html::encode($category->term_name), 'url' => $category->url];
}

$this->params['breadcrumbs'][] = Html::encode($post->post_title);
CommentAsset::register($this);
?>
<div class="single post-view">
    <article class="hentry">

        <?php if (Yii::$app->controller->route !== 'site/index'): ?>
            <header class="entry-header page-header">
                <h1 class="entry-title"><?= Html::encode($post->post_title) ?></h1>

                <?php $updated = new \DateTime($post->post_modified, new DateTimeZone(Yii::$app->timeZone)) ?>
                <div class="entry-meta">
                    <span class="entry-date">
                        <span aria-hidden="true" class="glyphicon glyphicon-time"></span>
                        <a rel="bookmark" href="<?= $post->url ?>">
                            <time datetime="<?= $updated->format('c') ?>" class="entry-date">
                                <?= Yii::$app->formatter->asDate($post->post_date) ?>
                            </time>
                        </a>
                    </span>
                    
                </div>
            </header>
        <?php endif ?>

        <div class="entry-content clearfix">
            <?= $post->post_content ?>
        </div>
        <footer class="footer-meta">
            <?php $tags = $post->getTerms()->innerJoinWith(['taxonomy'])->andWhere(['taxonomy_name' => 'tag'])->all() ?>

            <?php if ($tags): ?>
                <h3>
                    <?php foreach ($tags as $tag): ?>
                        <?= Html::a($tag->term_name, $tag->url, ['class' => 'btn btn-xs btn-success']) . "\n" ?>
                    <?php endforeach ?>
                </h3>
            <?php endif ?>

        </footer>
    </article>

</div>
