<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>ATTEDANCE | DETAIL</title>
    <style>
    [type="date"] {
        background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)  97% 50% no-repeat ;
    }
    [type="date"]::-webkit-inner-spin-button {
        display: none;
    }
    [type="date"]::-webkit-calendar-picker-indicator {
        opacity: 0;
    }

    /* custom styles */
    body {
        padding: 4em;
        background: #e5e5e5;
        font: 15px/1.4 Geneva, 'Lucida Sans', 'Lucida Grande', 'Lucida Sans Unicode', Verdana, sans-serif;
    }
    label {
        display: block;
    }
    input {
        border: 1px solid #c4c4c4;
        border-radius: 5px;
        background-color: #fff;
        padding: 3px 5px;
        box-shadow: inset 0 10px 6px rgba(0,0,0,0.1);
        width: 150px;
    }

    </style>

</head>
<body>
<div class="col-md-12">
<div class="col-md-12" style="background-color: white; padding:4px; padding-left: 0px; padding-right: 0px">
    <div class="col-md-10">
        <h2 style="text-align:center;color:darkorange;font-family: Verdana" >ATTEDANCE DETAIL</h2>
        <g:form controller="secure" action="index">



                <select id="select" name="" style="width: 115px;">
                    <option value="Value for Item 1" title="Title for Item 1">LessThan</option>
                    <option value="Value for Item 2" title="Title for Item 2">GreaterThan</option>
                    <option value="Value for Item 3" title="Title for Item 3">EqualTo</option>
                </select>
            <input id="input" name="" type="" style="width: 50px;">




            <input type="date" name="attendanceDate" id="attendanceDate" >
                Id: <g:textField name="employeeParam"  value=""  />
            name: <g:textField name="employeeName" value="" />
            <g:submitButton name="submit" value="Search" />
        </g:form>
    </div>
    <div class="col-md-2" style="padding:20px;padding-bottom: 0px; height:100%; color: #666666" >
        Welcome ${username}<button class="btn btn-primary dropdown-toggle" style="border: 0px;color: black; background-color: white; padding-bottom: 3px; padding-top: 3px; padding-left: 6px;padding-right: 6px" type="button" data-toggle="dropdown">
        <span class="caret"></span></button>
        <ul class="dropdown-menu">
            <li><g:link controller="logout" style="text-decoration: none">Log Out</g:link></li>
        </ul>
    </div>
</div>
<div class="col-sm-12" id="a" value="12" style="padding: 0 0 0 0; background-color: #f28c38">
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=companyName&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Employee-Id</a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=taxId&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Employee-Name</a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=companyStatus&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Date</a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=registrationNo&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">LoginTime</a></div>
    <div class="col-sm-4" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=totalEmployee&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">LogoutTime</a></div>
</div>
<g:form controller="secure" action="index">
    <g:each in="${attendanceList}" var="atnd" status="i">
        <g:set var="employee" value="${entity.Employee.findByAttendance(atnd.id).get()}" />
        <div class="col-sm-12" id="${i}${employee.id}" style="background-color: #f2f2f2; padding: 5px 0 5px 0; border:1px solid white">
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.id}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.employeeName}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${atnd.attendanceDate}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${atnd.logIntime}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${atnd.logOuttime}</div>
        </div>
    </g:each>
    %{--<div class="top, col-sm-12" style="padding: 20px; background-color: white" align="center">
        <input type="submit" class="btn btn-success" name="modify" value="Show">
        <input type="submit" class="btn btn-warning" name="modify" value="Edit">
        <input type="submit" class="btn btn-danger"  name="modify" value="Delete">
    </div>--}%
%{-- <g:paginate controller="secure" action="index" total="${attendanceDetailCount}" />--}%
    <div class="pagination" role="status" aria-live="polite" style="float: left">Showing ${from} to ${to} of ${attendanceDetailCount} entries</div>
    <div class="pagination" style="float: right">
        <li><g:paginate class="row" style="text-align: center; display: inline;" next="Next" prev="Previous" maxsteps="0" controller="secure" action="index" total="${attendanceDetailCount}"/>
    </div>
    </div>
</g:form>
</div>
</body>
</html>

