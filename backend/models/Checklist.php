<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "wd_checklist".
 *
 * @property integer $cheklist_id
 * @property string $schedule_id
 * @property string $cheklist_date
 * @property string $cheklist_hour
 * @property integer $remarks
 * @property integer $status
 * @property integer $crtd_by
 * @property string $crtd_dt
 * @property string $updt_dt
 * @property integer $updt_by
 * @property integer $error
 * @property integer $chek_by
 * @property string $cheklist_title
 */
class Checklist extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pms_checklist';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['remarks', 'status', 'crtd_by', 'updt_by', 'error', 'chek_by'], 'integer'],
            [['crtd_dt', 'updt_dt'], 'safe'],
            [['schedule_id', 'cheklist_hour'], 'string', 'max' => 50],
            [['cheklist_date', 'cheklist_title'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cheklist_id' => 'Cheklist ID',
            'schedule_id' => 'Schedule ID',
            'cheklist_date' => 'Cheklist Date',
            'cheklist_hour' => 'Cheklist Hour',
            'remarks' => 'Remarks',
            'status' => 'Status',
            'crtd_by' => 'Crtd By',
            'crtd_dt' => 'Crtd Dt',
            'updt_dt' => 'Updt Dt',
            'updt_by' => 'Updt By',
            'error' => 'Error',
            'chek_by' => 'Chek By',
            'cheklist_title' => 'Cheklist Title',
        ];
    }
}
