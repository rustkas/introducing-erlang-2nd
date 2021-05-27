ex01_functions_modules
=====

An OTP application

Create new project
-----
Create ex01_functions_modules
----

    $ rebar3 new umbrella ex01_functions_modules
	$ cd ex01_functions_modules
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib functions_modules
	$ cd ..

Run
-----
    $ rebar3 eunit -v --app functions_modules
	
Create ex1_drop
----	
	$ rebar3 new umbrella ex1_drop
	$ cd ex1_drop
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib drop
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex1_drop && cd ex1_drop && rm -R apps && mkdir lib && cd lib && rebar3 new lib drop && cd ..

Run
-----
	$ rebar3 eunit -v --app drop
	
Create ex2_combined
----	
	$ rebar3 new umbrella ex2_combined
	$ cd ex2_combined
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib combined
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex2_combined && cd ex2_combined && rm -R apps && mkdir lib && cd lib && rebar3 new lib combined && cd ..

Run
-----
	$ rebar3 eunit -v --app combined
	
	