An OTP application

Create new project
----	
Create ex5_if_keyword
----	
	$ rebar3 new umbrella ex5_if_keyword
	$ cd ex5_if_keyword
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib if_keyword
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex5_if_keyword && cd ex5_if_keyword && rm -R apps && mkdir lib && cd lib && rebar3 new lib if_keyword && cd ..

Test
-----
	$ rebar3 eunit -v --app if_keyword

Run shell
-----
	$ rebar3 shell --apps if_keyword	