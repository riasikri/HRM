package entity

import com.hrm.Employee

class Department {

    Integer departmentId
    String departmentName

    static hasMany=[employee:Employee]
    static belongsTo = Employee

    static constraints ={


    }
}
