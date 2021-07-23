An OTP application

Create new project
----	
Create ex3_drop_app
----	
	$ rebar3 ex3_drop_app
	$ cd ex3_drop_app
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib drop_app
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex3_drop_app && cd ex3_drop_app && rm -R apps && mkdir lib && cd lib && rebar3 new lib drop_app && cd ..

Build
-----
	$ rebar3 compile

Test
-----
	$ rebar3 eunit -v --app drop
	
Format
-----
	$ rebar3 format
	