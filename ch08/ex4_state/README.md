An OTP application

Create new project
----	
Create ex4_state
----	
	$ rebar3 ex4_state
	$ cd ex4_state
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib state
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex4_state && cd ex4_state && rm -R apps && mkdir lib && cd lib && rebar3 new lib state && cd ..

Run
-----
	$ rebar3 eunit -v --app state
	
	