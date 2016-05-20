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
	public $from;
	public $to;
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
        	[['user_id','timeline_date','work_hour', 'complate_percent'], 'required'],
            [['status', 'crtd_by', 'updt_by', 'audit_by','user_id'], 'integer'],
            [['crtd_dt', 'updt_dt','project_id','error','remarks','user_id','schedule_id','from','to'], 'safe'],
            [['schedule_id', 'work_hour', 'complate_percent'], 'string', 'max' => 50],
            [['timeline_date'], 'string', 'max' => 100],
            [['audit'], 'string', 'max' => 20],
        	//[['complate_percent'], 'compare', 'compareAttribute' => 'complate_percent','operator'=>'>','message'=>'complate percent must be greater than previous percent.'],
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
            'complate_percent' => 'Complete Percent',
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
    
    public function getProjectname(){
    	$id = $this["schedule_id"];
    	$task = Task::find()->where("task_id='$id'")->all();
    	
    	foreach ($task as $tasks){
    	$project = Project::find()->where("project_id='$tasks->project_id'")->one();
    	return	$project->project_no;
    	}
    }
}
