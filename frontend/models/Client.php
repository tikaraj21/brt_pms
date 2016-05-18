<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "wd_client".
 *
 * @property integer $client_id
 * @property string $client_name
 * @property string $mobile
 * @property string $email
 * @property string $phone
 * @property string $address
 * @property integer $status
 */
class Client extends \yii\db\ActiveRecord
{
	const POST_STATUS_PUBLISH = 'publish';
    const POST_STATUS_PRIVATE = 'private';
    const POST_STATUS_DRAFT = 'draft';
    const POST_STATUS_TRASH = 'trash';
    const POST_STATUS_REVIEW = 'review';
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pms_client';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['status'], 'integer'],
        	[['order'],'number'],
            [['client_name'], 'string', 'max' => 150],
            [['mobile', 'email', 'phone', 'address'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'client_id' => 'Client ID',
            'client_name' => 'Client Name',
            'mobile' => 'Mobile',
            'email' => 'Email',
            'phone' => 'Phone',
            'address' => 'Address',
            'status' => 'Status',
        ];
    }
	  public function getPostStatus()
    {
        return [
            self::POST_STATUS_PUBLISH => "Publish",
            self::POST_STATUS_DRAFT   => "Draft",
            self::POST_STATUS_PRIVATE => "Private",
            self::POST_STATUS_TRASH   => "Trash",
            self::POST_STATUS_REVIEW  => "Review",
        ];
    }
}
