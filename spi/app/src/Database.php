<?php

namespace DatabasePage;
//Specify API extensions
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\DateField;
use SilverStripe\Forms\TextareaField;

use Page;

class DatabasePage extends Page
{
//Constraint page as child of Page.
	private static $can_be_root = false;

	private static $allowed_parents = [
        Page::class
    ];

//Create the database structure
  private static $db = [
    'Task' => 'Varchar(100)',
    'Deadline' => 'Date',
    'Dog' => 'Varchar(100)',
    'Volunteer' => 'Varchar(100)',
    'Details' => 'Text',
  ];

//Create CMS form fields for UI
  public function getCMSFields()
  {
    $fields = parent::getCMSFields();
    $fields->addFieldToTab('Root.Main', TextField::create('Task','Task to be completed'),'Content');
    $fields->addFieldToTab('Root.Main', DateField::create('Deadline','Task is due by'),'Content');
    $fields->addFieldToTab('Root.Main', TextField::create('Dog','Dog name'),'Content');
    $fields->addFieldToTab('Root.Main', TextField::create('Volunteer','Volunteer name'),'Content');
    $fields->addFieldToTab('Root.Main', TextareaField::create('Details')
     ->setDescription('This is a summary of important information about the task.'),
        'Content'
    );

    return $fields;
  }

}

