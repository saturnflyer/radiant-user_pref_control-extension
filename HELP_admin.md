This extension provides an alteration to the system to allow other extensions
the ability to provide more fields to the standard user.

By default, Radiant will check that the user submitted form only sends `email`,
`password` and `password_confirmation`. With User Pref Control, you'll be able
to use other extensions such as [User Home](http://ext.radiantcms.org/extensions/45-user-home).

User Pref Control manages protected attributes rather than allowed attributes
(which is the default without this extension). Those settings have defaults but
may be overridden by setting `Radiant::Config['user.protected_attributes']` to a 
comma-separated list. The default protected attributes are: 

    login, created_at, updated_at, created_by_id, updated_by_id, admin, developer, notes, lock_version, salt, session_token