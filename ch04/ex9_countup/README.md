An OTP application

Create new project
----	
Create ex9_countdown
----	
	$ rebar3 new umbrella ex9_countup
	$ cd ex9_countup
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib countup
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex9_countup && cd ex9_countup && rm -R apps && mkdir lib && cd lib && rebar3 new lib countup && cd ..

Run
-----
	$ rebar3 eunit -v --app countup