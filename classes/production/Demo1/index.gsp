<!doctype html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>Transit by TEMPLATED</title>

    <asset:stylesheet src="skel.css"/>
    <asset:stylesheet src="style.css"/>
    <asset:stylesheet src="style-xlarge.css"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <!--[if lte IE 8]>
<script src="js/html5shiv.js"></script>
<![endif]-->

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    %{--<asset:javascript src="jquery.min.js"/>
     <asset:javascript src="skel.min.js"/>
     <asset:javascript src="skel-layers.min.js"/>
     <asset:javascript src="init.js"/>--}%

    <script src="grails-app/assets/javascripts/jquery.min.js" type="text/javascript"></script>
    <script src="grails-app/assets/javascripts/skel.min.js" type="text/javascript"></script>
    <script src="grails-app/assets/javascripts/skel-layers.min.js" type="text/javascript"></script>
    <script src="grails-app/assets/javascripts/init.js" type="text/javascript"></script>

    %{--<noscript>--}%



    <link rel="stylesheet" href="skel.css" />
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="style-xlarge.css" />
    %{--</noscript>--}%
</head>
<body class="landing">


<!-- Banner -->
<section id="banner">
    <h2>Attendance Track</h2>

    <!-- <ul class="actions">
					<li>
						<a href="#" class="button big">Lorem ipsum dolor</a>
					</li>
				</ul> -->
</section>


<!-- Header -->
<header id="header">
    <h1>Welcome</h1>
    <nav id="nav">
        <ul>
            <li><a href="generic.html">About</a></li>
            <li><a href="elements.html">Contact Us</a></li>
            <!-- <div class="collapse navbar-collapse" id="myNavbar"> -->

            <li><a data-toggle="modal" data-target="#login" class="button special"><span class="glyphicon glyphicon-log-in"></span> Log in</a></li>
            <li><a data-toggle="modal" data-target="#signup" class="button special"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        </ul>
    </nav>
</header>

<!--Login Modal -->
<div class="modal fade" id="login" role="dialog" style="color:#0000FF">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <!--<div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>-->
            <div class="modal-body" >
                <form action="/login/authenticate" method="post" class="form-horizontal">
                    %{--<g:form  action="/login/authenticate" method="post" class="form-horizontal">--}%
                    <input type="hidden" name='spring-security-redirect' value='/secure'/>
                    <h1 class="text-center">Login</h1>
                    <br>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="username">Username:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="username" id="username" placeholder="Enter username">
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="password">Password:</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" name="password" id="password" placeholder="Enter password">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-9">
                            <div class="checkbox">
                                <label><input type="checkbox"> Remember me</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-2">
                            <button type="submit" class="btn btn-default">Login</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!--Signup Modal -->
<div class="modal fade" id="signup" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <!--<div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>-->
            <div class="modal-body">
                <g:form controller="user" action="register" method="post" class="form-horizontal">
                %{--<form action="" method="post" class="form-horizontal">--}%
                    <h1 class="text-center">Signup</h1>
                    <br>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="username">Username:</label>
                        <div class="col-sm-9">
                            <input type="email" class="form-control" name="username" id="user-name" placeholder="Enter email">
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="password">Password:</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" name="password" id="pass-word" placeholder="Enter password">
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="verify">Confirm Password:</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" name="verify" id="verify" placeholder="Retype your password">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">Save</button>
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer id="footer">
    <div class="row">
        <div class="8u 12u$(medium)">
            <ul class="copyright">
                <li>&copy; Untitled. All rights reserved.</li>
                <li>copyright <a href="http://templated.co">Grailsbrains</a></li>
            </ul>
        </div>

    </div>
</div>
</footer>

</body>
