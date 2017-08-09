package entity

import com.user.Point
import com.user.Position_Point_WRT_Polygon

//import java.sql.Time
class EventData {
    def geogoneService

    Integer companyId

    String timeStamp
    String statusCode
    String latitude
    String longititude
    String gpsAge
    String geozoneIndex
    String geozoneId
    String creationTime
    Device device

    //static belongsTo=[device:Device]

    static constraints = {

        statusCode(nullable: true,blank:true)
        latitude(nullable: true,blank:true)
        longititude(nullable: true,blank:true)
        gpsAge(nullable: true,blank:true)
        geozoneIndex(nullable: true,blank:true)
        geozoneId(nullable: true,blank:true)
        creationTime(nullable: true,blank:true)
        timeStamp(nullable: true,blank:true)
        companyId(nullable: true,blank:true)
        device(nullable: true,blank:true)

    }
    def beforeInsert(){
        def geo = Geozone.findById(geozoneId)


        def crLatitude1=Double.parseDouble(geo.latitude1)
        def crLongitude1=Double.parseDouble(geo.longitude1)

        def pointLatitude=Double.parseDouble(latitude)
        def pointLongitude=Double.parseDouble(longititude)
        def tf

        if(geo.radious!='undefined') {
            def circleradius=Double.parseDouble(geo.radious)
            def ios= geogoneService.isInside(circleradius,pointLatitude,pointLongitude,crLatitude1,crLongitude1)
            statusCode=ios
        }else {
            Position_Point_WRT_Polygon psp = new Position_Point_WRT_Polygon()
            Point[] polygon1 = null;

            if (crLatitude1!= null && crLongitude1!= null) {
                polygon1 = [new Point(crLatitude1, crLongitude1)];
            }
            if (geo.latitude2 != null && geo.longitude2 != null) {
                polygon1 = geogoneService.appendValue(polygon1, new Point(Double.parseDouble(geo.latitude2), Double.parseDouble(geo.longitude2)))
            }

            if (geo.latitude3 != null && geo.longitude3 != null) {
                polygon1 =geogoneService.appendValue(polygon1, new Point(Double.parseDouble(geo.latitude3), Double.parseDouble(geo.longitude3)))
            }
            if (geo.latitude4 != null && geo.longitude4 != null) {
                polygon1 = geogoneService.appendValue(polygon1, new Point(Double.parseDouble(geo.latitude4), Double.parseDouble(geo.longitude4)))
            }

            if (geo.latitude5 != null && geo.longitude5 != null) {
                polygon1 = geogoneService.appendValue(polygon1, new Point(Double.parseDouble(geo.latitude5), Double.parseDouble(geo.longitude5)))
            }
            if (geo.latitude6 != null && geo.longitude6 != null) {
                polygon1 = geogoneService.appendValue(polygon1, new Point(Double.parseDouble(geo.latitude6), Double.parseDouble(geo.longitude6)))
            }
            if (geo.latitude7 != null && geo.longitude7 != null) {
                polygon1 = geogoneService.appendValue(polygon1, new Point(Double.parseDouble(geo.latitude7), Double.parseDouble(geo.longitude7)))
            }
            if (geo.latitude8 != null && geo.longitude8 != null) {
                //polygon1.add(new Point(Double.parseDouble(geoZone.latitude6), Double.parseDouble(geoZone.longitude6)))
                polygon1 = geogoneService.appendValue(polygon1, new Point(Double.parseDouble(geo.latitude8), Double.parseDouble(geo.longitude8)))
            }
            if (geo.latitude9 != null && geo.longitude9 != null) {
                //polygon1.add(new Point(Double.parseDouble(geoZone.latitude6), Double.parseDouble(geoZone.longitude6)))
                polygon1 = geogoneService.appendValue(polygon1, new Point(Double.parseDouble(geo.latitude9), Double.parseDouble(geo.longitude9)))
            }
            if (geo.latitude10 != null && geo.longitude10 != null) {
                //polygon1.add(new Point(Double.parseDouble(geoZone.latitude6), Double.parseDouble(geoZone.longitude6)))
                polygon1 = geogoneService.appendValue(polygon1, new Point(Double.parseDouble(geo.latitude10), Double.parseDouble(geo.longitude10)))
            }

          //  println "size=" + polygon1.size()
            int n = polygon1.size();
          //  println "nnnnnnnnnnn" + n
            Point p = new Point(pointLatitude, pointLongitude);
            println("Point P(" + p.x + ", " + p.y
                    + ") lies inside polygon1: " + psp.isInside(polygon1, n, p));
            tf = psp.isInside(polygon1, n, p)
          //  println "ZZZZZZZZZZZZ" + tf


            if (tf == true) {
              //  println "xxxxxxxxxxxxxxxxxx" + tf
                statusCode = "in"
             //   println "xxxxxxxxxxxxxxxxxx" + statusCode
            } else {
                statusCode = "out"
            }
        }




    }

    def afterInsert(){


    }

}
