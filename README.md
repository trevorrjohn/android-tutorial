android-tutorial
================

1. Install Java 7 JDK <http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html>
2. export ``JAVA_HOME=`/usr/libexec/java_home` ``
3. More installations, this time it's the android-sdk. `$ brew install android-sdk`
4. export `ANDROID_HOME=/usr/local/opt/android-sdk`
5. Install HAXM <https://software.intel.com/sites/default/files/managed/68/45/haxm-macosx_r04.zip>. HAXM (Intel® Hardware Accelerated Execution Manager) "is a hardware-assisted virtualization engine (hypervisor) that uses Intel Virtualization Technology (Intel® VT) to speed up Android app emulation on a host machine." See <https://software.intel.com/en-us/android/articles/intel-hardware-accelerated-execution-manager> for more details.
6. Install sources `$ android`. We want to install 
    * Android SDK Tools, revision 22.6.4
    * Android SDK Platform-tools, revision 19.0.2
    * Android SDK Build-tools, revision 19.1
    * Documentation for Android SDK, API 19, revision 2
    * SDK Platform Android 4.3, API 18, revision 2
    * ARM EABI v7a System Image, Android API 18, revision 2
    * Intel x86 Atom System Image, Android API 18, revision 1
    * Google APIs, Android API 18, revision 3
    * Sources for Android SDK, API 18, revision 1
    * Intel x86 Emulator Accelerator (HAXM installer), revision 4

7. copy Robolectrics Deckard Gradle starter 

	```
	wget https://github.com/tjohn/deckard/archive/master.zip
	unzip master.zip
	mv deckard-master hello-world
	```

8. we should be able to run tests from the command line `$ cd deckard-gradle; ./gradlew clean test`
9. Install Injtellij: <http://www.jetbrains.com/idea/download/>. This may require an additional Java 6 runtime download.
10. Open up intellij and follow "Import Project" -> "Import Project from external model", select Gradle -> "Use default gradle wrapper"" -> "Finish"

11. We can't quite run tests yet, there are a few configuration things we need to set up with intellij first. So first thing:
	
	* Go to Project Structure -> Modules -> deckard-gradle -> Paths.
	* The value for 'Output path' should be filled in, but 'Test output path' will not be. Copy the text that's in 'Output path', paste into 'Test output path', but change the final 'build/classes/debug' to 'build/test-classes'. This is because the gradle android test plugin currently dumps all compiled test output (for all variants) into the same directory. This means that currently variants are not fully supported.
	 
12. Now go to the project window (CMD+1) and navigate to src/test/java. Right click and run tests (**using the bottom "Run Test"**, this is very important!). This runs the JUnit test runner not the default Android test runner. The JUnit test runner is what Robolectric uses. 
13. Crash bang... Did you see this?

	```
	!!! JUnit version 3.8 or later expected:

	java.lang.RuntimeException: Stub!
		at junit.runner.BaseTestRunner.<init>(BaseTestRunner.java:5)
		at junit.textui.TestRunner.<init>(TestRunner.java:54)
		at junit.textui.TestRunner.<init>(TestRunner.java:48)
		at junit.textui.TestRunner.<init>(TestRunner.java:41)
		...

	```

14. This means that our dependency order is out of wack. To fix this we must manual change the order. Go back to the project structure, or use the command (⌘;). Again navigate to Modules -> Dependencies -> Then click on Android API 18... and move it to the bottom of the list. Click ok to save.
15. ⇧+F10 to run the test again. And we should be green. 
16. But if we ever refresh our dependencies or add a new one then our order will be reset. This is annoying that we have to reorder our dependencies manually, luckily. I already added a script to fix this problem for us. We just need to add a build variable to our buil command. ⌘, or "File" -> "Preferences", then "Compiler" -> "Gradle" and in "VM Options" enter: `-Dintellij=true`. Open up the build.gradle to check out what it is doing. 