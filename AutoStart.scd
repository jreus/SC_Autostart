

/* Run from the terminal with

./sclang /...path.to.this.file.scd

*/

/* To make sclang available system-wide put a script in your path directory, i.e. /usr/bin or /usr/local/bin

For sclang:

#!/bin/sh
PWD=`pwd`
FILEPATH="${PWD}/$*"
cd /Applications/SuperCollider3.6.6/SuperCollider3.6.6.app/Contents/Resources
exec ./sclang "${FILEPATH}"


^^^ you can bundle this up in a script and run it. Replace filepath with your file. You can also run it from an AppleScript.

And for scsynth:

  #!/bin/sh
  cd /full/path/to/SuperCollider.app/Contents/Resources
  exec ./scsynth $*

NOTE: Why not symlinking them instead? Because:
- If you have Qt installed system-wide, sclang will complain that
  Qt frameworks are loaded twice.
- scsynth will not find the included "plugins", unless given explicitly
  with the -U commandline flag.


http://stackoverflow.com/questions/6442364/running-script-upon-login-mac


*/


// A bundled SC patch.
(
s.waitForBoot({

	q.notNil && {q.free};
	q = {|freq=10, gain=0.5|
		var in,out;
		in = SoundIn.ar(0);
		out = BPF.ar(in, freq, 0.07);
		[out,out] * gain;
	}.play;

	w.notNil && {w.close};
	w = Window.new("I catch keystrokes", Rect(128,64,400,50));
	w.view.keyDownAction = {|view, char, modifiers, unicode, keycode|
		var freq=100;
		[char, keycode].postln;
		keycode.switch(

			12, { freq=300 }, // q-p
			13, { freq=400 },
			14, { freq=500 },
			15, { freq=600 },
			17, { freq=700 },
			16, { freq=800 },
			32, { freq=900 },
			34, { freq=1000 },
			31, { freq=1100 },
			35, { freq=1200 },

			0, { freq=1330 }, // a-l
			1, { freq=1430 },
			2, { freq=1530 },
			3, { freq=1630 },
			5, { freq=1730 },
			4, { freq=1830 },
			38, { freq=1930 },
			40, { freq=2030 },
			37, { freq=2130 },


			6, { freq=2270 }, // z-m
			7, { freq=2370 },
			8, { freq=2470 },
			9, { freq=2570 },
			11, { freq=2670 },
			45, { freq=2770 },
			46, { freq=2870 },

			{freq=100}       // default
		);
		q.set(\freq,freq);
	};
	w.front;
});
)




// CMD-B boots the server

/*
Output of alphabetical keys.

[ q, 12 ]
[ w, 13 ]
[ e, 14 ]
[ r, 15 ]
[ t, 17 ]
[ y, 16 ]
[ u, 32 ]
[ i, 34 ]
[ o, 31 ]
[ p, 35 ]
[ a, 0 ]
[ s, 1 ]
[ d, 2 ]
[ f, 3 ]
[ g, 5 ]
[ h, 4 ]
[ j, 38 ]
[ k, 40 ]
[ l, 37 ]
[ z, 6 ]
[ x, 7 ]
[ c, 8 ]
[ v, 9 ]
[ b, 11 ]
[ n, 45 ]
[ m, 46 ]

*/