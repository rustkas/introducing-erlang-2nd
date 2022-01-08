An OTP application

Create new project
----	
Create ex4_ask
----	
	$ rebar3 new ex4_ask
	$ cd ex4_ask
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib ask
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex4_ask && cd ex4_ask && rm -R apps && mkdir lib && cd lib && rebar3 new lib ask && cd ..

Test
-----
	$ rebar3 eunit -v --app ask
	
Run shell
-----
	$ rebar3 shell --apps ask