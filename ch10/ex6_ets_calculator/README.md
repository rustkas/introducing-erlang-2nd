An OTP application

Create new project
----	
Create ex6_ets_calculator
----	
	$ rebar3 ex6_ets_calculator
	$ cd ex6_ets_calculator
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib ets_calculator
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex6_ets_calculator && cd ex6_ets_calculator && rm -R apps && mkdir lib && cd lib && rebar3 new lib ets_calculator && cd ..

Run
-----
	$ rebar3 eunit -v --app ets_calculator
	
	