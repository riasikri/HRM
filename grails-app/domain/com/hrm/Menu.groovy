package com.hrm

class Menu {

    static hasMany = [menus : Menu]
    static belongsTo = [module : Module]

    String name
    Integer orderBy
    Menu parent

    static constraints = {
        name nullable: true, blank: false
        parent nullable: true, blank: false
        orderBy nullable: true, blank: false
    }
}
