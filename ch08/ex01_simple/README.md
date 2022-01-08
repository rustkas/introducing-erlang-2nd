Create new project
----	
Create ex1_simple
----	
	$ rebar3 ex1_simple
	$ cd ex1_simple
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib simple
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex1_simple && cd ex1_simple && rm -R apps && mkdir lib && cd lib && rebar3 new lib simple && cd ..

Test
-----
	$ rebar3 eunit -v --app simple
	
Run shell
-----
	$ rebar3 shell --apps simple
