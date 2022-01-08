An OTP application

Create new project
----	
Create ex1_product
----	
	$ rebar3 new ex1_product
	$ cd ex1_product
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib product
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex1_product && cd ex1_product && rm -R apps && mkdir lib && cd lib && rebar3 new lib product && cd ..

Test
-----
	$ rebar3 eunit -v --app product
	
Run shell
-----
	$ rebar3 shell --apps product