package entity

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AttendanceDetailController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AttendanceDetail.list(params), model:[attendanceDetailCount: AttendanceDetail.count()]
    }
    @Secured(['ROLE_USER','ROLE_ADMIN'])
/*def atList(Integer max){
    [atd: AttendanceDetail.list(params), attendanceDetailCount: AttendanceDetail.count()]
}*/




    def show(AttendanceDetail attendanceDetail) {
        respond attendanceDetail
    }

    def create() {
        respond new AttendanceDetail(params)
    }

    @Transactional
    def save(AttendanceDetail attendanceDetail) {
        if (attendanceDetail == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (attendanceDetail.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond attendanceDetail.errors, view:'create'
            return
        }

        attendanceDetail.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'attendanceDetail.label', default: 'AttendanceDetail'), attendanceDetail.id])
                redirect attendanceDetail
            }
            '*' { respond attendanceDetail, [status: CREATED] }
        }
    }

    def edit(AttendanceDetail attendanceDetail) {
        respond attendanceDetail
    }

    @Transactional
    def update(AttendanceDetail attendanceDetail) {
        if (attendanceDetail == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (attendanceDetail.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond attendanceDetail.errors, view:'edit'
            return
        }

        attendanceDetail.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'attendanceDetail.label', default: 'AttendanceDetail'), attendanceDetail.id])
                redirect attendanceDetail
            }
            '*'{ respond attendanceDetail, [status: OK] }
        }
    }

    @Transactional
    def delete(AttendanceDetail attendanceDetail) {

        if (attendanceDetail == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        attendanceDetail.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'attendanceDetail.label', default: 'AttendanceDetail'), attendanceDetail.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'attendanceDetail.label', default: 'AttendanceDetail'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
