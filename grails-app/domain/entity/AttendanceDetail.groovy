package entity

import com.hrm.Employee

class AttendanceDetail {

    Date attendanceDate
    String logIntime
    String logOuttime
    Long total
    Integer hr
    Integer min
    Integer sec

    static belongsTo = Employee
    //static hasOne = [employee:Employee]
    static constraints = {
        attendanceDate(nullable: true,blank: true)
        logIntime(nullable: true,blank: true)
        logOuttime(nullable: true,blank: true)
        total(nullable: true,blank: true)
        hr(nullable: true,blank: true)
        min(nullable: true,blank: true)
        sec(nullable: true,blank: true)
    }

}
