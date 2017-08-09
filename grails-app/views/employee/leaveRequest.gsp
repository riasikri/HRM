<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>${companyName} | Leave</title>
</head>
<body>
<div class="col-md-12">
    <div class="col-md-12" style="background-color: white; padding:4px; padding-left: 0px; padding-right: 0px">
        <div class="col-md-10">
            <h2 style="text-align:left;color:darkorange;font-family: Verdana" >Human Resource Management </h2>
        </div>
        <div class="col-md-2" style="padding:20px;padding-bottom: 0px; height:100%; color: #666666" >
            Welcome ${username}<button class="btn btn-primary dropdown-toggle" style="border: 0px;color: black; background-color: white; padding-bottom: 3px; padding-top: 3px; padding-left: 6px;padding-right: 6px" type="button" data-toggle="dropdown">
            <span class="caret"></span></button>
            <ul class="dropdown-menu">
                <li><g:link controller="#" action="newCompPage" style="text-decoration: none">Profile</g:link></li>
                <li><g:link controller="#" action="newCompPage" style="text-decoration: none">Setting</g:link></li>
                <li><g:link controller="logout" style="text-decoration: none">Log Out</g:link></li>
            </ul>
        </div>
    </div>

    <div class="col-md-12" style="background-color: #f28c38; color: white ">
        <h1 style="text-align:left;font-size:20px;font-family:Verdana ">${companyName} | Leave</h1>
    </div>
    <div>
        <ul class="nav nav-tabs">
            <ul class="nav nav-tabs">
                <li><g:link class="home" controller="secure">Home</g:link></li>
                <li><g:link class="home" controller="holiday" action="holiday">Holiday</g:link></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Leave<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="employee" action="leave">Request Leave</g:link></li>
                        <li><g:link controller="employee" action="leaveRecord">Leave History</g:link></li>
                    </ul>
                </li>
            </ul>
        </ul><br>
    </div>
    <div class="col-md-3"></div>
    <div class="box, col-md-6" style="border-radius:5px; background-color: #f7f6f6; padding-top: 15px; padding-bottom: 15px">
        <div class="inner" style="margin: 10px 40px 40px 40px; font-size:20px;height: auto;background-color: transparent">
            <g:form name="employeeForm" url="[controller:'employee', action:'saveLeave']">
                <fieldset>Leave Information</fieldset>
                <hr>
                <div class="col-md-12" style="padding: 10px 0 10px 0" >
                    <div class="col-md-2"><h5 style="margin-top:0px; padding-right:10px">From </h5></div>
                    <div class="col-md-4"><input class="inputStyle" type="date" required name="fromDate" ></div>
                </div>
                <div class="col-md-12" style="padding: 10px 0 10px 0" >
                    <div class="col-md-2"><h5 style="margin-top:0px; padding-right:10px">To </h5></div>
                    <div class="col-md-4"><input class="inputStyle" type="date" required name="toDate" ></div>
                </div>
                <div class="col-md-12" style="padding: 10px 0 10px 0" >
                    <div class="col-md-2"><h5 style="margin-top:0px; padding-right:10px">Reason </h5></div>
                    <div class="col-md-8"><textarea class="inputStyle" type="text" cols="50" required name="reason"></textarea></div>
                </div>
                <hr style="padding: 5px;margin: 0px">
                <input class="btn btn-success" type="submit" value="Request">
            </g:form>
        </div>
    </div>
</div>
</body>
</html>