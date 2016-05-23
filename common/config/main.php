<?php
return [
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
		'modules' => [
				'gridview' => [
						'class' => '\kartik\grid\Module'
				]
		],
    'components' => [
    		'EmailComponent' => [
    				'class' => 'common\components\EmailComponent',
    		],
    		'email' => 'common\components\Mail',
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
    	'urlManager' => [
    		'class' => 'yii\web\UrlManager',
  			// Disable index.php
    		//'showScriptName' => false,
    		// Disable r= routes
    		'enablePrettyUrl' => true,
    		'rules' => [],
    	],
    ],
];
