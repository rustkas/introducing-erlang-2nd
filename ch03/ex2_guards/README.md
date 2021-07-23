An OTP application

Create new project
----	
Create ex2_guards
----	
	$ rebar3 new umbrella ex2_guards
	$ cd ex2_guards
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib guards
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex2_guards && cd ex2_guards && rm -R apps && mkdir lib && cd lib && rebar3 new lib guards && cd ..

Test
-----
	$ rebar3 eunit -v --app guards