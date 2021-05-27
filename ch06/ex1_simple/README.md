An OTP application

Create new project
----	
Create ex1_simple
----	
	$ rebar3 new ex1_simple
	$ cd ex1_simple
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib simple
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex1_simple && cd ex1_simple && rm -R apps && mkdir lib && cd lib && rebar3 new lib simple && cd ..

Run
-----
	$ rebar3 eunit -v --app simple
An OTP application

Create new project
----	
Create ex1_simple
----	
	$ rebar3 new ex1_simple
	$ cd ex1_simple
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib simple
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex1_simple && cd ex1_simple && rm -R apps && mkdir lib && cd lib && rebar3 new lib simple && cd ..

Run
-----
	$ rebar3 eunit -v --app ask
