<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Start-Ng-Contacts&mdash; Login</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <link rel="stylesheet" href="style.css"> -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">

    <!-- CSS -->
    <style>
        * {
            padding: 0;
            margin: 0;
            font-family: 'Open Sans', sans-serif;
        }

        body {
            background-image: url('hero.jpg');
            background-position: left;
            background-size: cover;
            background-attachment: fixed;
            height: auto;
            overflow: hidden;
        }

        .navbar-brand {
            font-family: 'Open Sans', sans-serif;
            font-weight: bold;
            letter-spacing: 2px;
        }
        

        .form-container {
            /* width: 25%; */
            /* height: 300px; */
            padding: 2em;
            margin: 15em auto;
            background: #ecf0f1;
        }

        label {
            margin: 0;
        }
        
        
    </style>

</head>

<body>
    <nav class="navbar navbar-light bg-light fixed-top">
        <a class="navbar-brand" href="#">
            Start-Ng-Contacts
        </a>
    </nav>

    <div class="hero-container">
        <div class="row justify-content-md-center"></div>
            <section class="form-container col-md-3">
                <h5 class="pb-3 text-center font-weight-bold">WELCOME</h3>
                <form action="index.php" method="post">
                    <div class="form-group">
                        <label for=""><small>Email Address</small></label>
                        <input type="text" name="email" placeholder="Email Address" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for=""><small>Password</small></label>
                        <input type="password" name="password" placeholder="Password" class="form-control">
                    </div>
    
                    <button type="submit" name="log" class="btn btn-primary w-100">Sign in</button>
                    <div class="text-center pt-3">
                        <small>Don't have an account? <a href="signup.html">Sign up here</a></small>
                    </div>
                </form>
            </section>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>

</html>
