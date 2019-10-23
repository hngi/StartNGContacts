<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
  <link rel="stylesheet" href="style.css">
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <title>StartngContact</title>
  
</head>




<body>

  <!--Header-->

   <header class="top-header" role="banner">
         <nav class="navbar navbar-light bg-light fixed-top">
        <a class="navbar-brand" href="#">
            Start-Ng-Contacts
        </a>
    </nav>

    </header>
  <style>
  th,td {
    
    word-wrap: break-word;
}
li{

  style="list-style-type: none; margin: 0;padding: 0; display:inline;
}

</style>


<nav class="navbar navbar-default">
  <div class="container-fluid">
    
    <ul class="nav nav-pills">
      <li style="list-style-type: none; margin: 0;padding: 0; display:inline; class="active"><a href="/addcontacts">AddContact</a></li>
     
    
      <li><a href="/dashboard">Contact Actions</a></li>
    </ul>
  </div>
</nav>

    <div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
                    <div class="panel panel-danger">
                        <div class="panel-body">
                            <form action="/storecategory" method="POST" style="display: inline" id="reused_form">
                                 {{ csrf_field() }}
                                 <div class="form-group">
                                     <label>Add contacts group</label>
                                     <input type="text" name="name" class="form-control" placeholder="group name">
                                 </div>
                                 
                                 <div class="form-group">
                                     <button class="btn btn-raised btn-block btn-success">GO</button>
                                 </div>
                            </form>
                           
                            
                        </div>
                    </div>
   
  
                    <div class="panel panel-danger">
                        <div class="panel-body">
                            <form style="display: inline" id="reused_form">
                                 <div class="form-group">
                                     <label>Fetch contacts group</label>
                                     <input type="text" name="name" class="form-control" placeholder="select group">
                                 </div>
                                 
                                 <div class="form-group">
                                     <button class="btn btn-raised btn-block btn-success">GO</button>
                                 </div>
                            </form>
                           
                            
                        </div>
                    </div>
                
                    
<br>
<br>
   <section id="posts">
    <div class="container">

     



      <div class="row">
        <div class="col-md-3">
          <div class="card text-center text-white mb-3" style="background-color: #76323f;">
            <div class="card-body">
              <h3>All Contacts</h3>
              <h4 class="dispaly-4">
                <i class="far fa-address-card"></i></i> 20
              </h4>
              <a href="all.html" class="btn btn-outline-light btn-sm">View</a>
                      <a href="#" class="btn btn-block text-white" data-toggle="modal" data-target="#addMentorModal" style="background-color: #D7CEc7;">
              <i class="fas fa-mail"></i>Send Mail
            </a>
            </div>
          </div>

      </div></div></section>
  <!--Post-->
  <section id="posts">
    <div class="container">
      <div class="row">

        <div class="col-md-9 col-sm-3">
          <div class="card">
            <div class="card-header">
                 
              
          
            </div>
          </div>
            <table class="table table-striped">
              <thead class="thead-dark">
                <tr>
                  <th>S/N</th>
                  <th>Name</th>
                  <th>Phone No</th>
                  <th>Email</th>
                  <th>Group</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>Koiki Shakirat Adeyinka</td>
                  <td>+234 - 8082652626</td>
                  <td>kshakirat0@gmail.com</td>
                  <td>FE</td>
                </tr>
                <tr>
                    <td>2</i></td>
                    <td>Adeyinka Koiki Shakirat</td>
                    <td>+234 - 8082652626</td>
                    <td>May 30 2019</td>
                    <td>BE</td>
                  </tr>

                  <tr>
                    <td>3</i></td>
                    <td>Adeyinka Koiki Shakirat</td>
                    <td>+234 - 8082652626</td>
                    <td>May 30 2019</td>
                    <td>BE</td>
                  </tr>

                  <tr>
                    <td>4</td>
                    <td>Koiki Shakirat Adeyinka</td>
                    <td>+234 - 8082652626</td>
                    <td>kshakirat0@gmail.com</td>
                    <td>FE</td>
                  </tr>

                  <tr>
                    <td>5</td>
                    <td>Koiki Shakirat Adeyinka</td>
                    <td>+234 - 8082652626</td>
                    <td>kshakirat0@gmail.com</td>
                    <td>FE</td>
                  </tr>

                 
              </tbody>
            </table>
          </div>
        </div>

        


            

        </div>
      </div>
    </div>
  </section>


  <!--Modals for the add section-->

  <div class="modal fade" id="addAllModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header text-white" style="background-color: #565656;">
          <h5 class="modal-title">Add Contacts</h5>
          <button class="close text-white" data-dismiss="modal">
            <span>&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <form>
                <div class="form-group">
                    <label for="title">Add a form for Contacts here</label>
                    <input type="text" class="form-control">
                </div>
            </form>
        </div>
        <div class="modal-footer">
          <button class="btn text-white " data-dismiss="modal" style="background-color: #565656;">Send mails</button>
        </div>
      </div>
    </div>
  </div>

    <div class="modal fade" id="addMentorModal">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header text-white" style="background-color: #76323f">
              <h5 class="modal-title">Add Mentors</h5>
              <button class="close" data-dismiss="modal">
                <span>&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form>
                <div class="form-group">
                  <label for="title">Add a form for prospects here ( in this modal )</label>
                  <input type="text" class="form-control">
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button class="btn text-white" data-dismiss="modal" style="background-color: #76323f" >Send Mails</button>
            </div>
          </div>
        </div>
      </div>




  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
    crossorigin="anonymous"></script>
  <script src="https://cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>

</body>

</html>