<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-employee" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <table>
                <thead>
                <tr>

                    <g:sortableColumn property="middleName" title="${message(code: 'employee.middleName.label', default: 'UserName')}" />

                    <g:sortableColumn property="company" title="${message(code: 'employee.company.label', default: 'Employee-Address')}" />

                    <g:sortableColumn property="firstName" title="${message(code: 'employee.firstName.label', default: 'Employee-mail')}" />

                    <g:sortableColumn property="lastName" title="${message(code: 'employee.lastName.label', default: 'Emplyee-Mobile')}" />

                    <g:sortableColumn property="position" title="${message(code: 'employee.position.label', default: 'Employee-DOB')}" />

                    <g:sortableColumn property="position" title="${message(code: 'employee.position.label', default: 'Employee-id')}" />
                    <th>Action</th>

                </tr>
                </thead>
                <tbody>
                ${empList}
                <g:each in="${empList}" status="i" var="empInstance">

                    <tr>

                        <td>${fieldValue(bean: empInstance,field: "username") }</td>
                        <td>${fieldValue(bean: empInstance,field: "location") }</td>
                        <td>${fieldValue(bean: empInstance,field: "email") }</td>
                        <td>${fieldValue(bean: empInstance,field: "phone") }</td>
                        <td>${fieldValue(bean: empInstance,field: "dob") }</td>
                        <td>${fieldValue(bean: empInstance,field: "id") }</td>
                        <td><g:link action="form" controller="geozone" params="[emplyeeId:empInstance.id,companyId:empInstance.company?.id]">Create Geozon</g:link></td>
                    </tr>

                </g:each>

                </tbody>
            </table>



            %{--<f:table collection="${employeeList}" />--}%

            <div class="pagination">
                <g:paginate total="${employeeCount ?: 0}" />
            </div>
        </div>
    </body>
</html>