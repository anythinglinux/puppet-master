#site.pp
#
# First file read, contains site configuration for puppet master
#
#########

#import modules and nodes 
import	"modules"
import	"nodes"

filebucket { main: server => puppetmaster}


#global defaults

File {backup => main}
Exec {path => "/usr/bin:/usr/sbin:/bin:/sbin"}

