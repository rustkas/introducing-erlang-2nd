An OTP application

Create new project
----	
Create ex2_recursion
----	
	$ rebar3 ex2_recursion
	$ cd ex2_recursion
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib recursion
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex2_recursion && cd ex2_recursion && rm -R apps && mkdir lib && cd lib && rebar3 new lib recursion && cd ..

Test
-----
	$ rebar3 eunit -v --app recursion

Run shell
-----
	$ rebar3 shell --apps recursion