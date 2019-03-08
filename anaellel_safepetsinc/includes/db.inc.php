<?php
try
{
  $pdo = new PDO('mysql:host=localhost;dbname=anaellel_safepetsinc', 'anaellel_k9', 'xxxx');
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  $pdo->exec('SET NAMES "utf8"');
  echo '<p id="success">Database connection established.</p>';
}
catch (PDOException $e)
{
  $error = '<p id="error">Unable to connect to the database server.</p>';
  include 'error.html.php';
  exit();
}

