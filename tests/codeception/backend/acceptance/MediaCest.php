<?php
/**
 * @link      http://www.writesdown.com/
 * @copyright Copyright (c) 2015 WritesDown
 * @license   http://www.writesdown.com/license/
 */

namespace tests\codeception\backend\acceptance;

use common\models\Media;
use tests\codeception\backend\_pages\_media\IndexPage;
use tests\codeception\backend\_pages\_media\UpdatePage;
use tests\codeception\backend\_pages\_site\LoginPage;
use tests\codeception\backend\AcceptanceTester;
use tests\codeception\common\fixtures\MediaCommentFixture;
use tests\codeception\common\fixtures\MediaFixture;
use tests\codeception\common\fixtures\MediaMetaFixture;
use yii\helpers\Url;

/**
 * Class MediaCept
 *
 * @author  Agiel K. Saputra <13nightevil@gmail.com>
 * @since   0.1.2
 */
class MediaCest
{
    /**
     * This method is called before each cest class test method
     *
     * @param AcceptanceTester $I
     */
    public function _before($I)
    {
        $this->loadFixtures();

        $loginPage = LoginPage::openBy($I);
        $loginPage->submit(['username' => 'editor', 'password' => 'editor']);
    }

    /**
     * This method is called after each cest class test method, even if test failed.
     *
     * @param AcceptanceTester $I
     */
    public function _after($I)
    {
    }

    /**
     * This method is called when test fails.
     *
     * @param AcceptanceTester $I
     */
    public function _failed($I)
    {
    }

    /**
     * @param AcceptanceTester $I
     */
    public function testIndex(AcceptanceTester $I)
    {
        $I->wantTo('ensure that index media works');
        $indexPage = IndexPage::openBy($I);
        $I->see('Media', 'h1');

        $I->amGoingTo('submit search form with non existing media');
        $indexPage->submit(['media_title' => 'non_existing_media']);
        $I->expectTo('not see a record');
        $I->see('No results found.', '#media-grid-view');

        $I->amGoingTo('submit search form with existing media');
        $indexPage->submit(['media_title' => 'media', 'media_slug' => '']);
        $I->expectTo('see media of which the title contains media');
        $I->see('media', '#media-grid-view');
        $I->dontSee('page', '#media-grid-view');
    }
    /**
     *
     * @param AcceptanceTester $I
     */
    public function testCreate(AcceptanceTester $I)
    {
        $I->wantTo('ensure that create media works');
        $I->amOnPage(Url::to(['/media/create']));
        $I->see('Add New Media', 'h1');
        $I->see('Add files...');
    }

    /**
     * @param AcceptanceTester $I
     */
    public function testUpdate(AcceptanceTester $I)
    {
        $I->wantTo('ensure that update page works');
        $updatePage = UpdatePage::openBy($I);
        $I->see('Update Media', 'h1');

        $I->amGoingTo('submit update media form');
        $updatePage->submit([
            'media_title'   => 'test123',
            'media_excerpt' => 'TEST QWERT'
        ]);
        $I->expect('media updated');

        Media::findOne(1)->updateAttributes(['media_title' => 'Test Media', 'media_excerpt' => 'Test Media Caption']);
    }

    /**
     * @param AcceptanceTester $I
     */
    public function testDelete(AcceptanceTester $I)
    {
        $I->wantTo('ensure that delete media works');
        IndexPage::openBy($I);
        $I->see('Media', 'h1');

        $I->seeElement('a[href="' . Url::to(['/media/delete', 'id' => 1]) . '"]');

        if(method_exists($I, 'acceptPopup') && method_exists($I, 'wait')){
            $I->click('a[href="' . Url::to(['/media/delete', 'id' => 1]) . '"]');
            $I->acceptPopup();
            $I->wait(3);

            $I->dontSee('Test Media', '#media-grid-view');

            $this->loadFixtures();
        }
    }

    /**
     * Load default fixture for media
     */
    protected function loadFixtures()
    {
        $mediaFixture = new MediaFixture();
        $mediaFixture->load();

        $mediaMetaFixture = new MediaMetaFixture();
        $mediaMetaFixture->load();

        $mediaCommentFixture = new MediaCommentFixture();
        $mediaCommentFixture->load();
    }
}
