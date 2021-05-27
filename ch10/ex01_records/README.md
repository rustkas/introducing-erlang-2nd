An OTP application

Create new project
----	
Create ex01_records
----	
	$ rebar3 ex01_records
	$ cd ex01_records
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib records
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex01_records && cd ex01_records && rm -R apps && mkdir lib && cd lib && rebar3 new lib records && cd ..

Run
-----
	$ rebar3 eunit -v --app records
	