<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Admin &mdash; Register</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

     <div class="wrap">
        <h1>StartNg-Contacts</h1>
        <section class="form-container">
            <h3>Create an Account</h3>
                       <form action="/storeadmin" method="POST" class="form-wrap">
                        {{ csrf_field() }}
                <div class="input-text">
                    <input type="text" name="name" placeholder=" Full-name">
                </div>
                <div class="input-text">
                    <input type="text" name="username" placeholder=" Username">
                </div>

                <div class="input-email">
                    <input type="text" name="email" placeholder=" Email Address">
                </div>
                <div class="input-password">
                    <input type="password" name="password" placeholder="Password">
                </div>
                <div class="input-text">
                    <input type="text" name="phone" placeholder="Phone">
                </div>
                

                <button type="submiit" name="reg" class="btn-sign-in">Sign Up</button>
                <p>Already have an account? <a href="login.html">Sign in here</a></p>
            </form>
        </section>
    </div>
</body>

</html>