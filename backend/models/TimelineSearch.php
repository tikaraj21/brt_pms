<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Timeline;

/**
 * TimelineSearch represents the model behind the search form about `app\models\Timeline`.
 */
class TimelineSearch extends Timeline
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['timeline_id', 'remarks', 'status', 'crtd_by', 'updt_by', 'error', 'audit_by','user_id'], 'integer'],
            [['schedule_id', 'timeline_date', 'work_hour', 'complate_percent', 'crtd_dt', 'updt_dt', 'audit','user_id'], 'safe'],
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
        $query = Timeline::find()->orderBy(['timeline_date'=>SORT_DESC]);
    	}
    	else {
    		$id = Yii::$app->user->identity->id;
    		$query = Timeline::find()->where("user_id='$id' || audit_by='$id'");
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
            'timeline_id' => $this->timeline_id,
            'remarks' => $this->remarks,
            'status' => $this->status,
            'crtd_by' => $this->crtd_by,
            'crtd_dt' => $this->crtd_dt,
            'updt_dt' => $this->updt_dt,
            'updt_by' => $this->updt_by,
            'error' => $this->error,
            'audit_by' => $this->audit_by,
        	'user_id' => $this->user_id,
        ]);

        $query->andFilterWhere(['like', 'schedule_id', $this->schedule_id])
            ->andFilterWhere(['like', 'timeline_date', $this->timeline_date])
            ->andFilterWhere(['like', 'work_hour', $this->work_hour])
            ->andFilterWhere(['like', 'complate_percent', $this->complate_percent])
            ->andFilterWhere(['like', 'user_id', $this->user_id])
            ->andFilterWhere(['like', 'audit', $this->audit]);

        return $dataProvider;
    }
    
    public function searchs($paramsfrom,$paramsto)
    {
    	if (Yii::$app->user->can('superadmin')
    			|| (Yii::$app->user->can('administrator')
    					&& !Yii::$app->authManager->checkAccess($model->id, 'administrator'))
    	) {
    		$query = Timeline::find()->where("timeline_date between '$paramsfrom' and '$paramsto'")->orderBy(['timeline_date'=>SORT_DESC]);
    	}
    	else {
    		$id = Yii::$app->user->identity->id;
    		$query = Timeline::find()->where("user_id='$id' || audit_by='$id'");
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
    			'timeline_id' => $this->timeline_id,
    			'remarks' => $this->remarks,
    			'status' => $this->status,
    			'crtd_by' => $this->crtd_by,
    			'crtd_dt' => $this->crtd_dt,
    			'updt_dt' => $this->updt_dt,
    			'updt_by' => $this->updt_by,
    			'error' => $this->error,
    			'audit_by' => $this->audit_by,
    			'user_id' => $this->user_id,
    	]);
    
    	$query->andFilterWhere(['like', 'schedule_id', $this->schedule_id])
    	->andFilterWhere(['like', 'timeline_date', $this->timeline_date])
    	->andFilterWhere(['like', 'work_hour', $this->work_hour])
    	->andFilterWhere(['like', 'complate_percent', $this->complate_percent])
    	->andFilterWhere(['like', 'user_id', $this->user_id])
    	->andFilterWhere(['like', 'audit', $this->audit]);
    
    	return $dataProvider;
    }
}
