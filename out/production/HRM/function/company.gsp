<!DOCTYPE html>
<!--
	Transit by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html lang="en">
<head>

    <style>
    table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    td, th {
        border: 4px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    tr:nth-child(even) {
        background-color: #dddddd;
    }
    </style>


    <meta charset="UTF-8">
    <title>Generic - Transit by TEMPLATED</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
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


    <script src="js/jquery.min.js"></script>
    <script src="js/skel.min.js"></script>
    <script src="js/skel-layers.min.js"></script>
    <script src="js/init.js"></script>
    %{--<noscript>
--}%
    <asset:stylesheet src="drop.css"/>
    <asset:stylesheet src="style.css"/>
    <asset:stylesheet src="style-xlarge.css"/>
    <link rel="stylesheet" href="drop.css" />
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="style-xlarge.css" />
    %{--</noscript>--}%
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<!-- Header -->
<header id="header">
    <h1>
        <a href="index.html">Attendance Track</a>
    </h1>
    <nav id="nav">
        <ul class="g">
            <li class="dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button"
                        data-toggle="dropdown">
                    Adminstration <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li style="color: red;"><a href="#">Employee-Admin</a></li>
                    <li><a href="#">Company-Admin</a></li>

                </ul>
            </li>
            <li class="dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button"
                        data-toggle="dropdown">
                    Geozone <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="#">Polygon</a></li>
                    <li><a href="#">Readius</a></li>

                </ul>
            </li>
            <li><a href="home.html" class="button special">Log Out</a></li>
        </ul>
    </nav>
</header>

<!-- Main -->
<section id="main" class="wrapper">
    <div class="container">

        <header class="major">
            <h2>Company-Admin</h2>

        </header>


        <!-- <div id="googleMap" style="width: 100%; height: 400px;"></div>

			<script>
				function myMap() {
					var mapProp = {
						center : new google.maps.LatLng(51.508742, -0.120850),
						zoom : 5,
					};
					var map = new google.maps.Map(document
							.getElementById("googleMap"), mapProp);
				}
			</script>

			<script
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAShrIwR7ZBeCkAEKhncD42oEHMtnLCOf4&callback=initMap"></script> -->


        <table>
            <tr>
                <th>Company-Id</th>
                <th>Company-Name</th>
                <th>Company-Address</th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>






    </div>
</section>

<!-- Footer -->
<footer id="footer">


    <div class="row">
        <div class="8u 12u$(medium)">
            <ul class="copyright">
                <li>&copy; Untitled. All rights reserved.</li>
                <li>Design: <a href="http://templated.co">TEMPLATED</a></li>
                <li>Images: <a href="http://unsplash.com">Unsplash</a></li>
            </ul>
        </div>
    </div>

</footer>
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA3vSAsZcWtZoXKU9hDt1nKfMrxOqeBo94=myMap"></script> -->


</body>
</html>