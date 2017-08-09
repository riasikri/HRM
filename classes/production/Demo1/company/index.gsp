<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>


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



    </head>
    <body>


    <!-- Header -->
    <header id="header">
        <h1>
            <a href="index.html">Attendance Track</a>
        </h1>
        <nav id="nav">
            <ul class="g">

                <li><g:link controller="logout" class="button special">Log Out</g:link></li>
            </ul>
        </nav>
    </header>





        <a href="#list-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-company" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${companyList}" />

            <div class="pagination">
                <g:paginate total="${companyCount ?: 0}" />
            </div>
        </div>


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


    </body>
</html>