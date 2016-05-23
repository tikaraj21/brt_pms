<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Project;

/**
 * ProjectSearch represents the model behind the search form about `app\models\Project`.
 */
class ProjectSearch extends Project
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['project_id', 'client_id', 'status', 'crtd_by', 'updt_by'], 'integer'],
            [['project_no', 'project_title', 'project_type', 'project_details', 'project_date', 'project_due_date', 'complate_percent', 'crtd_dt', 'updt_dt'], 'safe'],
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
    	
    		$query = Project::find()->orderBy(['project_date'=>SORT_DESC]);
    	
    		
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
            'project_id' => $this->project_id,
            'client_id' => $this->client_id,
            'project_date' => $this->project_date,
            'project_due_date' => $this->project_due_date,
            'status' => $this->status,
            'crtd_by' => $this->crtd_by,
            'crtd_dt' => $this->crtd_dt,
            'updt_dt' => $this->updt_dt,
            'updt_by' => $this->updt_by,
        ]);

        $query->andFilterWhere(['like', 'project_no', $this->project_no])
            ->andFilterWhere(['like', 'project_title', $this->project_title])
            ->andFilterWhere(['like', 'project_type', $this->project_type])
            ->andFilterWhere(['like', 'project_details', $this->project_details])
            ->andFilterWhere(['like', 'complate_percent', $this->complate_percent]);

        return $dataProvider;
    }
    
    public function searchreport($paramsfrom,$paramsto)
    {
    	$query = Project::find()->where("project_date between '$paramsfrom' and '$paramsto'")->orderBy(['project_date'=>SORT_DESC]);
    
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
    			'project_id' => $this->project_id,
    			'client_id' => $this->client_id,
    			'project_date' => $this->project_date,
    			'project_due_date' => $this->project_due_date,
    			'status' => $this->status,
    			'crtd_by' => $this->crtd_by,
    			'crtd_dt' => $this->crtd_dt,
    			'updt_dt' => $this->updt_dt,
    			'updt_by' => $this->updt_by,
    	]);
    
    	$query->andFilterWhere(['like', 'project_no', $this->project_no])
    	->andFilterWhere(['like', 'project_title', $this->project_title])
    	->andFilterWhere(['like', 'project_type', $this->project_type])
    	->andFilterWhere(['like', 'project_details', $this->project_details])
    	->andFilterWhere(['like', 'complate_percent', $this->complate_percent]);
    
    	return $dataProvider;
    }
    
    public function searchfromtask($params)
    {
    	$query = Project::find()->where("project_id='$params'");
    
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
    			'project_id' => $this->project_id,
    			'client_id' => $this->client_id,
    			'project_date' => $this->project_date,
    			'project_due_date' => $this->project_due_date,
    			'status' => $this->status,
    			'crtd_by' => $this->crtd_by,
    			'crtd_dt' => $this->crtd_dt,
    			'updt_dt' => $this->updt_dt,
    			'updt_by' => $this->updt_by,
    	]);
    
    	$query->andFilterWhere(['like', 'project_no', $this->project_no])
    	->andFilterWhere(['like', 'project_title', $this->project_title])
    	->andFilterWhere(['like', 'project_type', $this->project_type])
    	->andFilterWhere(['like', 'project_details', $this->project_details])
    	->andFilterWhere(['like', 'complate_percent', $this->complate_percent]);
    
    	return $dataProvider;
    }
}
