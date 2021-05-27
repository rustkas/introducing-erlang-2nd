An OTP application

Create new project
----	
Create ex1_drop
----	
	$ rebar3 ex1_drop
	$ cd ex1_drop
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib drop
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex1_drop && cd ex1_drop && rm -R apps && mkdir lib && cd lib && rebar3 new lib drop && cd ..

Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app drop
	
Format
-----
	$ rebar3 format