<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Auditlog;

/**
 * AuditlogSearch represents the model behind the search form about `app\models\Auditlog`.
 */
class AuditlogSearch extends Auditlog
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['auditlog_id'], 'integer'],
            [['datetime', 'type', 'description', 'user_id'], 'safe'],
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
        $query = Auditlog::find()->orderBy(['datetime' => SORT_DESC]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }
      
        $query->andFilterWhere([
            'auditlog_id' => $this->auditlog_id,
            'datetime' => $this->datetime,
        	
        ]);

        $query->andFilterWhere(['like', 'type', $this->type])

        ->andFilterWhere(['like', 'description', $this->description]);

        return $dataProvider;
    }
}
