 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>Attendance-Tracking</title>

</head>
<body>


<script>function commonAjax(data,url){
    return $.ajax({
        url: url,
        type: 'POST',
        data: data


    });
}</script>



<div class="col-md-12">
<div class="col-md-12" style="background-color: white; padding:4px; padding-left: 0px; padding-right: 0px">
    <div class="col-md-10">
        <h2 style="text-align:left;color:darkorange;font-family: Verdana" >Attendance Track</h2>
    </div>
    <div class="col-md-2" style="padding:20px;padding-bottom: 0px; height:100%; color: #666666" >
        Welcome ${username}<button class="btn btn-primary dropdown-toggle" style="border: 0px;color: black; background-color: white; padding-bottom: 3px; padding-top: 3px; padding-left: 6px;padding-right: 6px" type="button" data-toggle="dropdown">
        <span class="caret"></span></button>
        <ul class="dropdown-menu">
            <li><g:link controller="logout" style="text-decoration: none">Log Out</g:link></li>
        </ul>
    </div>
</div>

<g:form name="attendance" controller="secure" action="index">
    <div class="col-sm-12" style="padding: 0 0 0 0; background-color: #f28c38">

        <div class="col-sm-4">
            <div class="row">
                <div style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=companyStatus&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Device-Id</a></div>
            </div>
        <g:each in="${Dlist}" var="devicetInstance" status="i">
                <div class="row"><div class="" style="padding: 0 0 0 10px;">${devicetInstance.id}</div></div>
            </g:each>




        </div>

        <div class="col-sm-4">
            <div class="row">
                <div style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=companyStatus&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Latitude</a></div>
            </div>
            <g:each in="${eventList}" var="eventInstance" status="i">
                <div class="row"><div class="" style="padding: 0 0 0 10px;">${eventInstance.latitude}</div></div>
            </g:each>
        </div>

        <div class="col-sm-4">
            <div class="row">
                <div style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=companyStatus&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Longitude</a></div>
            </div>
            <g:each in="${eventList}" var="eventInstance" status="i">
                <div class="row"><div class="" style="padding: 0 0 0 10px;">${eventInstance.longititude}</div></div>
            </g:each>
        </div>



    </div>

    <div class="top, col-sm-12" style="padding: 20px; background-color: white" align="center">
        <input type="submit" class="btn btn-success" name="modify" value="Show">
        <input type="submit" class="btn btn-warning" name="modify" value="Edit">
        <input type="submit" class="btn btn-danger"  name="modify" value="Delete">
    </div>
    </div>
</g:form>
</div>
</body>
</html>

