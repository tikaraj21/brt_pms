<?php
/**
 * @link      http://www.writesdown.com/
 * @copyright Copyright (c) 2015 WritesDown
 * @license   http://www.writesdown.com/license/
 */

namespace tests\codeception\backend\functional;

use common\models\PostType;
use common\models\search\Taxonomy;
use tests\codeception\backend\_pages\_posttype\CreatePage;
use tests\codeception\backend\_pages\_posttype\UpdatePage;
use tests\codeception\backend\_pages\_site\LoginPage;
use tests\codeception\backend\_pages\_posttype\IndexPage;
use tests\codeception\backend\FunctionalTester;
use tests\codeception\common\fixtures\PostCommentFixture;
use tests\codeception\common\fixtures\PostFixture;
use tests\codeception\common\fixtures\PostTypeFixture;
use tests\codeception\common\fixtures\PostTypeTaxonomyFixture;
use tests\codeception\common\fixtures\TaxonomyFixture;
use tests\codeception\common\fixtures\TermFixture;
use tests\codeception\common\fixtures\TermRelationshipFixture;
use yii\helpers\Url;

/**
 * Class PostTypeCest
 *
 * @author  Agiel K. Saputra <13nightevil@gmail.com>
 * @since   0.1.2
 */
class PostTypeCest
{
    /**
     * This method is called before each cest class test method
     *
     * @param FunctionalTester $I
     */
    public function _before($I)
    {
        $this->loadFixtures();

        $loginPage = LoginPage::openBy($I);
        $loginPage->submit(['username' => 'administrator', 'password' => 'administrator']);
    }

    /**
     * This method is called after each cest class test method, even if test failed.
     *
     * @param FunctionalTester $I
     */
    public function _after($I)
    {
    }

    /**
     * This method is called when test fails.
     *
     * @param FunctionalTester $I
     */
    public function _failed($I)
    {
    }

    /**
     * @param FunctionalTester $I
     */
    public function testIndex(FunctionalTester $I)
    {
        $I->wantTo('ensure that index post-type works');
        $indexPage = IndexPage::openBy($I);
        $I->see('Post Types', 'h1');

        $I->amGoingTo('submit search form with non existing post-type');
        $indexPage->submit(['post_type_name' => 'non_existing_post_type']);
        $I->expectTo('not see a record');
        $I->see('No results found.', '#post-type-grid-view');

        $I->amGoingTo('submit search form with existing post-type');
        $indexPage->submit(['post_type_name' => 'post', 'post_type_slug' => '']);
        $I->expectTo('see user with username subscriber');
        $I->see('post', '#post-type-grid-view');
        $I->dontSee('page', '#post-type-grid-view');
    }

    /**
     * @param FunctionalTester $I
     */
    public function testView(FunctionalTester $I)
    {
        $I->wantTo('ensure that view post-type works');

        $I->amOnPage(Url::to(['/post-type/view', 'id' => 1]));
        $I->see('View Post Type: Post', 'h1');
        $I->see('Taxonomies', 'h3');

        $I->amOnPage(Url::to(['/post-type/view', 'id' => 2]));
        $I->see('View Post Type: Page', 'h1');
        $I->dontSee('Taxonomies', 'h3');
    }

    /**
     * @param FunctionalTester $I
     */
    public function testCreate(FunctionalTester $I)
    {
        $I->wantTo('ensure that create post-type works');
        $createPage = CreatePage::openBy($I);
        $I->see('Add New Post Type', 'h1');

        // Test empty data
        $I->amGoingTo('submit form post-type with no data');
        $createPage->submitPostType([]);
        $I->expectTo('see validation errors');
        $I->see('Name cannot be blank.', '.help-block');
        $I->see('Singular Name cannot be blank.', '.help-block');
        $I->see('Plural Name cannot be blank.', '.help-block');

        // Test same data
        $I->amGoingTo('submit form post-type with existing data');
        $createPage->submitPostType([
            'post_type_name' => 'post',
            'post_type_slug' => 'post',
            'post_type_pn'   => 'Post',
            'post_type_sn'   => 'Posts'
        ]);
        $I->expectTo('see validation errors');
        $I->see('Name "post" has already been taken.', '.help-block');
        $I->see('Slug "post" has already been taken.', '.help-block');

        // Test correct data
        $I->amGoingTo('submit form post-type with correct data');
        $I->selectOption('#posttype-post_type_permission', 'author');
        $createPage->submitPostType([
            'post_type_name' => 'test-post-type',
            'post_type_slug' => 'test-post-type',
            'post_type_sn'   => 'Test Post Type',
            'post_type_pn'   => 'Test Post Types',
        ]);
        $I->expect('new post-type created');
        // $I->see('View Post Type: Test Post Type', 'h1');
        $I->see('View Post Type: Test Post Type');

        PostType::deleteAll(['post_type_name' => 'test-post-type']);
        Taxonomy::deleteAll(['taxonomy_name' => 'test-taxonomy']);
    }

    /**
     * @param FunctionalTester $I
     */
    public function testUpdate(FunctionalTester $I)
    {
        $I->wantTo('ensure that create post-type works');
        $updatePage = UpdatePage::openBy($I);
        $I->see('Update Post Type: Post', 'h1');

        $I->amGoingTo('submit post-type form with correct data');
        $I->checkOption('#posttype-post_type_smb');
        $I->selectOption('#posttype-post_type_permission', 'subscriber');
        $updatePage->submitPostType([
            'post_type_description' => 'New post-type description',
        ]);
        $I->expectTo('post-type updated');
        // $I->see('View Post Type: Post', 'h1');
        $I->see('View Post Type: Post');

        PostType::findOne(1)->update(['post_type_smb' => '0', 'post_type_permission' => 'contributor', 'post_type_description' => '']);
        Taxonomy::deleteAll(['taxonomy_name' => 'test-taxonomy']);
    }

    /**
     * @param FunctionalTester $I
     */
    public function testDelete(FunctionalTester $I)
    {
        $I->wantTo('ensure that delete post-type works');
        IndexPage::openBy($I);
        $I->see('Post Types', 'h1');

        $I->seeElement('a[href="' . Url::to(['/post-type/delete', 'id' => 1]) . '"]');

        // Delete only works on acceptance test [JS]
    }

    /**
     * Load needed fixtures
     */
    protected function loadFixtures()
    {
        $postTypeFixture = new PostTypeFixture();
        $postTypeFixture->load();

        $taxonomyFixture = new TaxonomyFixture();
        $taxonomyFixture->load();

        $postTypeTaxonomyFixture = new PostTypeTaxonomyFixture();
        $postTypeTaxonomyFixture->load();

        $termFixture = new TermFixture();
        $termFixture->load();

        $postFixture = new PostFixture();
        $postFixture->load();

        $termRelationshipFixture = new TermRelationshipFixture();
        $termRelationshipFixture->load();

        $postCommentFixture = new PostCommentFixture();
        $postCommentFixture->load();
    }
}
