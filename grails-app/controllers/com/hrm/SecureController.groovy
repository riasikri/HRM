package com.hrm

import entity.AttendanceDetail
import grails.plugin.springsecurity.annotation.Secured
import org.quartz.Scheduler
import org.quartz.impl.StdSchedulerFactory

import java.text.DateFormat
import java.text.SimpleDateFormat

@Secured('permitAll')
class SecureController {

    def springSecurityService
    def index() {
        Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler()
        scheduler.start()
        //Scheduler--------------------------------------------------------------------------------

        def name = springSecurityService.currentUser.getUsername()
        def user = User.findByUsername(name)
        if(user.class == User){
            redirect(controller: 'secure', action:'superAdmin')
        }else if(user.class == Employee){
            redirect(controller: 'secure', action:'user')
        }
    }

    def superAdmin(Integer max){
        def name = springSecurityService.currentUser.getUsername()
        params.max = Math.min(max ?: 3,3)
        def companyList= Company.list(params)
        Integer from = 0;
        Integer to = 0;
        if(!params.offset){
            params.offset = "0"
        }
        to = Integer.parseInt(params.offset)+params.max
        for(int i = from; i<=Company.count();i++){
            if(from != Company.count())
            {
                from = Integer.parseInt(params.offset)+1
            }
        }
        if(to>Company.count()){
            to=Company.count()
        }

        render (view: 'superAdmin', model: [username: name, companyData: companyList, from: from, to: to, companyCount: Company.count()])
    }
    def list(){
        redirect action: "superAdmin", params:params
    }

    def user(){
        def name = springSecurityService.currentUser.getUsername()
        def employee = Employee.findByUsername(name)
        if(employee.roleEmployee.accessibility.equals('high')){
            render(view: 'admin', model: [username: name, company: employee.company])
        }else if(employee.roleEmployee.accessibility.equals('normal')){
            Integer leaveCount = 0
            for(def emp: employee.employees){
                for(def leave : emp.leaves){
                    if(leave.status.equals('Pending')){
                        leaveCount++
                    }}}
            render(view: 'manager', model: [username: name, manager: employee, company: employee.company, leaveCount: leaveCount])
        }else if(employee.roleEmployee.accessibility.equals('low')){
            render(view: 'employee', model: [username: name, employee: employee, company: employee.company])
        }

    }

    def geoZone(Integer max) {
        params.max = Math.min(max ?: 10, 10)
        Integer from = 0;
        Integer to = 0;
        if (!params.offset) {
            params.offset = "0"
        }
        to = Integer.parseInt(params.offset) + params.max
        for (int i = from; i <= AttendanceDetail.count(); i++) {
            if (from != AttendanceDetail.count()) {
                from = Integer.parseInt(params.offset) + 1
            }
        }
        if (to > AttendanceDetail.count()) {
            to = AttendanceDetail.count()
        }


        def employeeCriteria = Employee.createCriteria()
        def atdresults = employeeCriteria.list(params) {
            if (params?.employeeName) {
                ilike("firstName", "%${params.employeeName}%")

            }

            if (params?.employeeParam) {
                eq("id",params.employeeParam as Long)

            }

        }
        def oo = []

        for(def jj:atdresults.attendance.id){
            jj.each{ j ->
                oo.add(j)
            }
        }

        def attendanceCriteria = AttendanceDetail.createCriteria()
        atdresults = attendanceCriteria.list(params) {
            if (params?.attendanceDate) {
                def string = params.attendanceDate;
                DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                Date date = format.parse(string);
                eq("attendanceDate",date)
            }
            if (params?.employeeParam || params?.employeeName) {
                if(oo){
                    'in'("id",oo)
                }

            }

        }
        render view: 'menu', model: [attendanceList: atdresults, attendanceDetailCount: AttendanceDetail.count(), empList: Employee.list(params), employeeCount: Employee.count(), from: from, to: to]
    }
}
