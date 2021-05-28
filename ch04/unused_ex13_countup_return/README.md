Create new project
----	
Create ex12_factorial_up
----	
	$ rebar3 new unused_ex13_countupReturn
	$ cd unused_ex13_countupReturn
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib countupReturn
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella unused_ex13_countupReturn && cd unused_ex13_countupReturn && rm -R apps && mkdir lib && cd lib && rebar3 new lib countupReturn && cd ..

Test
-----
	$ rebar3 eunit -v --app countup_return