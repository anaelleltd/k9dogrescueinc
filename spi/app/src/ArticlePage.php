<?php
namespace ArticlePage;
//Specify API extensions
use SilverStripe\Forms\DateField;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\TextField;
use SilverStripe\Assets\Image;
use SilverStripe\Assets\File;
use SilverStripe\AssetAdmin\Forms\UploadField;

use Page;

class ArticlePage extends Page
{
//Constraint page as child of Article Holder.
  private static $can_be_root = false;
  private static $allowed_parents = [
        ArticleHolder::class
    ];

//Create the database
  private static $db = [
    'Date' => 'Date',
    'Teaser' => 'Text',
    'Writer' => 'Varchar',
    'Tag' => 'Varchar',
  ];

//Set up a specific class for attaching photos
  private static $has_one = [
        'Photo' => Image::class,
    ];

//Set up ownership to restrict database use
  private static $owns = [
        'Photo',
    ];

//Create CMS form fields for UI
  public function getCMSFields()
  {
    $fields = parent::getCMSFields();
    $fields->addFieldToTab('Root.Main', DateField::create('Date','Date of article'), 'Content');
    $fields->addFieldToTab('Root.Main', TextareaField::create('Teaser')
     ->setDescription('This is the summary that appears on the article list page.'),
        'Content'
    );
    $fields->addFieldToTab('Root.Main', TextField::create('Writer','Writer of article'),'Content');
    $fields->addFieldToTab('Root.Main', TextField::create('Tag','Tag for article'),'Content');

    $fields->addFieldToTab('Root.Attachments', $Photo = UploadField::create('Photo'));

//Set up default folder
    $Photo->setFolderName('articles-photos');

    return $fields;
  }
  
}
