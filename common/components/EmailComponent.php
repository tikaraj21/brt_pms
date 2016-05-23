<?php
/**
 * Created by PhpStorm.
 * User: sameer
 * Date: 7/23/15
 * Time: 12:51 PM
 */

namespace common\components;

use Yii;
use yii\base\Component;

class EmailComponent extends Component {

    public function test(){

    }
    public function SendEmail($from, $to, $subject, $body,$template='text')
    {
    	$send = Yii::$app->email->compose('layouts/'.$template,['content'=>$body])
    	->setFrom($from)
    	->setTo($to)
    	->setSubject($subject)
    	->send();
    	if($send){ return true;}else{ return false;}
    }

    public function SendEmailSeekerQ2($from, $to, $subject, $body,$template='text')
    {
    	$send = Yii::$app->mailqueue->compose('layouts/'.$template,['content'=>$body])
    	->setFrom($from)
    	->setTo($to)
    	->setSubject($subject)
    	->queue(NULL);
    	if($send){ return true;}else{ return false;}
    }
   
}