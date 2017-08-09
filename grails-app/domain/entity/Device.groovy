package entity

import com.hrm.Employee

class Device {

    String deviceName
    Integer deviceId
    Employee employee

   // static belongsTo= [employee:Employee]
    static hasMany = [event:EventData]

    static constraints = {

        deviceId(nullable: true,blank:true)
        deviceName(nullable: true,blank:true)
        employee(nullable: true,blank:true)

    }



}
