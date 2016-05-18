<?php
use yii\web\Request;

$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

$baseUrlFront = str_replace('/admin', '', (new Request())->getBaseUrl());

return [
    'id'                  => 'app-backend',
    'basePath'            => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
    'bootstrap'           => ['log', 'common\components\BackendBootstrap'],
    'modules' => [
	 'backup' => [
            'class' => 'spanjeta\modules\backup\Module',
        ],
	],
    'components'          => [
        'user'            => [
            'identityClass'   => 'common\models\User',
            'enableAutoLogin' => true,
        ],
        'log'             => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets'    => [
                [
                    'class'  => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler'    => [
            'errorAction' => 'site/error',
        ],
        'i18n'            => [
            'translations' => [
                'writesdown' => [
                    'class'          => 'yii\i18n\PhpMessageSource',
                    'basePath'       => '@app/messages',
                    'sourceLanguage' => 'en-US',
                    'fileMap'        => [],
                ],
            ],
        ],
        'urlManagerFront' => [
            'class'     => 'yii\web\urlManager',
            'scriptUrl' => $baseUrlFront,
            'baseUrl'   => $baseUrlFront,
        ],
        'urlManagerBack'  => [
            'class' => 'yii\web\urlManager',
        ],
        'authManager'     => [
            'class' => 'yii\rbac\DbManager',
        ],
    ],
		'as beforeRequest' => [  //if guest user access site so, redirect to login page.
				'class' => 'yii\filters\AccessControl',
				'rules' => [
						[
								'actions' => ['login', 'error'],
								'allow' => true,
						],
						[
								'allow' => true,
								'roles' => ['@'],
						],
				],
		],
    'params'              => $params,
];
