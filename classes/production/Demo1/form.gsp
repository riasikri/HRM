<!DOCTYPE html>
<!-- http://gmaps-samples-v3.googlecode.com/svn/trunk/drawing/drawing-tools.html -->
<!-- https://developers.google.com/maps/documentation/javascript/examples/places-searchbox -->
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="UTF-8">
    <title>Drawing Tools (B)</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- NOTE: two libraries to load are comma-separated; otherwise last mention of the query string arg overwrites the previous -->
    <script type="text/javascript"
            src="http://maps.google.com/maps/api/js?key=AIzaSyAkJ1SwM7KfvI708M_M-qu6JWmu6bNH7HU&v=3.21.5a&libraries=drawing&signed_in=true&libraries=places,drawing"></script>
    <style type="text/css">

    #map, html, body {
        padding: 0;
        margin: 0;
        height: 100%;
    }

    #panel {
        width: 200px;
        font-family: Arial, sans-serif;
        font-size: 13px;
        float: right;
        margin: 10px;
    }

    #color-palette {
        clear: both;
    }

    .color-button {
        width: 14px;
        height: 14px;
        font-size: 0;
        margin: 2px;
        float: left;
        cursor: pointer;
    }

    #delete-button {
        margin-top: 5px;
    }
    </style>


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










<script type="text/javascript">
    var drawingManager;
    var selectedShape;
    var colors = ['#1E90FF', '#FF1493', '#32CD32', '#FF8C00', '#4B0082'];
    var selectedColor;
    var colorButtons = {};

    function commonAjax(data,url){
        return $.ajax({
            url: url,
            type: 'POST',
            data: data


        });
    }

    function clearSelection() {
        if (selectedShape) {
            if (typeof selectedShape.setEditable == 'function') {
                selectedShape.setEditable(false);
            }
            selectedShape = null;
        }
        curseldiv.innerHTML = "<b>cursel</b>:";
    }

    function updateCurSelText(shape) {

        posstr = "" + selectedShape.position;
        if (typeof selectedShape.position == 'object') {
            posstr = selectedShape.position.toUrlValue();
            console.log('hello this is pos'+posstr)
        }
        pathstr = "" + selectedShape.getPath;
        if (typeof selectedShape.getPath == 'function') {
            pathstr = " ";
            for (var i = 0; i < selectedShape.getPath().getLength(); i++) {
                // .toUrlValue(5) limits number of decimals, default is 6 but can do more
                pathstr += selectedShape.getPath().getAt(i).toUrlValue() + "  ";
            }
            pathstr += " ";

            console.log('hello this is path'+pathstr)
        }



        bndstr = "" + selectedShape.getBounds;
        cntstr = "" + selectedShape.getBounds;
        if (typeof selectedShape.getBounds == 'function') {
            var tmpbounds = selectedShape.getBounds();
            cntstr = "" + tmpbounds.getCenter().toUrlValue();
            bndstr =   tmpbounds.getNorthEast().toUrlValue()  + tmpbounds.getSouthWest().toUrlValue() ;
            console.log('hello this is bound'+bndstr)
            console.log('hello this is cnrstr'+cntstr)
        }





        cntrstr = "" + selectedShape.getCenter;
        if (typeof selectedShape.getCenter == 'function') {
            cntrstr = "" + selectedShape.getCenter().toUrlValue();
            console.log('hello this is CenterOfradius'+cntrstr)
        }
        radstr = "" + selectedShape.getRadius;
        if (typeof selectedShape.getRadius == 'function') {
            radstr = "" + selectedShape.getRadius();

            console.log('hello this is radius'+radstr)
        }

/*if(posstr!='undefined'||radstr!='undefined'||cntstr!='undefined')
{
       var eventsUrl = '${createLink(action:'events',controller:'eventData')}';

        var locData = {pss: posstr, stts: radstr, stcnts: cntstr}
        commonAjax(locData, eventsUrl).done(function (response) {
            alert(locData)
            if (response == true || response == 'true') {
                alert('Data saved Successfully');

            }

        }*/




if(posstr!='undefined') {
    var eventUrl = '${createLink(action:'event',controller:'eventData')}';

    var locData = {ps: posstr,geozone:xyz}
    commonAjax(locData, eventUrl).done(function (response) {
        alert(locData)
        if (response == true || response == 'true') {
            alert('Data saved Successfully');

        }

    });
}

else {


    var url = '${createLink(action:'ft',controller:'geozone')}';

    var locData = {str: pathstr, st: cntrstr, stt: radstr, stcnt: cntstr}
    commonAjax(locData, url).done(function (response) {
        alert(locData)
        if (response == true || response == 'true') {
            alert('Data saved Successfully');

        }
         /*else{
             alert("Some Internal Error occured please try again after some time .")
             }*/
        } );

}





        curseldiv.innerHTML = "<b>cursel</b>: " + selectedShape.type + " " + selectedShape + "; <i>pos</i>: " + posstr + " ; <i>path</i>: " + pathstr + " ; <i>bounds</i>: " + bndstr + " ; <i>Cb</i>: " + cntstr + " ; <i>radius</i>: " + radstr + " ; <i>Cr</i>: " + cntrstr ;

    }

    function setSelection(shape, isNotMarker) {
        clearSelection();
        selectedShape = shape;
        if (isNotMarker)
            shape.setEditable(true);
        selectColor(shape.get('fillColor') || shape.get('strokeColor'));
        updateCurSelText(shape);
    }

    function deleteSelectedShape() {
        if (selectedShape) {
            selectedShape.setMap(null);
        }
    }

    function selectColor(color) {
        selectedColor = color;
        for (var i = 0; i < colors.length; ++i) {
            var currColor = colors[i];
            colorButtons[currColor].style.border = currColor == color ? '2px solid #789' : '2px solid #fff';
        }

        // Retrieves the current options from the drawing manager and replaces the
        // stroke or fill color as appropriate.
        var polylineOptions = drawingManager.get('polylineOptions');
        polylineOptions.strokeColor = color;
        drawingManager.set('polylineOptions', polylineOptions);

        var rectangleOptions = drawingManager.get('rectangleOptions');
        rectangleOptions.fillColor = color;
        drawingManager.set('rectangleOptions', rectangleOptions);

        var circleOptions = drawingManager.get('circleOptions');
        circleOptions.fillColor = color;
        drawingManager.set('circleOptions', circleOptions);

        var polygonOptions = drawingManager.get('polygonOptions');
        polygonOptions.fillColor = color;
        drawingManager.set('polygonOptions', polygonOptions);
    }

    function setSelectedShapeColor(color) {
        if (selectedShape) {
            if (selectedShape.type == google.maps.drawing.OverlayType.POLYLINE) {
                selectedShape.set('strokeColor', color);
            } else {
                selectedShape.set('fillColor', color);
            }
        }
    }

    function makeColorButton(color) {
        var button = document.createElement('span');
        button.className = 'color-button';
        button.style.backgroundColor = color;
        google.maps.event.addDomListener(button, 'click', function() {
            selectColor(color);
            setSelectedShapeColor(color);
        });

        return button;
    }

    function buildColorPalette() {
        var colorPalette = document.getElementById('color-palette');
        for (var i = 0; i < colors.length; ++i) {
            var currColor = colors[i];
            var colorButton = makeColorButton(currColor);
            colorPalette.appendChild(colorButton);
            colorButtons[currColor] = colorButton;
        }
        selectColor(colors[0]);
    }

    /////////////////////////////////////
    var map; //= new google.maps.Map(document.getElementById('map'), {
    // these must have global refs too!:
    var placeMarkers = [];
    var input;
    var searchBox;
    var curposdiv;
    var curseldiv;

    function deletePlacesSearchResults() {
        for (var i = 0, marker; marker = placeMarkers[i]; i++) {
            marker.setMap(null);
        }
        placeMarkers = [];
        input.value = ''; // clear the box too
    }

    $( document ).ready(function() {
        console.log( "ready!" );
        map = new google.maps.Map(document.getElementById("map"));

        lat();
    });

function lat() {


    var yyd = [];
    var mapPoly;


    if (${geozoneInstance?.latitude1!=null && geozoneInstance?.longitude1!=null}) {

        yyd.push(new google.maps.LatLng(${geozoneInstance?.latitude1?:0}, ${geozoneInstance?.longitude1?:0}))
        alert(yyd[0]);
    }
    if (${geozoneInstance?.latitude2!=null && geozoneInstance?.longitude2!=null}) {

        yyd.push(new google.maps.LatLng(${geozoneInstance?.latitude2?:0}, ${geozoneInstance?.longitude2?:0}))
        alert(yyd[1])
    }
    if (${geozoneInstance?.latitude3!=null && geozoneInstance?.longitude3!=null}) {

        yyd.push(new google.maps.LatLng(${geozoneInstance?.latitude3?:0}, ${geozoneInstance?.longitude3?:0}))
        alert(yyd[2])
    }
    if (${geozoneInstance?.latitude4!=null && geozoneInstance?.longitude4!=null}) {

        yyd.push(new google.maps.LatLng(${geozoneInstance?.latitude4?:0}, ${geozoneInstance?.longitude4?:0}))
        alert(yyd[3])
    }
    if (${geozoneInstance?.latitude5!=null && geozoneInstance?.longitude5!=null}) {

        yyd.push(new google.maps.LatLng(${geozoneInstance?.latitude5?:0}, ${geozoneInstance?.longitude5?:0}))
        alert(yyd[4])
    }

    if (${geozoneInstance?.latitude6!=null && geozoneInstance?.longitude6!=null}) {

        yyd.push(new google.maps.LatLng(${geozoneInstance?.latitude6?:0}, ${geozoneInstance?.longitude6?:0}))
        alert(yyd[5])
    }
    if (${geozoneInstance?.latitude7!=null && geozoneInstance?.longitude7!=null}) {

        yyd.push(new google.maps.LatLng(${geozoneInstance?.latitude7?:0}, ${geozoneInstance?.longitude7?:0}))
        alert(yyd[6])
    }
    if (${geozoneInstance?.latitude8!=null && geozoneInstance?.longitude8!=null}) {

        yyd.push(new google.maps.LatLng(${geozoneInstance?.latitude8?:0}, ${geozoneInstance?.longitude8?:0}))
        alert(yyd[7])
    }
    if (${geozoneInstance?.latitude9!=null && geozoneInstance?.longitude9!=null}) {

        yyd.push(new google.maps.LatLng(${geozoneInstance?.latitude9?:0}, ${geozoneInstance?.longitude9?:0}))
        alert(yyd[8])
    }
    if (${geozoneInstance?.latitude10!=null && geozoneInstance?.longitude10!=null}) {

        yyd.push(new google.maps.LatLng(${geozoneInstance?.latitude10?:0}, ${geozoneInstance?.longitude10?:0}))
        alert(yyd[9])
    }
   var mapPoly = new google.maps.Polygon({
        paths: yyd,
        strokeColor: "#FF8800",
        strokeOpacity: 0.8,
        strokeWeight: 3,
        fillColor: "#FF8800",
        fillOpacity: 0.35
    });
    mapPoly.setMap(map);

}



    ////*//////////////////////////////////
    function initialize() {
        map = new google.maps.Map(document.getElementById('map'), { //var
            zoom: 15,//10,
            center: new google.maps.LatLng(12.928837, 77.739338),//(22.344, 114.048),
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            disableDefaultUI: false,
            zoomControl: true
        });
        curposdiv = document.getElementById('curpos');
        curseldiv = document.getElementById('cursel');

        var polyOptions = {
            strokeWeight: 0,
            fillOpacity: 0.45,
            editable: true
        };
        // Creates a drawing manager attached to the map that allows the user to draw
        // markers, lines, and shapes.
        drawingManager = new google.maps.drawing.DrawingManager({
            drawingMode: google.maps.drawing.OverlayType.POLYGON,
            markerOptions: {
                draggable: true,
                editable: true,
            },
            polylineOptions: {
                editable: true
            },
            rectangleOptions: polyOptions,
            circleOptions: polyOptions,
            polygonOptions: polyOptions,
            map: map
        });

        google.maps.event.addListener(drawingManager, 'overlaycomplete', function(e) {
            //~ if (e.type != google.maps.drawing.OverlayType.MARKER) {
            var isNotMarker = (e.type != google.maps.drawing.OverlayType.MARKER);
            // Switch back to non-drawing mode after drawing a shape.
            drawingManager.setDrawingMode(null);

            // Add an event listener that selects the newly-drawn shape when the user
            // mouses down on it.
            var newShape = e.overlay;
            newShape.type = e.type;
            google.maps.event.addListener(newShape, 'click', function() {
                setSelection(newShape, isNotMarker);
            });
            google.maps.event.addListener(newShape, 'drag', function() {
                updateCurSelText(newShape);
            });
            google.maps.event.addListener(newShape, 'dragend', function() {
                updateCurSelText(newShape);
            });
            setSelection(newShape, isNotMarker);
            //~ }// end if
        });

        // Clear the current selection when the drawing mode is changed, or when the
        // map is clicked.
        google.maps.event.addListener(drawingManager, 'drawingmode_changed', clearSelection);
        google.maps.event.addListener(map, 'click', clearSelection);
        google.maps.event.addDomListener(document.getElementById('delete-button'), 'click', deleteSelectedShape);

        buildColorPalette();

        //~ initSearch();
        // Create the search box and link it to the UI element.
        input = /** @type {HTMLInputElement} */( //var
            document.getElementById('pac-input'));
        map.controls[google.maps.ControlPosition.TOP_RIGHT].push(input);
        //
        var DelPlcButDiv = document.createElement('div');
        //~ DelPlcButDiv.style.color = 'rgb(25,25,25)'; // no effect?
        DelPlcButDiv.style.backgroundColor = '#fff';
        DelPlcButDiv.style.cursor = 'pointer';
        DelPlcButDiv.innerHTML = 'DEL';
        map.controls[google.maps.ControlPosition.TOP_RIGHT].push(DelPlcButDiv);
        google.maps.event.addDomListener(DelPlcButDiv, 'click', deletePlacesSearchResults);

        searchBox = new google.maps.places.SearchBox( //var
            /** @type {HTMLInputElement} */(input));

        // Listen for the event fired when the user selects an item from the
        // pick list. Retrieve the matching places for that item.
        google.maps.event.addListener(searchBox, 'places_changed', function() {
            var places = searchBox.getPlaces();

            if (places.length == 0) {
                return;
            }
            for (var i = 0, marker; marker = placeMarkers[i]; i++) {
                marker.setMap(null);
            }

            // For each place, get the icon, place name, and location.
            placeMarkers = [];
            var bounds = new google.maps.LatLngBounds();
            for (var i = 0, place; place = places[i]; i++) {
                var image = {
                    url: place.icon,
                    size: new google.maps.Size(71, 71),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(17, 34),
                    scaledSize: new google.maps.Size(25, 25)
                };

                // Create a marker for each place.
                var marker = new google.maps.Marker({
                    map: map,
                    icon: image,
                    title: place.name,
                    position: place.geometry.location
                });

                placeMarkers.push(marker);

                bounds.extend(place.geometry.location);
            }

            map.fitBounds(bounds);
        });

        // Bias the SearchBox results towards places that are within the bounds of the
        // current map's viewport.
        google.maps.event.addListener(map, 'bounds_changed', function() {
            var bounds = map.getBounds();
            searchBox.setBounds(bounds);
            curposdiv.innerHTML = "<b>curpos</b> Z: " + map.getZoom() + " C: " + map.getCenter().toUrlValue();
        }); //////////////////////
    }
    google.maps.event.addDomListener(window, 'load', initialize);
</script>

<div id="panel">
    <div id="color-palette"></div>
    <div>
        <button id="delete-button">Delete Selected Shape</button>
    </div>
    <div id="curpos"></div>
    <div id="cursel"></div>
    %{--<div id="note"><small>Note: markers can be selected, but are not graphically indicated; can be deleted, but cannot have their color changed.</small></div>--}%
    <g:link controller="Geozone" action="Geozone">
        <g:actionSubmit value="Save"/>
    </g:link>
</div>

<input id="pac-input" type="text" placeholder="Search Box">
<div id="map">A</div>

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
