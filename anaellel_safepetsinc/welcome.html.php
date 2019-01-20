<?php include_once $_SERVER['DOCUMENT_ROOT'] .'/anaellel_safepetsinc/includes/helpers.inc.php'; ?>
<doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Joke CMS</title>
<link rel="stylesheet" type="text/css" href="css/safepetsinc.css">
</head>

<body>
    <div class="container">
        <?php include"template/template_contents_safepetsincadmin.php" 
    ?>

    <main>
    	<p id="cookiecounter"><?php
        if ($visits > 1)
        {
            echo "You have visited us $visits times.";
        }
        else
        {
            // First visit
            echo 'You have entered the SAFE PETS inc abode. Click <a href="safepetsincadmin.html.php"> here </a> to continue';
        }
        ?></p>
    </main>
    </div>

</body>
</html>
