An OTP application

Create new project
----	
Create ex7_talking_procs
----	
	$ rebar3 ex7_talking_procs
	$ cd ex7_talking_procs
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib talking_procs
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex7_talking_procs && cd ex7_talking_procs && rm -R apps && mkdir lib && cd lib && rebar3 new lib talking_procs && cd ..

Test
-----
	$ rebar3 eunit -v --app talking_procs
	
Run shell
-----
	$ rebar3 shell --apps talking_procs