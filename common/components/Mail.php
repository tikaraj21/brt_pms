<?php
namespace common\components;
use Yii;
use yii\base\Component;
use yii\base\InvalidConfigException;
use yii\swiftmailer\Mailer;


class Mail extends Mailer{
	public function init(){
		$this->setTransport([
                                            'class' => 'Swift_SmtpTransport',
                                            'host' =>'smtp.gmail.com',
                                            'username' =>'tika.raj@bentraytech.com',
                                            'password' =>'jojolopa',
                                            'port' => '587',
                                            'encryption' => 'tls'
                                           
				/*
				'class' => 'Swift_SmtpTransport',
				'host' =>'mail.bentraytech.com',
				'username' =>'admin@bentraytech.com',
				'password' =>'****',
				'port' => '25',
				'encryption' => 'tls'
				 */
                                    ]);
	}
		
}
?>
