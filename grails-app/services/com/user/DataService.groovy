package com.user

import com.hrm.Role
import com.hrm.User
import com.hrm.UserRole
import grails.transaction.Transactional

@Transactional
class DataService {

    def createUser(User user) {
        println(user.toString())
        def testuser = user.save(failOnError:true)
        def testRole = Role.findByAuthority('ROLE_USER')
        UserRole.create(testuser, testRole,true)

        println(Role.get(1))
    }

}
