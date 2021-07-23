An OTP application

Create new project
----	
Create ex1_tracing
----	
	$ rebar3 ex1_tracing
	$ cd ex1_tracing
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib tracing
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex1_tracing && cd ex1_tracing && rm -R apps && mkdir lib && cd lib && rebar3 new lib tracing && cd ..

Test
-----
	$ rebar3 eunit -v --app tracing
