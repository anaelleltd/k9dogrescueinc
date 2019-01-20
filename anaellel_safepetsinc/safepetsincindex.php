<?php include_once $_SERVER['DOCUMENT_ROOT'] . '/anaellel_safepetsinc/includes/magicquotes.inc.php';

if (!isset($_COOKIE['visits']))
{
$_COOKIE['visits'] = 0;
}
$visits = $_COOKIE['visits'] + 1;
setcookie('visits', $visits, time() + 3600 * 24 * 365);
include 'welcome.html.php';
