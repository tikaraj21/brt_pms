<?php

namespace app\models;

use Yii;
use common\models\User;

/**
 * This is the model class for table "wd_schedule".
 *
 * @property integer $schedule_id
 * @property string $task_id
 * @property string $schedule_date
 * @property string $schedule_hour
 * @property integer $remarks
 * @property integer $status
 * @property string $complate_percent
 * @property integer $crtd_by
 * @property string $crtd_dt
 * @property string $updt_dt
 * @property integer $updt_by
 */
class Schedule extends \yii\db\ActiveRecord
{
	public $user_id;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pms_schedule';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['status', 'crtd_by', 'updt_by'], 'integer'],
            [['crtd_dt', 'updt_dt','schedule_hour','schedule_date','task_id'], 'safe'],
            [['task_id', 'schedule_hour', 'complate_percent'], 'string', 'max' => 50],
            [['schedule_date'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'schedule_id' => 'Schedule ID',
            'task_id' => 'Task ID',
            'schedule_date' => 'Schedule Date',
            'schedule_hour' => 'Schedule Hour',
            'remarks' => 'Remarks',
            'status' => 'Status',
            'complate_percent' => 'Complate Percent',
            'crtd_by' => 'Crtd By',
            'crtd_dt' => 'Crtd Dt',
            'updt_dt' => 'Updt Dt',
            'updt_by' => 'Updt By',
        ];
    }
    public function gettask(){
    	return $this->hasOne(Task::className(), ['task_id'=>'task_id']);
    }
    public function getuser(){
    	return $this->hasOne(User::className(), ['id'=>'user_id']);
    }
    public function gettaskuser(){
    	return $this->hasOne(Task::className(), ['task_id'=>'task_id'])->viaTable('wd_user', ['id' => 'user_id']);
    }
}
