<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Schedule;

/**
 * ScheduleSearch represents the model behind the search form about `app\models\Schedule`.
 */
class ScheduleSearch extends Schedule
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['schedule_id', 'remarks', 'status', 'crtd_by', 'updt_by'], 'integer'],
            [['task_id', 'schedule_date', 'schedule_hour', 'complate_percent', 'crtd_dt', 'updt_dt'], 'safe'],
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
        $query = Schedule::find();

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
            'schedule_id' => $this->schedule_id,
            'remarks' => $this->remarks,
            'status' => $this->status,
            'crtd_by' => $this->crtd_by,
            'crtd_dt' => $this->crtd_dt,
            'updt_dt' => $this->updt_dt,
            'updt_by' => $this->updt_by,
        ]);

        $query->andFilterWhere(['like', 'task_id', $this->task_id])
            ->andFilterWhere(['like', 'schedule_date', $this->schedule_date])
            ->andFilterWhere(['like', 'schedule_hour', $this->schedule_hour])
            ->andFilterWhere(['like', 'complate_percent', $this->complate_percent]);

        return $dataProvider;
    }
}
