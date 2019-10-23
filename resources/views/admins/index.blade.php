<!DOCTYPE html>
<html>
<head>
   
</head>
<body>
 
<h1>All Information About admins</h1>
 
@foreach ($admins as $admin)
<li> {{ $admin}}  </li>
@endforeach
 
<h1>Only userNames,password Of admins</h1>
 
@foreach ($admins as $admin)
 
<li> {{ $admin->name}}  </li>
<li> {{ $admin->password}}  </li>
 
@endforeach
 

 
</body>
</html>