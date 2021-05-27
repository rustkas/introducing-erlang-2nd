An OTP application

Create new project
----	
Create ex10_factorialdown
----	
	$ rebar3 new umbrella ex10_factorialdown
	$ cd ex10_factorialdown
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib factorialdown
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex10_factorialdown && cd ex10_factorialdown && rm -R apps && mkdir lib && cd lib && rebar3 new lib factorialdown && cd ..

Run
-----
	$ rebar3 eunit -v --app factorialdown
	