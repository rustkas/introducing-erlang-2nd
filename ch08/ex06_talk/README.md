An OTP application

Create new project
----	
Create ex6_talk
----	
	$ rebar3 ex6_talk
	$ cd ex6_talk
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib talk
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex6_talk && cd ex6_talk && rm -R apps && mkdir lib && cd lib && rebar3 new lib talk && cd ..

Test
-----
	$ rebar3 eunit -v --app talk
	
Run shell
-----
	$ rebar3 shell --apps talk