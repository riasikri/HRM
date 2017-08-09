package com.user

import com.hrm.User
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
@Secured(['ROLE_USER','ROLE_ADMIN'])
class UserController {

    static allowedMethods = [index:"GET", search:"GET", save: "POST", update: "PUT", delete: "DELETE"]
    static responseFormats=['json','xml']
    def dataService
    def index() {
        println("88888888888888888888888888888888")
        /* params.max = Math.min(max ?: 10, 100)*/
        respond User.list()
    }

    def show(Integer id) {
        println("fffffffffffffffffffffffffffffffffffff")
        respond User.findById(id)
    }

    def register(User newUser){
        println"IIIIIIIIIIIIIIIIIIIII"+newUser
        dataService.createUser(newUser)
        redirect url: '/'
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User user) {
        println("****************************"+user)
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            println(user.errors)
            transactionStatus.setRollbackOnly()
            //respond user.errors, view:'create'
            return
        }
        if(user.validate()) {
            if(user.save( flush: true)){
                dataService.createUser(user)
                println("saved successfully")

            }else{

                return
            }
            //render ([ message:"user created"] as JSON)
            respond user, [status: CREATED]
        }

        /*request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }*/
    }

    def edit(User user) {
        respond user
    }

    @Transactional
    def update(User user) {
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view:'edit'
            return
        }

        user.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    @Transactional
    def delete(User user) {
        println("deleteeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee")
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        user.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        println("huhfudhfudhfudhfudhfudhfudhfuhdfuhdufhduf");
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}