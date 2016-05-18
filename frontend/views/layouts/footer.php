<?php
/**
 * @link      http://www.writesdown.com/
 * @author    Agiel K. Saputra <13nightevil@gmail.com>
 * @copyright Copyright (c) 2015 WritesDown
 * @license   http://www.writesdown.com/license/
 */

use common\models\Option;
use yii\helpers\Html;

?>
<footer id="footer-primary">
    <div class="container">
        <h5 style="color: #fff;">
            Copyright &copy; <?= date('Y') ?>
            <?= Html::a(Option::get('sitetitle'), 'http://www.bentraytech.com/') ?>
            All right reserved. Bent Ray Technologies.
        </h5>
    </div>
</footer>
