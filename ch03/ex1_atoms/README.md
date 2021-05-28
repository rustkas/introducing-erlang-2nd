An OTP application

Create new project
----	
Create ex1_atoms
----	
	$ rebar3 new umbrella ex1_atoms
	$ cd ex1_atoms
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib atoms
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex1_atoms && cd ex1_atoms && rm -R apps && mkdir lib && cd lib && rebar3 new lib atoms && cd ..

Test
-----
	$ rebar3 eunit -v --app atoms