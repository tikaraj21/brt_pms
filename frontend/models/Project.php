<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "wd_project".
 *
 * @property integer $project_id
 * @property string $project_no
 * @property string $project_title
 * @property string $project_type
 * @property integer $client_id
 * @property string $project_details
 * @property string $project_date
 * @property string $project_due_date
 * @property integer $status
 * @property string $complate_percent
 * @property integer $crtd_by
 * @property string $crtd_dt
 * @property string $updt_dt
 * @property integer $updt_by
 */
class Project extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pms_project';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['client_id', 'status', 'crtd_by', 'updt_by'], 'integer'],
            [['project_details'], 'string'],
            [['project_date', 'project_due_date', 'crtd_dt', 'updt_dt'], 'safe'],
            [['project_no', 'project_type', 'complate_percent'], 'string', 'max' => 50],
            [['project_title'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'project_id' => 'Project ID',
            'project_no' => 'Project No',
            'project_title' => 'Project Title',
            'project_type' => 'Project Type',
            'client_id' => 'Client',
            'project_details' => 'Project Details',
            'project_date' => 'Project Date',
            'project_due_date' => 'Project Due Date',
            'status' => 'Status',
            'complate_percent' => 'Complate Percent',
            'crtd_by' => 'Crtd By',
            'crtd_dt' => 'Crtd Dt',
            'updt_dt' => 'Updt Dt',
            'updt_by' => 'Updt By',
        ];
    }
    public function getclient()
    {
    	return $this->hasOne(Client::className(), ['client_id'=>'client_id']);
    }
}
