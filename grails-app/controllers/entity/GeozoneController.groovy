package entity

import com.hrm.Company
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured('permitAll')
class GeozoneController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
 //       println"oooooooooooooooo"+Geozone
        println":::::::::::::::::::"+Geozone.list(params)
       // render  model:[geozoneList: Geozone.list(params),geozoneCount: Geozone.count()]
    }

    @Secured(['ROLE_USER','ROLE_ADMIN'])
    def geozone(Integer max){
        println("*/*/*//*/*/**//*/*/*/*/*/*/*/*")
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

        render view: 'geozone', model:[geozoneList: Geozone.list(params), geozoneCount: Geozone.count(),from:from,to:to]
    }


    @Secured(['ROLE_USER','ROLE_ADMIN'])
    def ft(){
        println("89898989898989898988989898989")
        def path=params.str;
        def cr=params.st;
        def rad=params.stt
        def rect=params.stcnt;

        def ar

        if(path!='undefined'){
             ar=path.trim().split(" ")


        }
        else if(cr!='undefined'){

             ar=cr.trim().split(" ")

        }
        else if(rect!='undefined'){
            ar=rect.trim().split(" ")
        }

        Geozone geozone=new Geozone();

        String[] lat = new String[10];
        String[] lng = new String[10];
        int i =0;

        for(int j=0 ;j<ar.size(); j++){

           def g= ar[j].split(",")
            lat[i]=g[0]
            lng[i]=g[1]
            j=j+1
            i = i+1
        }




        geozone.latitude1=lat[0]
        geozone.longitude1=lng[0]

        geozone.latitude2=lat[1]
        geozone.longitude2=lng[1]

        geozone.latitude3=lat[2]
        geozone.longitude3=lng[2]

        geozone.latitude4=lat[3]
        geozone.longitude4=lng[3]

        geozone.latitude5=lat[4]
        geozone.longitude5=lng[4]

        geozone.latitude6=lat[5]
        geozone.longitude6=lng[5]

        geozone.latitude7=lat[6]
        geozone.longitude7=lng[6]

        geozone.latitude8=lat[7]
        geozone.longitude8=lng[7]

        geozone.latitude9=lat[8]
        geozone.longitude9=lng[8]

        geozone.latitude10=lat[9]
        geozone.longitude10=lng[9]

        geozone.radious=rad

        Company company=Company.findById(params.companyId)
        if(company){
            geozone.company=company
        }
        geozone.save(failOnError:true);
        println"lllll="+ geozone.getId()
        if(company){
            company.geoZone = geozone
            company.save(flush:true)
        }
        render geozone.getId()
    }

    @Secured(['ROLE_USER','ROLE_ADMIN'])
    def form() {
       //println("************************//////////////////////"+params.companyId)
       //Geozone geozone=Geozone.findById(params.id)
        //println("{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{"+geozone)
       //render view: '/form', model:[geozoneInstance: geozone]
        render view: '/form'
    }

  def gservice(){

  }


    def show(Geozone geozone) {
        respond geozone
    }

    def create() {
        respond new Geozone(params)
    }

    @Transactional
    def save(Geozone geozone) {
        if (geozone == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (geozone.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond geozone.errors, view:'create'
            return
        }

        geozone.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'geoZone.label', default: 'Geozone'), geozone.id])
                redirect geozone
            }
            '*' { respond geozone, [status: CREATED] }
        }
    }

    def edit(Geozone geozone) {
        respond geozone
    }

    @Transactional
    def update(Geozone geozone) {
        if (geozone == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (geozone.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond geozone.errors, view:'edit'
            return
        }

        geozone.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'geoZone.label', default: 'Geozone'), geozone.id])
                redirect geozone
            }
            '*'{ respond geozone, [status: OK] }
        }
    }

    @Transactional
    def delete(Geozone geozone) {

        if (geozone == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        geozone.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'geoZone.label', default: 'Geozone'), geozone.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'geoZone.label', default: 'Geozone'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }





}
