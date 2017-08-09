package com.hrm

import grails.plugin.springsecurity.annotation.Secured
import grails.rest.Resource
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

//@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
//@Secured(['ROLE_USER','ROLE_ADMIN'])
//@Resource(uri='/users', formats=['json'])
class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password

	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	User(String username, String password){
		this()
		this.username=username
		this.password=password

	}

	Set<Role> getAuthorities() {
		(UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
	}

	static constraints = {
		password blank: false, password: true
		username blank: false, unique: true

		//employee blank: false, nullable: true
	}

	static transients = ['springSecurityService']

	static mapping = {
		password column: '`password`'
//		tablePerHierarchy true
	}
}
