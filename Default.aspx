<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Google maps infowindow style</title>
    <link href="/maps/documentation/javascript/examples/default.css" rel="stylesheet" />
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLMa7emvhGQMK0uYYrS-9aymoEhlX-4sU"></script>

    <script src="js/infobubble.js.js"></script>
    <link href="css/InfoBubble.css" rel="stylesheet" />

    <script type="text/javascript">

        var pMarker = []; // Array for markers
        var infoBubbleSample;

        function initialize() {
            var myLatlng = new google.maps.LatLng(18.976347, 72.84399); // default location
            var mapOptions = {
                zoom: 12,
                center: myLatlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP // Map Type
            }
            infoBubbleSample = new InfoBubble();

            var div = document.createElement('DIV');
            div.innerHTML = '<table class="InfoWindow_TableOuter"><tr> <td><span class="InfoWindowTitle" >Information</span> </td></tr><tr> <td><span class="InfoWindowHead" >Name: </span> </td></tr><tr><td><span class="InfoWindowText">Ravi Kumar</span> </td>   </tr> <tr><td><span class="InfoWindowHead" >Designation: </span> </td></tr><tr> <td><span class="InfoWindowText">Lead Software Engineer</span> </td></tr><tr><td><span class="InfoWindowHead" >Address: </span> </td></tr><tr><td><span class="InfoWindowText">Byculla, Mumbai</span> </td></tr> <tr> <td><span class="InfoWindowHead" ><a  onclick="RemoveMarkerPlace();">Close</a></span> </td></tr></table>';

            infoBubbleSample.addTab('Information', div);
            var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

            // To add marker
            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: 'Mumbai, Maharashtra'
            });

            pMarker.push(marker);

            google.maps.event.addListener(marker, 'click', function () {
                if (!infoBubbleSample.isOpen()) {
                    infoBubbleSample.open(map, marker);
                }
            });
        }

        // To remove marker and infobubble
        function RemoveMarkerPlace() {

            for (var i in pMarker)
               // pMarker[i].setMap(null);

            if (infoBubbleSample.isOpen()) {
                infoBubbleSample.close();
            }
        }

    </script>
</head>

<body onload="initialize()">
    <form id="form1" runat="server">
        <h2>Google Maps InfoWindow Style Close Button with Round Corners</h2>
        <div id="map-canvas" style="width: auto; height: 500px;"></div>
    </form>
</body>
</html>

