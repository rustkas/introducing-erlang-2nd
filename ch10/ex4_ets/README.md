An OTP application

Create new project
----	
Create ex4_ets
----	
	$ rebar3 ex4_ets
	$ cd ex4_ets
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib ets_example
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex4_ets && cd ex4_ets && rm -R apps && mkdir lib && cd lib && rebar3 new lib ets_example && cd ..

Run
-----
	$ rebar3 eunit -v --app ets_example
