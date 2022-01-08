An OTP application

Create new project
----	
Create ex12_factorial_up
----	
	$ rebar3 new umbrella ex13_factorial_down
	$ cd ex13_factorial_down
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib factorial_down
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex13_factorial_down && cd ex13_factorial_down && rm -R apps && mkdir lib && cd lib && rebar3 new lib factorial_down && cd ..

Test
-----
	$ rebar3 eunit -v --app factorial_down

Run shell
-----
	$ rebar3 shell --apps factorial_down