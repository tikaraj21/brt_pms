<?php

namespace app\models;

use Yii;
use common\models\User;

/**
 * This is the model class for table "wd_task".
 *
 * @property integer $task_id
 * @property string $project_id
 * @property string $task_title
 * @property string $task_type
 * @property integer $task_hour
 * @property string $task_details
 * @property string $task_date
 * @property string $task_due_date
 * @property integer $status
 * @property string $complate_percent
 * @property integer $crtd_by
 * @property string $crtd_dt
 * @property string $updt_dt
 * @property integer $updt_by
 * @property integer $assign_to
 */
class Task extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pms_task';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
        	[['project_id','task_title', 'task_due_date','task_hour', 'assign_to'], 'required'],
            [['task_hour', 'status', 'crtd_by', 'updt_by', 'assign_to'], 'integer'],
            [['task_details'], 'string'],
            [['task_date', 'task_due_date', 'crtd_dt', 'updt_dt'], 'safe'],
            [['project_id', 'task_type', 'complate_percent'], 'string', 'max' => 50],
            [['task_title'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'task_id' => 'Task ID',
            'project_id' => 'Project',
            'task_title' => 'Task Title',
            'task_type' => 'Task Type',
            'task_hour' => 'Task Hour',
            'task_details' => 'Task Details',
            'task_date' => 'Task Date',
            'task_due_date' => 'Task Due Date',
            'status' => 'Status',
            'complate_percent' => 'Complate Percent',
            'crtd_by' => 'Crtd By',
            'crtd_dt' => 'Crtd Dt',
            'updt_dt' => 'Updt Dt',
            'updt_by' => 'Updt By',
            'assign_to' => 'Assign To',
        ];
    }
    
    public function getproject(){
    	return $this->hasOne(Project::className(), ['project_id'=>'project_id']);
    }
    
    public function getuser(){
    	return $this->hasOne(User::className(), ['id'=>'assign_to']);
    }
    
}
