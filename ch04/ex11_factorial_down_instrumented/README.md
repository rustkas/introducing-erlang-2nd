Create new project
----	
Create ex10_factorialdown
----	
	$ rebar3 new umbrella ex11_factorial_down_instrumented
	$ cd ex11_factorial_down_instrumented
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib factorial_down_instrumented
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex11_factorial_down_instrumented && cd ex11_factorial_down_instrumented && rm -R apps && mkdir lib && cd lib && rebar3 new lib factorial_down_instrumented && cd ..

Test
-----
	$ rebar3 eunit -v --app factorial_down_instrumented