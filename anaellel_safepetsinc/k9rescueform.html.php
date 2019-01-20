<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Add duty</title>
    <style type="text/css">
    textarea {
      display: block;
      width: 100%;
    }
    </style>
  </head>
  <body>
    <form action="?" method="post">
      <div>
        <label for="task">Task required here:</label>
        <textarea id="task" name="task" rows="3" cols="40"></textarea>
        <label for="due">Due date in the format YYYY-MM-DD:</label>
        <textarea id="due" name="due" rows="1" cols="10"></textarea>
      </div>
      <div><input type="submit" value="Add"></div>
    </form>
  </body>
</html>
