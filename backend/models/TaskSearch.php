<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Task;

/**
 * TaskSearch represents the model behind the search form about `app\models\Task`.
 */
class TaskSearch extends Task
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['task_id', 'task_hour', 'status', 'crtd_by', 'updt_by', 'assign_to'], 'integer'],
            [['project_id', 'task_title', 'task_type', 'task_details', 'task_date', 'task_due_date', 'complate_percent', 'crtd_dt', 'updt_dt'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
    	if (Yii::$app->user->can('superadmin')
    			|| (Yii::$app->user->can('administrator')
    					&& !Yii::$app->authManager->checkAccess($model->id, 'administrator'))
    	) {
        $query = Task::find()->orderBy(['task_date'=>SORT_DESC]);
    	}else {
    		$id = Yii::$app->user->identity->id;
    		$query = Task::find()->where(['assign_to'=>$id])->orderBy(['task_date'=>SORT_DESC]);
    	}
        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'task_id' => $this->task_id,
        	'project_id' => $this->project_id,
            'task_hour' => $this->task_hour,
            'task_date' => $this->task_date,
            'task_due_date' => $this->task_due_date,
            'status' => $this->status,
            'crtd_by' => $this->crtd_by,
            'crtd_dt' => $this->crtd_dt,
            'updt_dt' => $this->updt_dt,
            'updt_by' => $this->updt_by,
            'assign_to' => $this->assign_to,
        ]);

        $query->andFilterWhere(['like', 'project_id', $this->project_id])
            ->andFilterWhere(['like', 'task_title', $this->task_title])
            ->andFilterWhere(['like', 'task_type', $this->task_type])
            ->andFilterWhere(['like', 'task_details', $this->task_details])
            ->andFilterWhere(['like', 'complate_percent', $this->complate_percent]);

        return $dataProvider;
    }
}
