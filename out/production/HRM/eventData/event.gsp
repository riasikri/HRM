%{--


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>HRM | HOME</title>
</head>
<body>
<div class="col-md-12">
<div class="col-md-12" style="background-color: white; padding:4px; padding-left: 0px; padding-right: 0px">
    <div class="col-md-10">
        <h2 style="text-align:left;color:darkorange;font-family: Verdana" >Create And View</h2>
        Admin ${username}<button class="btn btn-primary dropdown-toggle" style="border: 0px;color: black; background-color: white; padding-bottom: 3px; padding-top: 3px; padding-left: 6px;padding-right: 6px" type="button" data-toggle="dropdown">
        <span class="caret"></span></button>
        <ul class="dropdown-menu">
            --}%
%{-- <li><a href="Employee" action="emp">Employee</a></li>--}%%{--

            --}%
%{-- <li><g:link controller="Company" action="camp">Company</g:link></li>--}%%{--


            <li><g:link controller="Geozone" action="Geozone">geoZone</g:link></li>
            --}%
%{--<li><g:link controller="eventData" action="eventList">events</g:link></li>--}%%{--

        </ul>

    </div>
    <div class="col-md-2" style="padding:20px;padding-bottom: 0px; height:100%; color: #666666" >
        Welcome ${username}<button class="btn btn-primary dropdown-toggle" style="border: 0px;color: black; background-color: white; padding-bottom: 3px; padding-top: 3px; padding-left: 6px;padding-right: 6px" type="button" data-toggle="dropdown">
        <span class="caret"></span></button>
        <ul class="dropdown-menu">
            <li><g:link controller="logout" style="text-decoration: none">Log Out</g:link></li>
        </ul>


    </div>

</div>



<g:form name="showForm" controller="modify" action="company">
    <g:each in="${glist}" var="gl" status="i">
        <div class="col-sm-12" style="background-color: #f2f2f2; padding: 5px 0 5px 0; border:1px solid white">
            <div class="col-sm-2" style="padding-left:0px; padding-right:0px">
                <div class="col-sm-1" style=" padding: 0 0 0 10px"align="center"><input type="radio" id="ohrmList_chkSelectRecord_1" name="radio" value="${gl.id}"></div>
                <div class="col-sm-9" style=" padding: 0 0 0 15px">${gl.zonetype}</div>
            </div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${gl.geozoneId}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${gl.arrivalZone}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${gl.departureStatusCode}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${gl.radious}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${company.email}</div>
        </div>
    </g:each>

    <div class="top, col-sm-12" style="padding: 20px; background-color: white" align="center">
        <input type="submit" class="btn btn-success" name="modify" value="Show">
        <input type="submit" class="btn btn-warning" name="modify" value="Edit">
        <input type="submit" class="btn btn-danger"  name="modify" value="Delete">

    </div>
    <div class="pagination" role="status" aria-live="polite" style="float: left">Showing ${from} to ${to} of ${companyCount} entries</div>
    <div class="pagination" style="float: right">
        <li><g:paginate class="row" style="text-align: center; display: inline;" next="Next" prev="Previous" maxsteps="0" controller="Secure" action="list" total="${companyCount}"/>
    </div>
    </div>

</g:form>
</div>
</body>
</html>




--}%































%{--<!DOCTYPE html>
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


    --}%%{--<asset:javascript src="jquery.min.js"/>
     <asset:javascript src="skel.min.js"/>
     <asset:javascript src="skel-layers.min.js"/>
     <asset:javascript src="init.js"/>--}%%{--

    <script src="grails-app/assets/javascripts/jquery.min.js" type="text/javascript"></script>
    <script src="grails-app/assets/javascripts/skel.min.js" type="text/javascript"></script>
    <script src="grails-app/assets/javascripts/skel-layers.min.js" type="text/javascript"></script>
    <script src="grails-app/assets/javascripts/init.js" type="text/javascript"></script>


    <script src="js/jquery.min.js"></script>
    <script src="js/skel.min.js"></script>
    <script src="js/skel-layers.min.js"></script>
    <script src="js/init.js"></script>
    --}%%{--<noscript>
--}%%{--
    <asset:stylesheet src="drop.css"/>
    <asset:stylesheet src="style.css"/>
    <asset:stylesheet src="style-xlarge.css"/>

    --}%%{-- <link rel="stylesheet" href="drop.css" />
     <link rel="stylesheet" href="style.css" />
     <link rel="stylesheet" href="style-xlarge.css" />--}%%{--
    --}%%{--</noscript>--}%%{--
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

                    <li><g:link controller="Geozone" action="Geozone">geoZone</g:link></li>
                    <li><g:link controller="eventData" action="eventList">events</g:link></li>
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
            <h4>Create and View GeoZone:</h4>

            <table>
                <tr>
                    <th>select   ZoneType</th>
                    <th>Geozonez ID</th>
                    --}%%{-- <th>ZoneType</th>--}%%{--
                    <th>ArrivalZone</th>
                    <th>DepartureZone</th>
                    <th>Radius</th>
                    <th>Latitude</th>
                    <th>Longitude</th>
                </tr>
                <g:each in="${geozoneList}" status="i" var="geozoneInstance">

                    <tr>


                        <td>
                            <g:if test="${geozoneInstance.radious=='undefined'}">
                                <g:radio id="radio"  name="optradio" value="${fieldValue(bean: geozoneInstance,field: "id") }" checked="true"/>
                                Polygon
                            </g:if>
                            <g:else>

                                <g:radio id="radio"  name="optradio" value="${fieldValue(bean: geozoneInstance,field: "id") }" checked="true"/>
                                Circle
                            </g:else>
                        </td>

                        <td>${fieldValue(bean: geozoneInstance,field: "id") }</td>
                        --}%%{--<td>${fieldValue(bean: geozoneInstance,field: "zonetype") }</td>--}%%{--
                        <td>${fieldValue(bean: geozoneInstance,field: "arrivalZone") }</td>
                        <td>${fieldValue(bean: geozoneInstance,field: "departureStatusCode") }</td>
                        <td>${fieldValue(bean: geozoneInstance,field: "radious") }</td>
                        <td>${fieldValue(bean: geozoneInstance,field: "latitude1") }</td>
                        <td>${fieldValue(bean: geozoneInstance,field: "longitude1") }</td>
                    </tr>
                </g:each>
            </table>

            --}%%{-- <li><g:link controller="Geozone" class="button special">Log Out</g:link></li>--}%%{--

            <g:link class="view btn btn-primary" controller="Geozone" action="form">
                View
            </g:link>

            <g:link class="btn btn-primary" controller="Geozone" action="form">
                Create
            </g:link>




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
</html>--}%































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
<noscript>


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
                    <th>Devicde_ID</th>
                    <th>Latitude</th>
                    <th>Longitude</th>
                    <th>Status</th>
                </tr>
                <g:each in="${eventList}" status="i" var="eventInstance">

                    <tr>
                        <td>${fieldValue(bean: eventInstance,field: "deviceId") }</td>
                        <td>${fieldValue(bean: eventInstance,field: "latitude") }</td>
                        <td>${fieldValue(bean: eventInstance,field: "longititude") }</td>
                        <td>${fieldValue(bean: eventInstance,field: "statusCode") }</td>


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
