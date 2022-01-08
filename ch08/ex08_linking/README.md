An OTP application

Create new project
----	
Create ex8_linking
----	
	$ rebar3 ex8_linking
	$ cd ex8_linking
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib linking
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex8_linking && cd ex8_linking && rm -R apps && mkdir lib && cd lib && rebar3 new lib linking && cd ..

Test
-----
	$ rebar3 eunit -v --app linking

Run shell
-----
	$ rebar3 shell --apps linking