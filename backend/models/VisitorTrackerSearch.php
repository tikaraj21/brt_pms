<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\VisitorTracker;

/**
 * VisitorTrackerSearch represents the model behind the search form about `app\models\VisitorTracker`.
 */
class VisitorTrackerSearch extends VisitorTracker
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'is_bot'], 'integer'],
            [['country', 'city', 'date', 'time', 'ip', 'web_page', 'query_string', 'http_referer', 'http_user_agent'], 'safe'],
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
        $query = VisitorTracker::find();

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
            'id' => $this->id,
            'date' => $this->date,
            'time' => $this->time,
            'is_bot' => $this->is_bot,
        ]);

        $query->andFilterWhere(['like', 'country', $this->country])
            ->andFilterWhere(['like', 'city', $this->city])
            ->andFilterWhere(['like', 'ip', $this->ip])
            ->andFilterWhere(['like', 'web_page', $this->web_page])
            ->andFilterWhere(['like', 'query_string', $this->query_string])
            ->andFilterWhere(['like', 'http_referer', $this->http_referer])
            ->andFilterWhere(['like', 'http_user_agent', $this->http_user_agent]);

        return $dataProvider;
    }
}
