<?php
/* @var $this \yii\web\View view component instance */
/* @var $message \yii\mail\MessageInterface the message being composed */
/* @var $content string main view render result */
?>
<?php $this->beginPage() ?>
<?php $this->beginBody() ?>
  Hello <?=  $content['full_name'];?>,
   <h2><?=  $content['title'];?></h2>
   <p><?=  $content['details'];?></p>
   <p><a href="http://localhost/brt_pms/admin/index.php/task/view?id=<?= $content['id'];?>">http://localhost/brt_pms/admin/index.php/task/view?id=<?= $content['id'];?></a></p>
   Thank You.
<?php $this->endBody() ?>
<?php $this->endPage() ?>
