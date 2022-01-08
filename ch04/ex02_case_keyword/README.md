An OTP application

Create new project
----	
Create ex2_case_keyword
----	
	$ rebar3 new umbrella ex2_case_keyword
	$ cd ex2_case_keyword
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib case_keyword
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex2_case_keyword && cd ex2_case_keyword && rm -R apps && mkdir lib && cd lib && rebar3 new lib case_keyword && cd ..

Test
-----
	$ rebar3 eunit -v --app case_keyword

Run shell
-----
	$ rebar3 shell --apps if_keyword	