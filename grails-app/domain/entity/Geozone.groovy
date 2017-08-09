package entity

import com.hrm.Company

import java.sql.Time

class Geozone {


    String geozoneId
    Integer sortId
  //  Double minLatitude
   // Double maxLatitude
    //Double minLongititude
   // Double maxLongititude
    String zonepurposeId
    String reverseGeocode
    Time arrivalZone
    String departureStatusCode
    String autoNotify
    String zoomRegion
    String shapeColor
    String iconName
    String zonetype
    String radious

  //  String latitude;
   // String longitude;


    String latitude1
    String longitude1
    String latitude2
    String longitude2
    String latitude3
    String longitude3
    String latitude4
    String longitude4
    String latitude5
    String longitude5
    String latitude6
    String longitude6
    String latitude7
    String longitude7
    String latitude8
    String longitude8
    String latitude9
    String longitude9
    String latitude10
    String longitude10
    String clientUpload
    String clientId
    String groupId
    String streetAddress
    String city
    String state
    String postalCode
    String country
    String subdivision
    String contactPhone
    Boolean isActive
    String displayName
    String description
    Time lastUpdateTime
    Time creationTime
  //  String CenterLatitude
  //  String CenterLongitude
    Company company






  //  static belongsTo=[company:Company]

    static constraints = {
        sortId(nullable: true,blank: true)
      //  minLatitude(nullable: true,blank: true)
      //  minLongitude(nullable: true,blank: true)
       // maxLatitude(nullable: true,blank: true)
      //  maxLongitude(nullable: true,blank: true)
        zonepurposeId(nullable: true,blank:true)
        reverseGeocode(nullable: true,blank:true)
        arrivalZone(nullable: true,blank:true)
        departureStatusCode(nullable: true,blank:true)
        autoNotify(nullable: true,blank:true)
        zoomRegion(nullable: true,blank:true)
        shapeColor(nullable: true,blank:true)
        iconName(nullable: true,blank:true)
        zonetype(nullable: true,blank:true)
        radious(nullable: true,blank:true)
        latitude1(nullable: true,blank:true)
        longitude1(nullable: true,blank:true)
        latitude2(nullable: true,blank:true)
        longitude2(nullable: true,blank:true)
        latitude3(nullable: true,blank:true)
        longitude3(nullable: true,blank:true)
        latitude4(nullable: true,blank:true)
        longitude4(nullable: true,blank:true)
        latitude5(nullable: true,blank:true)
        longitude5(nullable: true,blank:true)
        latitude6(nullable: true,blank:true)
        longitude6(nullable: true,blank:true)
        latitude7(nullable: true,blank:true)
        longitude7(nullable: true,blank:true)
        latitude8(nullable: true,blank:true)
        longitude8(nullable: true,blank:true)
        latitude9(nullable: true,blank:true)
        longitude9(nullable: true,blank:true)
        latitude10(nullable: true,blank:true)
        longitude10(nullable: true,blank:true)

      //  latitude(nullable: true,blank:true)
      //  longitude(nullable: true,blank:true)

        clientUpload(nullable: true,blank:true)
        clientId(nullable: true,blank:true)
        groupId(nullable: true,blank:true)
        streetAddress(nullable: true,blank:true)
        city(nullable: true,blank:true)
        state(nullable: true,blank:true)
        postalCode(nullable: true,blank:true)
        subdivision(nullable: true,blank:true)
        contactPhone(nullable: true,blank:true)
        isActive(nullable: true,blank:true)
        displayName(nullable: true,blank:true)
        description(nullable: true,blank:true)
        lastUpdateTime(nullable: true,blank:true)
        creationTime(nullable: true,blank:true)
    //    CenterLatitude(nullable: true,blank:true)
      //  CenterLongitude(nullable: true,blank:true)
        country(nullable: true,blank:true)
       geozoneId(nullable: true,blank:true)
        company(nullable: true,blank:true)

    }





}
