<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "wd_visitor_tracker".
 *
 * @property integer $id
 * @property string $country
 * @property string $city
 * @property string $date
 * @property string $time
 * @property string $ip
 * @property string $web_page
 * @property string $query_string
 * @property string $http_referer
 * @property string $http_user_agent
 * @property integer $is_bot
 */
class VisitorTracker extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pms_visitor_tracker';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['country', 'city', 'date', 'time', 'ip', 'web_page', 'query_string', 'http_referer', 'http_user_agent', 'is_bot'], 'required'],
            [['date', 'time'], 'safe'],
            [['is_bot'], 'integer'],
            [['country', 'city'], 'string', 'max' => 50],
            [['ip'], 'string', 'max' => 20],
            [['web_page', 'query_string', 'http_referer', 'http_user_agent'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'country' => 'Country',
            'city' => 'City',
            'date' => 'Date',
            'time' => 'Time',
            'ip' => 'Ip',
            'web_page' => 'Web Page',
            'query_string' => 'Query String',
            'http_referer' => 'Http Referer',
            'http_user_agent' => 'Http User Agent',
            'is_bot' => 'Is Bot',
        ];
    }
}
