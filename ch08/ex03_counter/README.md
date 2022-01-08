An OTP application

Create new project
----	
Create ex3_counter
----	
	$ rebar3 ex3_counter
	$ cd ex3_counter
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib counter
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex3_counter && cd ex3_counter && rm -R apps && mkdir lib && cd lib && rebar3 new lib counter && cd ..

Test
-----
	$ rebar3 eunit -v --app counter

Run shell
-----
	$ rebar3 shell --apps counter