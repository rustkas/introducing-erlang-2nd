Create new project
----	
Create ex12_factorial_up
----	
	$ rebar3 new ex09_countup_unused_variable
	$ cd ex09_countup_unused_variable
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib countup
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex09_countup_unused_variable && cd ex09_countup_unused_variable && rm -R apps && mkdir lib && cd lib && rebar3 new lib countup && cd ..

Test
-----
	$ rebar3 eunit -v --app countup

Run shell
-----
	$ rebar3 shell --apps countup