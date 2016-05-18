<?php

use yii\db\Schema;

/**
 * Class m000000_000018_menu
 *
 * @author Agiel K. Saputra <13nightevil@gmail.com>
 * @since  0.1.0
 */
class m000000_000018_client extends \yii\db\Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $tableOptions = null;

        if ($this->db->driverName === 'mysql') {
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB';
        }

        $this->createTable('{{%client}}', [
            'client_id'            => Schema::TYPE_PK,
            'client_name'    => Schema::TYPE_STRING . '(155)',
            'mobile' => Schema::TYPE_STRING . '(100)',
        	'email'    => Schema::TYPE_STRING . '(55)',
        	'phone' => Schema::TYPE_STRING . '(100)',
        	'address'    => Schema::TYPE_STRING . '(55)',
        	'status' => Schema::TYPE_INTEGER . '(11)',
        	'order' => Schema::TYPE_INTEGER . '(11)',
        ], $tableOptions);
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
        $this->dropTable('{{%client}}');
    }
}
