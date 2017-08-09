package hrm

import com.hrm.Role
import com.hrm.User
import com.hrm.UserRole
import entity.EventData
import grails.converters.JSON

class BootStrap {


    /*def init = {servletContext -> registerMarshallers() }


    private void registerMarshallers(){
        JSON.registerObjectMarshaller(User) {

            def map = [

                    'id'                        : it.id?:"",
                    'username'                  : it.username?:"",
                    'password'                  : it.password?:"",
            ]
            return map
        }

    }
    //def userRole = new Role(authority: 'ROLE_USER').save()
    def adminRole = new Role(authority: 'ROLE_ADMIN').save()*/

    def init = { servletContext -> registerMarshallers()

        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def userRole = new Role(authority:'ROLE_USER').save()

        def testUser = new User(username: 'me', password: 'password').save()
        UserRole.create testUser, adminRole

        /*def teUser = new User(username: 'me2', password: '123').save()
        UserRole.create teUser, userRole, true

        for (user in User.findAllWhere(enabled:true)) {
            if (!UserRole.findByUserAndRole(user, userRole)) {
                UserRole.create user, adminRole
            }
        }*/

        UserRole.withSession {
            it.flush()
            it.clear()
        }
    }
    private void registerMarshallers(){
        JSON.registerObjectMarshaller(User) {

            def map = [

                    'id'                        : it.id?:"",
                    'username'                  : it.username?:"",
                    'password'                  : it.password?:"",
            ]
            return map
        }
        JSON.registerObjectMarshaller(EventData) {

            def map = [
                    'id'                       : it.id?:"",
                    'companyId'                : it.companyId?:"",
                    'creationTime'             : it.creationTime?:"",
                    'deviceId'                 : it.deviceId?:"",
                    'geozoneId'                : it.geozoneId?:"",
                    'latitude'                 : it.latitude?:"",
                    'longitude'                : it.longititude?:"",
                    'statusCode'               : it.statusCode?:""
            ]
            return map
        }

    }


//    def testUser = new Role(authority:'ROLE_USER').save()
}
