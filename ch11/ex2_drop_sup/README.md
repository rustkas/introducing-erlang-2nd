An OTP application

Create new project
----	
Create ex2_drop_sup
----	
	$ rebar3 ex2_drop_sup
	$ cd ex2_drop_sup
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib drop_sup
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex2_drop_sup && cd ex2_drop_sup && rm -R apps && mkdir lib && cd lib && rebar3 new lib drop_sup && cd ..

Build
-----
	$ rebar3 compile

Test
-----
	$ rebar3 eunit -v --app drop_sup
	
Format
-----
	$ rebar3 format
	
