Create new project
----	
Create ex2_drop
----	
	$ rebar3 new ex2_drop
	$ cd ex2_drop
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib drop
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex2_drop && cd ex2_drop && rm -R apps && mkdir lib && cd lib && rebar3 new lib drop && cd ..

Test
-----
	$ rebar3 eunit -v --app drop
	