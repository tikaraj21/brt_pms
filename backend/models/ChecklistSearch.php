<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Checklist;

/**
 * ChecklistSearch represents the model behind the search form about `app\models\Checklist`.
 */
class ChecklistSearch extends Checklist
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cheklist_id', 'remarks', 'status', 'crtd_by', 'updt_by', 'error', 'chek_by'], 'integer'],
            [['schedule_id', 'cheklist_date', 'cheklist_hour', 'crtd_dt', 'updt_dt', 'cheklist_title'], 'safe'],
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
        $query = Checklist::find();

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
            'cheklist_id' => $this->cheklist_id,
            'remarks' => $this->remarks,
            'status' => $this->status,
            'crtd_by' => $this->crtd_by,
            'crtd_dt' => $this->crtd_dt,
            'updt_dt' => $this->updt_dt,
            'updt_by' => $this->updt_by,
            'error' => $this->error,
            'chek_by' => $this->chek_by,
        ]);

        $query->andFilterWhere(['like', 'schedule_id', $this->schedule_id])
            ->andFilterWhere(['like', 'cheklist_date', $this->cheklist_date])
            ->andFilterWhere(['like', 'cheklist_hour', $this->cheklist_hour])
            ->andFilterWhere(['like', 'cheklist_title', $this->cheklist_title]);

        return $dataProvider;
    }
}
