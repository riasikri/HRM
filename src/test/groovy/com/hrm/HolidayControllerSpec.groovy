package com.hrm

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification
/*import grails.test.mixin.*

import org.junit.**/
/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@Mock([Holiday,Company])
@TestFor(HolidayController)
class HolidayControllerSpec extends Specification{

    def company, holiday,obj
    def setup() {
        company = new Company('Excite','11111','active','101000','aaa@gmail.com','9148939424','Brookefield','Bangalore','Karnataka','India',2.0,12.0 )
        company.save()
    }

    def cleanup() {
    }

    void "test holiday"() {

        /*obj = new HolidayController()
        String str = obj.hi()
        assert "Hello"== str*/

        /*when:
        controller.index()
        then:
        response.redirectedUrl == '/holiday/hi'*/




        /*when:
        holiday = new Holiday('2017-01-01','Holi',2017)
        company.addToHolidays(holiday)
        //holiday.save()
        then:
        response.redirectedUrl == '/holiday/holiday'*/

        /*expect:"fix me"
            true == false*/
    }
}
