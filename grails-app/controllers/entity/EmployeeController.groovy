package entity

import com.hrm.Employee
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EmployeeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    @Secured(['ROLE_USER','ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        println("employeeeeeeee"+Employee.list(params))

        render view: 'index' , model:[empList:Employee.list(params),employeeCount: Employee.count()]
    }
    @Secured(['ROLE_USER','ROLE_ADMIN'])
    def emp(Integer max) {

        render view: 'index',model:[empList:Employee.list(params),employeeCount: Employee.count()]
    }




    @Secured(['ROLE_USER','ROLE_ADMIN'])
    def show(Employee employee) {
        respond employee
    }
    @Secured(['ROLE_USER','ROLE_ADMIN'])
    def create() {
        respond new Employee(params)
    }

    @Transactional
    @Secured(['ROLE_USER','ROLE_ADMIN'])
    def save(Employee employee) {
        if (employee == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (employee.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond employee.errors, view:'create'
            return
        }

        employee.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'employee.label', default: 'Employee'), employee.id])
                redirect employee
            }
            '*' { respond employee, [status: CREATED] }
        }
    }
    @Secured(['ROLE_USER','ROLE_ADMIN'])
    def edit(Employee employee) {
        respond employee
    }

    @Transactional
    @Secured(['ROLE_USER','ROLE_ADMIN'])
    def update(Employee employee) {
        if (employee == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (employee.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond employee.errors, view:'edit'
            return
        }

        employee.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'employee.label', default: 'Employee'), employee.id])
                redirect employee
            }
            '*'{ respond employee, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_USER','ROLE_ADMIN'])
    def delete(Employee employee) {

        if (employee == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        employee.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'employee.label', default: 'Employee'), employee.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
