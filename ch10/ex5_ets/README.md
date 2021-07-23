An OTP application

Create new project
----	
Create ex5_ets
----	
	$ rebar3 ex5_ets
	$ cd ex5_ets
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib ets_example
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex5_ets && cd ex5_ets && rm -R apps && mkdir lib && cd lib && rebar3 new lib ets_example && cd ..

Test
-----
	$ rebar3 eunit -v --app ets_example