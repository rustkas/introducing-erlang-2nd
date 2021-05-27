An OTP application

Create new project
----	
Create ex10_resilient
----	
	$ rebar3 ex10_resilient
	$ cd ex10_resilient
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib resilient
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex10_resilient && cd ex10_resilient && rm -R apps && mkdir lib && cd lib && rebar3 new lib resilient && cd ..

Run
-----
	$ rebar3 eunit -v --app resilient
	