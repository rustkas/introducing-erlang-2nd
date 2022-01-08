An OTP application

Create new project
----	
Create ex9_trapping
----	
	$ rebar3 ex9_trapping
	$ cd ex9_trapping
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib trapping
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex9_trapping && cd ex9_trapping && rm -R apps && mkdir lib && cd lib && rebar3 new lib trapping && cd ..

Test
-----
	$ rebar3 eunit -v --app trapping

Run shell
-----
	$ rebar3 shell --apps trapping