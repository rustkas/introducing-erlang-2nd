ex5_docs
=====

An OTP application

Create ex5_docs
----	
	$ rebar3 new umbrella ex5_docs
	$ cd ex5_docs
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib combined
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex5_docs && cd ex5_docs && rm -R apps && mkdir lib && cd lib && rebar3 new lib combined && cd ..

Make documentation

Copy file overview.edoc to combined/doc folder

Test
-----
	$ rebar3 edoc
