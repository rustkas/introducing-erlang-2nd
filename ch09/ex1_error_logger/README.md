An OTP application

Create new project
----	
Create ex1_error_logger
----	
	$ rebar3 ex1_error_logger
	$ cd ex1_error_logger
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib error_logger
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex1_error_logger && cd ex1_error_logger && rm -R apps && mkdir lib && cd lib && rebar3 new lib error_logger && cd ..

Run
-----
	$ rebar3 eunit -v --app error_logger
	
	