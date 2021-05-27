ex1_drop
=====

An OTP application

Create new project
-----
Create ex1_drop
----	
	$ rebar3 new umbrella ex1_drop
	$ cd ex1_drop
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib drop
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex1_drop && cd ex1_drop && rm -R apps && mkdir lib && cd lib && rebar3 new lib drop && cd ..

Run
-----
	$ rebar3 eunit -v --app drop
	

	
	