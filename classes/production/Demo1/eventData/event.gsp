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
        GeoZone
    </h1>
    <nav id="nav">
        <ul class="g">
            <li class="dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button"
                        data-toggle="dropdown">
                    Adminstration <span class="caret"></span>
                </button>
                <ul class="dropdown-content">
                    <li><g:link controller="Company" action="camp">Company</g:link></li>

                    <li><g:link controller="Geozone" action="Geozone">geozone</g:link></li>
                    <li><g:link controller="eventData" action="eventList">event</g:link></li>

                </ul>
            </li>
            <li><g:link controller="logout" class="button special">Log Out</g:link></li>
        </ul>
    </nav>
</header>

<!-- Main -->
<section id="main" class="wrapper">
    <div class="container">

        <header class="major">
            <h4>Device-Information</h4>

            <table>
                <tr>
                   %{-- <th>select   ZoneType</th>--}%
                    <th>Devicde_ID</th>
                    %{-- <th>ZoneType</th>--}%
                    %{--<th>ArrivalZone</th>
                    <th>DepartureZone</th>
                    <th>Radius</th>--}%
                    <th>Latitude</th>
                    <th>Longitude</th>
                </tr>
                <g:each in="${eventList}" status="i" var="eventInstance">

                    <tr>
                        <td>${fieldValue(bean: eventInstance,field: "deviceId") }</td>
                        <td>${fieldValue(bean: eventInstance,field: "latitude") }</td>
                        <td>${fieldValue(bean: eventInstance,field: "longititude") }</td>

                    </tr>
                </g:each>
            </table>
        </header>


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

<script>

    function commonAjax(data,url){
        return $.ajax({
            url: url,
            type: 'POST',
            data: data
        });
    }

    console.log(document.getElementById('radio').checked)
    var x;
    var validUrl
    $("input[name='optradio']").change(function(){
        alert($(this).val())
        alert($(".view").attr("href"))
        var url = $(".view").attr("href")
        alert((validUrl==undefined))
        if(validUrl==undefined){
            validUrl = url
        }

        $(".view").attr("href",validUrl+"/"+$(this).val())
        x = $(this).val()

        console.log("this is x " + x)
    });








</script>

</body>
</html>
