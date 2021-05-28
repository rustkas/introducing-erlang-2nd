An OTP application

Create new project
----	
Create ex3_underscore
----	
	$ rebar3 new umbrella ex3_underscore
	$ cd ex3_underscore
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib underscore
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex3_underscore && cd ex3_underscore && rm -R apps && mkdir lib && cd lib && rebar3 new lib underscore && cd ..

Test
-----
	$ rebar3 eunit -v --app underscore