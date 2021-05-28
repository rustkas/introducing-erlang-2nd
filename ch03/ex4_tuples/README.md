An OTP application

Create new project
----	
Create ex4_tuples
----	
	$ rebar3 new umbrella ex4_tuples
	$ cd ex4_tuples
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib tuples
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex4_tuples && cd ex4_tuples && rm -R apps && mkdir lib && cd lib && rebar3 new lib tuples && cd ..

Test
-----
	$ rebar3 eunit -v --app tuples