An OTP application

Check io:format output

----	
Create ex5_1_if_keyword
----	
	$ rebar3 new umbrella ex5_1_if_keyword
	$ cd ex5_if_keyword
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib if_keyword
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex5_1_if_keyword && cd ex5_1_if_keyword && rm -R apps && mkdir lib && cd lib && rebar3 new lib if_keyword && cd ..

Test
-----
	$ rebar3 eunit -v --app if_keyword