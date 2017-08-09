package com.hrm

import entity.Address
import entity.AttendanceDetail
import entity.Department
import entity.Device

class Employee extends User{

    static hasMany = [employees: Employee,
                      assets: Asset,
                      leaves: Leaves,
                      departments: Department,
                      addresses: Address,
                      attendance: AttendanceDetail,
                      devices: Device]
    //static hasOne= [employeeLeave:  EmployeeLeave, roleEmployee: RoleEmployee]
    static belongsTo = [company : Company]

    RoleEmployee roleEmployee
    EmployeeLeave employeeLeave
    String firstName
    String middleName
    String lastName
    String email
    String phone
    String location
    String age
    String dob
    AttendanceDetail active
    Device activeDevice
    Company company
    Boolean isEmployee
    String createdBy
    Date createdDate
    String modifiedBy
    Date modifiedDate
    String employeeDeptName
    String deviceId


    static constraints = {
        firstName nullable: true, blank: false
        middleName nullable: true, blank: false
        lastName nullable: true, blank: false
        location nullable: true, blank: false
        email nullable: true, blank: false
        phone nullable: true, blank: false
        age nullable: true, blank: false
        isEmployee nullable: true, blank:false
        createdBy nullable: true, blank: false
        createdDate nullable: true, blank: false
        modifiedBy nullable: true, blank: false
        modifiedDate nullable: true, blank: false
        company nullable: true, blank: false
        employeeLeave nullable: true, blank:false
        dob nullable: true, blank:false
        employeeDeptName nullable: true, blank:false
        deviceId nullable: true, blank:false
        activeDevice nullable: true,blank: true
        active nullable: true,blank: true
    }


    static namedQueries = {

        findManagerByEmployee{ employeeId ->

            employees {eq 'id', employeeId}

        }

        findByAttendance { attendanceId ->

            attendance { eq 'id', attendanceId }

        }

    }

    static mapping = {
        discriminator 'isEmployee'
        tablePerHierarchy true
    }
}

