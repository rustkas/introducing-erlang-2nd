An OTP application

Create new project
----	
Create ex1_hof
----	
	$ rebar3 ex1_hof
	$ cd ex1_hof
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib hof
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex1_hof && cd ex1_hof && rm -R apps && mkdir lib && cd lib && rebar3 new lib hof && cd ..

Test
-----
	$ rebar3 eunit -v --app hof