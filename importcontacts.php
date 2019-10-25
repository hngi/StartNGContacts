<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0-11/css/all.min.css">
    <link href="https://fonts.googleapis.com/css?family=Nunito&display=swap" rel="stylesheet">
    <title>Start NG</title>
    <style>
        body {
            font-family: Nunito;
            text-align: left;
    }
       p {
        font-size: 20px;
    } 

    </style>
</head>
<body>
    <p>The file you upload will need to contain the emails you want to add to this list.<br><strong>Warning:</strong>the file needs to be plain text.Do not upload binary files like word document.</p>
    <hr>
    <p> file containing emails:</p><form action="">
<input type="file" name="" id="" style="background-color: #44CF6C; border-color: #44CF6C;">
<hr>
<p > if you check the test output, you will get the list of parsed emails on the screen, and the database will not be filled with the information.<br> this is useful to find out wether the format of your file is correct,it will only show forat 50 records</p>
<hr>
<input type="checkbox" name="Test" value="">Test Output<br>
<hr>

<input type="checkbox" name="omit" value="">Omit Invalid
<hr>
<input type="checkbox">:<strong>I prefer to emails in HTML format</strong>
<br>
</div>
<button type="button" class="btn btn-primary ml-1 pl-5 pr-5" style="background-color: #44CF6C; border-color: #44CF6C;">import</button>
</form>
</body>
</html> 
