<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>List of duties</title>
    <link rel="stylesheet" type="text/css" href="css/safepetsinc.css">
  </head>
  <body>
    <div class="container">
        <?php include"template/template_contents_safepetsincadmin.php" 
    ?>

    <main>
    <section>
    <p><a href="?addduty">Add a duty</a></p>
    <p>Here are all the duties in the database:</p>
    <table border="1">
      <thead>
        <tr>
        <th>Task</th> 
        <th>Due</th> 
        <th>Dog </th>
        <th>Volunteer </th>
      </tr>
    </thead>
    <tbody>
        <?php foreach ($duties as $duty): ?>
          <tr>
            <td><?php echo htmlspecialchars($duty['task'], ENT_QUOTES, 'UTF-8'); ?> </td>
            <td><?php echo htmlspecialchars($duty['due'], ENT_QUOTES, 'UTF-8'); ?></td>
            <td><?php echo htmlspecialchars($duty['dog'], ENT_QUOTES, 'UTF-8'); ?></td>
            <td><?php echo htmlspecialchars($duty['volunteer'], ENT_QUOTES, 'UTF-8'); ?></td>
            <td>
          <form action="?deleteduty" method="post">
          <div>
            <input type="hidden" name="id" value="<?php echo $duty['task']; ?>">
            <input type="submit" value="Delete">
          </div>
        </form>
      </td>
    </tr>
  <?php endforeach; ?>
  </tbody>
</table>
  </section>
</main>
<p> <a href="database.html.php">Return to main Database page</a></p>
</div>
  </body>
</html>
