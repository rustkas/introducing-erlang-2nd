ex2_combined
=====

An OTP application

Create new project
----	
Create ex2_combined
----	
	$ rebar3 new umbrella ex2_combined
	$ cd ex2_combined
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib combined
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex2_combined && cd ex2_combined && rm -R apps && mkdir lib && cd lib && rebar3 new lib combined && cd ..

Test
-----
	$ rebar3 eunit -v --app combined
	
