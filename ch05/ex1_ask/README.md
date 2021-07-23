An OTP application

Create new project
----	
Create ex1_ask
----	
	$ rebar3 new ex1_ask
	$ cd ex1_ask
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib ask
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex1_ask && cd ex1_ask && rm -R apps && mkdir lib && cd lib && rebar3 new lib ask && cd ..

Test
-----
	$ rebar3 eunit -v --app ask