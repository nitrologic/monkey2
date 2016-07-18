
# stop on first error
set -e

mx2cc=""
mx2cc_new=""
ted2=""
ted2_new=""
launcher=""
launcher_new=""

if [ "$OSTYPE" = "linux-gnu" ]
then

	mx2cc="../bin/mx2cc_linux"
	mx2cc_new="../src/mx2cc/mx2cc.buildv1.0.0/desktop_release_linux/mx2cc"
	
	ted2="../bin/ted2_linux"
	ted2_new="../src/ted2/ted2.buildv1.0.0/desktop_release_linux"
	
	launcher="../Monkey2 (Linux)"
	launcher_new="../src/launcher/launcher.buildv1.0.0/desktop_release_linux/launcher"
	
fi

if [ "$OSTYPE" = "linux-gnueabihf" ]
then
	mx2cc="../bin/mx2cc_pi"
	mx2cc_new="../src/mx2cc/mx2cc.buildv1.0.0/desktop_release_pi/mx2cc"
	
	ted2="../bin/ted2_pi"
	ted2_new="../src/ted2/ted2.buildv1.0.0/desktop_release_pi"
	
	launcher="../Monkey2 (Pi)"
	launcher_new="../src/launcher/launcher.buildv1.0.0/desktop_release_pi/launcher"
	
fi

if [ "$OSTYPE" = "darwin15" ]
then

	mx2cc="../bin/mx2cc_macos"
	mx2cc_new="../src/mx2cc/mx2cc.buildv1.0.0/desktop_release_macos/mx2cc"
	
	ted2="../bin/ted2_macos.app"
	ted2_new="../src/ted2/ted2.buildv1.0.0/desktop_release_macos/ted2.app"
	
	launcher="../Monkey2 (Macos).app"
	launcher_new="../src/launcher/launcher.buildv1.0.0/desktop_release_macos/launcher.app"
fi
