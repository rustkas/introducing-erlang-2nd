An OTP application

Create new project
----	
Create ex7_mnesia_example
----	
	$ rebar3 ex7_mnesia_example
	$ cd ex7_mnesia_example
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib mnesia_example
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex7_mnesia_example && cd ex7_mnesia_example && rm -R apps && mkdir lib && cd lib && rebar3 new lib mnesia_example && cd ..

Run
-----
	$ rebar3 eunit -v --app mnesia_example
	