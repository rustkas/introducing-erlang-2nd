An OTP application

Create new project
----	
Create ex1_try_catch
----	
	$ rebar3 ex1_try_catch
	$ cd ex1-try_catch
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib try_catch
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex1_try_catch && cd ex1-try_catch && rm -R apps && mkdir lib && cd lib && rebar3 new lib try_catch && cd ..

Test
-----
	$ rebar3 eunit -v --app try_catch
	