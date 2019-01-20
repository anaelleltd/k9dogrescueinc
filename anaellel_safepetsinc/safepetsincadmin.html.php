<doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Safe Pets Inc</title>
<link rel="stylesheet" type="text/css" href="css/safepetsinc.css">
</head>

<body>
    <div class="container">
        <?php include"template/template_contents_safepetsincadmin.php" 
    ?>
    <?php 
        echo $header;
    ?>
    <?php 
        echo $nav;
    ?>

    <main>
        <h1>Homepage</h1>
        <section>
            <h2> Home </h2>
            <p> <?php include"safepetsincindex.php"?> </p>
            <h3> Welcome to SAFE PETS inc.</h3>
            <p> This small website is dedicated to storing and retrieving information about charities and Not-for-profit organisations that look after Man's best friends: DOGS!<p>
            <p> Here you can submit various information about your organisation such as dogs, kennels, brand sponsors, staff and volunteers. We will create a content management system tailored to your database and/or website needs and look after all the necessary authentification and reporting procedures. 
            <br/> We also provide enhanced security features for sensitive records related to banking, clients/sponsors and administrators.</p>
            <p> Safe PETS inc is free to use and entirely managed by an enthusiastic trainee developer. We are always looking to connect prospective foster carers and pets in need of a new home. Feel free to <a href="mailto:akathak@anaelleltd.company?Subject=Safepetsincadmin" target="_top">contact</a> us to discuss your requirements and specifications.</p>
            <p> See you soon!</p>
        </section>
    </main>

       
     <?php 
        echo $footer;
    ?>
    </div>

</body>
</html>
