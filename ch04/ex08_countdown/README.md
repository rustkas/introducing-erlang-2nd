An OTP application

Create new project
----	
Create ex5_if_keyword
----	
	$ rebar3 new umbrella ex5_if_keyword
	$ cd ex5_if_keyword
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib if_keyword
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex8_countdown && cd ex8_countdown && rm -R apps && mkdir lib && cd lib && rebar3 new lib countdown && cd ..

Test
-----
	$ rebar3 eunit -v --app countdown

Run shell
-----
	$ rebar3 shell --apps countdown