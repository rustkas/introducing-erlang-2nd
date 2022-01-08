An OTP application

Create new project
----	
Create ex5_division
----	
	$ rebar3 ex5_division
	$ cd ex5_division
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib division
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex5_division && cd ex5_division && rm -R apps && mkdir lib && cd lib && rebar3 new lib division && cd ..

Test
-----
	$ rebar3 eunit -v --app division
	
Run shell
-----
	$ rebar3 shell --apps division