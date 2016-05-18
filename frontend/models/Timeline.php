<?php

namespace app\models;

use Yii;
use common\models\User;

/**
 * This is the model class for table "wd_timeline".
 *
 * @property integer $timeline_id
 * @property string $schedule_id
 * @property string $timeline_date
 * @property string $work_hour
 * @property integer $remarks
 * @property integer $status
 * @property string $complate_percent
 * @property integer $crtd_by
 * @property string $crtd_dt
 * @property string $updt_dt
 * @property integer $updt_by
 * @property integer $error
 * @property integer $audit_by
 * @property string $audit
 */
class Timeline extends \yii\db\ActiveRecord
{
	public $project_id;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pms_timeline';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['status', 'crtd_by', 'updt_by', 'audit_by','user_id'], 'integer'],
            [['crtd_dt', 'updt_dt','project_id','error','remarks','user_id'], 'safe'],
            [['schedule_id', 'work_hour', 'complate_percent'], 'string', 'max' => 50],
            [['timeline_date'], 'string', 'max' => 100],
            [['audit'], 'string', 'max' => 20],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'timeline_id' => 'Timeline ID',
            'schedule_id' => 'Task',
            'timeline_date' => 'Timeline Date',
            'work_hour' => 'Work Hour',
            'remarks' => 'Remarks',
            'status' => 'Status',
            'complate_percent' => 'Complate Percent',
            'crtd_by' => 'Crtd By',
            'crtd_dt' => 'Crtd Dt',
            'updt_dt' => 'Updt Dt',
            'updt_by' => 'Updt By',
            'error' => 'Error',
            'audit_by' => 'Audit By',
            'audit' => 'Audit',
        	'project_id' => 'Project',
        	'user_id' => 'User'
        ];
    }
    public function gettask(){
    	return $this->hasOne(Task::className(), ['task_id'=>'schedule_id']);
    }
    
    public function getuser(){
    	return $this->hasOne(User::className(), ['id'=>'audit_by']);
    }
    
    public function getuserassign(){
    	return $this->hasOne(User::className(), ['id'=>'user_id']);
    }
}
