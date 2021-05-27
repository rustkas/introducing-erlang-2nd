An OTP application

Create new project
----	
Create ex01_string_concut
----	
	$ rebar3 new ex01_string_concut
	$ cd ex01_string_concut
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib string_concut
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex01_string_concut && cd ex01_string_concut && rm -R apps && mkdir lib && cd lib && rebar3 new lib string_concut && cd ..

Run
-----
	$ rebar3 eunit -v --app string_concut