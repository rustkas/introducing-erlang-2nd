An OTP application

Create new project
----	
Create ex03_records
----	
	$ rebar3 ex03_records
	$ cd ex03_records
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib records
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex03_records && cd ex03_records && rm -R apps && mkdir lib && cd lib && rebar3 new lib records && cd ..

Test
-----
	$ rebar3 eunit -v --app records