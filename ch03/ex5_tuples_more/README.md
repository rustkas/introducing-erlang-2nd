An OTP application

Create new project
----	
Create ex5_tuples_more
----	
	$ rebar3 new umbrella ex5_tuples_more
	$ cd ex5_tuples_more
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib tuples_more
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex5_tuples_more && cd ex5_tuples_more && rm -R apps && mkdir lib && cd lib && rebar3 new lib tuples_more && cd ..

Run
-----
	$ rebar3 eunit -v --app tuples_more