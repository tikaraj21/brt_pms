<?php

namespace app\models;

use Yii;
use common\models\User;
/**
 * This is the model class for table "auditlog".
 *
 * @property integer $auditlog_id
 * @property string $datetime
 * @property string $type
 * @property integer $user_id
 * @property string $description
 *
 * @property Login $user
 */
class Auditlog extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pms_auditlog';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['datetime', 'type', 'user_id', 'description','id'], 'required'],
            [['datetime','id'], 'safe'],
            [['user_id'], 'integer'],
            [['description'], 'string'],
            [['type'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'auditlog_id' => Yii::t('app', 'Auditlog ID'),
            'datetime' => Yii::t('app', 'Datetime'),
            'type' => Yii::t('app', 'Type'),
            'user_id' => Yii::t('app', 'User'),
            'description' => Yii::t('app', 'Description'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getuser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
}
