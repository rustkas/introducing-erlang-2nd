An OTP application

Create new project
----	
Create ex12_factorial_up
----	
	$ rebar3 new umbrella ex12_factorial_up
	$ cd ex12_factorial_up
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib factorial_up
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex12_factorial_up && cd ex12_factorial_up && rm -R apps && mkdir lib && cd lib && rebar3 new lib factorial_up && cd ..

Test
-----
	$ rebar3 eunit -v --app factorial_up