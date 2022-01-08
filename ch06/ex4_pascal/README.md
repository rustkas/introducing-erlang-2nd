An OTP application

Create new project
----	
Create ex4_pascal
----	
	$ rebar3 new ex4_pascal
	$ cd ex4_pascal
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib pascal
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex4_pascal && cd ex4_pascal && rm -R apps && mkdir lib && cd lib && rebar3 new lib pascal && cd ..

Test
-----
	$ rebar3 eunit -v --app pascal
	
Run shell
-----
	$ rebar3 shell --apps pascal