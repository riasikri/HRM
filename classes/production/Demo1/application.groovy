

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.user.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.user.UserRole'
grails.plugin.springsecurity.authority.className = 'com.user.Role'
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.securityConficType= "InterceptUrlMap"
//grails.plugin.springsecurity.logout.filterProcessorUrl='/'

//grails.plugin.springsecurity.controllerAnnotations.staticRules = [
grails.plugin.springsecurity.interceptUrlMap = [

	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets*',      access: ['permitAll']],
	[pattern: 'js*',       access: ['permitAll']],
	[pattern: 'css*',      access: ['permitAll']],
	[pattern: 'images*',   access: ['permitAll']],
	[pattern: 'favicon.ico', access: ['permitAll']],
	[pattern: '/user/register*', access: ['permitAll']],
	[pattern: '/api/**',       access: ['permitAll']]

]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/api/**',         filters: 'none'],
	[pattern: '/index',          filters: 'none'],
	[pattern: '/index.gsp',      filters: 'none'],
	[pattern: '/shutdown',      filters: 'none'],
	[pattern: '/user/register*',     filters: 'none'],
	[pattern: '/error',         filters: 'none'],
	[pattern: '/',         filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]
grails.mime.types = [
		json:          ['application/json', 'text/json'],
		xml:           ['text/xml', 'application/xml']
]
