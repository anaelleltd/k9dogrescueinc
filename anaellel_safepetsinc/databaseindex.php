<?php include_once $_SERVER['DOCUMENT_ROOT'] . '/anaellel_safepetsinc/includes/magicquotes.inc.php';

// Creating duties in database: form
if (isset($_GET['addduty']))
{
  include 'k9rescueform.html.php';
  exit();
}

/*
// Creating duties in database: insert
if (isset($_POST['task']))
{
  include $_SERVER['DOCUMENT_ROOT'] . '/anaellel_safepetsinc/includes/db.inc.php';
  try
  {
    $sql = 'INSERT INTO DUTIES SET
        duty_task = :duty_task,
        date_set = CURDATE(),
        date_due = :date_due,
        dog_name = :dog_name,
        staff_id = :staff_id,
        volunteer_nik = :volunteer_nik';
    $s = $pdo->prepare($sql);
    $s->bindValue(':duty_task', $_POST['task']);
    $s->bindValue(':date_due', $_POST['due']);
    $s->bindValue(':dog_name', $_POST['dog']);
    $s->bindValue(':staff_id', $_POST['staff']);
    $s->bindValue(':volunteer_nik', $_POST['volunteer']);
    $s->execute();
  }
  catch (PDOException $e)
  {
    $error = 'Error adding submitted task: ' . $e->getMessage();
    include 'error.html.php';
    exit();
  }

  header('Location: .');
  exit();
}


// Deleting duties from database
if (isset($_GET['deleteduty']))
{
  include $_SERVER['DOCUMENT_ROOT'] . '/anaellel_safepetsinc/includes/db.inc.php';
  try
  {
    $sql = 'DELETE * FROM DUTIES WHERE duty_task = :duty_task';
    $s = $pdo->prepare($sql);
    $s->bindValue(':duty_task', $_POST['task']);
    $s->bindValue(':date_due', $_POST['due']);
    $s->bindValue(':dog_name', $_POST['dog']);
    $s->bindValue(':staff_id', $_POST['staff']);
    $s->bindValue(':volunteer_nik', $_POST['volunteer']);
    $s->execute();
  }
  catch (PDOException $e)
  {
    $error = 'Error deleting task: ' . $e->getMessage();
    include 'error.html.php';
    exit();
  }

  header('Location: .');
  exit();
} */

// Retrieving duties from database
include $_SERVER['DOCUMENT_ROOT'] . '/anaellel_safepetsinc/includes/db.inc.php';
try
{
  $sql = 'SELECT duty_task, date_due, dog_name, volunteer_nik FROM DUTIES';
  $result = $pdo->query($sql);
}
catch (PDOException $e)
{
  $error = 'Error fetching tasks: ' . $e->getMessage();
  include 'error.html.php';
  exit();
}

while ($row = $result->fetch())
{
  $duties[] = array('task' => $row['duty_task'], 'due' => $row['date_due'], 'dog' => $row['dog_name'], 'volunteer' => $row['volunteer_nik']);
}

include 'k9rescue.html.php';
