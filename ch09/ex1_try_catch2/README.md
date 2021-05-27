An OTP application

Create new project
----	
Create ex1_throw_exception
----	
	$ rebar3 ex1_throw_exception
	$ cd ex1_throw_exception
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib throw_exception
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex1_throw_exception && cd ex1_throw_exception && rm -R apps && mkdir lib && cd lib && rebar3 new lib throw_exception && cd ..

Run
-----
	$ rebar3 eunit -v --app throw_exception
	