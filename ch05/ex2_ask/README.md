An OTP application

Create new project
----	
Create ex2_ask
----	
	$ rebar3 new ex2_ask
	$ cd ex2_ask
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib ask
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex2_ask && cd ex2_ask && rm -R apps && mkdir lib && cd lib && rebar3 new lib ask && cd ..

Run
-----
	$ rebar3 eunit -v --app ask
	
	