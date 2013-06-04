class test {

	file{"/tmp/test_script.sh":
		owner => root,
		group => root,
		mode => 755,
		source => "puppet:///modules/test/test_script.sh",
		ensure => file;
	}->
	exec{"/tmp/test_script.sh":
		cwd => "/tmp",
	}

	# this "->" means that exec must only run if the file exist. the above can also be written as 
	#
	#file{"/tmp/test_script.sh":
	#	owner => root,
	#	group => root,
	#	mode => 755,
	#	source => "puppet:///modules/test/test_script.sh",
	#	ensure => file;
	#}
	#exec{"/tmp/test_script.sh":
	#	cwd => "/tmp",
	#	requires => File["/tmp/test_script.sh"]
	#}
	# test both. This is just a small introduction into inheritance in puppet.


	file{"/tmp/info.txt":
		owner => nobody,
		group => root,
		mode => 644,
		content => template("test/info_txt.erb"),
 	}
}