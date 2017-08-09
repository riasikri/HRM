package entity

class Address {

    String city
    String state
    String country
    String location
    String zip

    /*static belongsTo=[company:Company,employee: Employee]
    static hasMany=[employee:Employee,
                    company:Company]*/



    static constraints = {

        city(nullable:true,blank:true)
        state(nullable:true,blank:true)
        country(nullable:true,blank:true)
        location(nullable:true,blank:false)
        zip(nullable:true,blank:true)

    }
}
