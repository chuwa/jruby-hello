## JRuby Hello World

2 JRuby versions now available:

* jruby-1.7.0.preview2 (default ruby runtime mode 1.9.3p203)
* jruby-1.6.7.2 (default ruby runtime mode 1.8.7-p357)

Here jruby-hello is a rails 3.2.8 (latest rails) project, so it's better to use jruby-1.7.0, although it's still in preview stage.

Install jruby-1.7.0.preview2 (here we use rvm, rbenv also works):

    $ rvm install jruby-1.7.0.preview2

2 start modes to choose:

1. start in an embedded tomcat instance (using trinidad)
2. packaged as a war package to be able to be deployed in an existing tomcat (or the other containers) instance


To start this app in an embedded tomcat container:

    $ cd jruby-hello
    $ bundle install
    $ rails s trinidad

To deploy in an existing tomcat instance:

First comment out trinidad gem in Gemfile (since it already embeds a tomcat instance, requires it will cause namespace collision error during app initialization), and rebundle:

    # gem 'trinidad', :require => false
    $ bundle install

Packaged as a war package usually means production deployment, so it uses production mode by default:

precompile the assets:

    $ rake assets:precompile

package:

    $ warble war

one jruby-hello.war package will be generated in the root directory, which can later be copied to the java web app container to finish the deployment.

----

# Torquebox
## install torquebox
```
gem install torquebox
```
start torquebox container
```
torquebox run
```
## deploy rails app
```
torquebox deploy
```
go to *http://localhost:8080*
## generate torquebox configuration
```
rake rails:template LOCATION=`torquebox env TORQUEBOX_HOME`/share/rails/template.rb
```
## add backstage management console
```
gem install torquebox-backstage
TORQUEBOX_HOME=`torquebox env torquebox_home` backstage deploy
```
go to *http://localhost:8080/backstage*

