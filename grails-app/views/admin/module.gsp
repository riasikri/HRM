<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>HRM | ${companyName} | ${module.moduleName}</title>
</head>
<body>

%{-- Header Part --}%
<div class="col-md-12">
    <div class="col-md-12" style="padding:4px; padding-left: 0px; padding-right: 0px">
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

    %{--  Module name below header--}%
    <div class="col-md-12" style="background-color: #f28c38; color: white "><h1 style="text-align:left;font-size:20px;font-family:Verdana ">${companyName} | ${module.moduleName}</h1></div>
    <div>
        <ul class="nav nav-tabs">
            <li><g:link class="home" controller="secure">Home</g:link></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Employee <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="admin" action="newEmployee">Add Employee</g:link></li>
                    <li><g:link class="list" controller="admin" action="employee">Employee List</g:link></li>
                    <li><g:link class="list" controller="admin" action="roleAssign">Role Assign</g:link></li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Holiday <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="holiday" action="newHoliday">Add Holiday</g:link></li>
                    <li><g:link class="list" controller="holiday" action="holiday">Holiday List</g:link></li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Asset <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="asset" action="newAsset">Add Asset</g:link></li>
                    <li><g:link class="list" controller="asset" action="assets">Assets</g:link></li>
                    <li><g:link class="list" controller="asset" action="assignAsset">Assign Assets</g:link></li>
                </ul>
            </li>
            <li><g:link class="home" controller="secure" action="geoZone">GeoZone</g:link></li>
        </ul><br>
    </div>

    %{-- Fetching data for specific module --}%
    <div class="box, col-md-12" style="border-radius:5px; background-color: #f7f6f6; padding-top: 15px; padding-bottom: 15px">
        <div class="inner" style="font-size:20px;height: auto">
            <g:form>
                <fieldset></fieldset>
                <hr>
                <div class="col-md-12" style="padding: 10px 0 10px 0" >
                    <div class="col-md-6" style="padding: 5px" >
                        <div class="col-md-4" style="font-family:verdana;font-size:12px" >
                            <p style="padding-right:10px">Name</p>
                        </div>
                        <div class="col-md-8">
                            ${module.moduleName}
                        </div>
                    </div>
                </div>
                <div class="col-md-6" style="padding: 5px">
                    <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                        <p style="padding-right:10px">Type</p>
                    </div>
                    <div class="col-md-8">
                        ${module.moduleType}
                    </div>
                </div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>