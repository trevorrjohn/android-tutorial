android-tutorial
================

1. Install Java JDK <http://download.oracle.com/otn-pub/java/jdk/7u60-b19/jdk-7u60-macosx-x64.dmg>
2. set JAVA_HOME ``$ export JAVA_HOME=`/usr/libexec/java_home` ``
3. clone Robolectrics Deckard Gradle starter <https://github.com/robolectric/deckard-gradle>. There is a maven version, but since gradle is the future, we are going with this. 
4. More installations, this time it's the android-sdk. `$ brew install android-sdk`
5. 6. export ANDROID_HOME=/usr/local/opt/android-sdk
6. Install HAXM <https://software.intel.com/sites/default/files/managed/68/45/haxm-macosx_r04.zip>. HAXM (Intel® Hardware Accelerated Execution Manager) "is a hardware-assisted virtualization engine (hypervisor) that uses Intel Virtualization Technology (Intel® VT) to speed up Android app emulation on a host machine." See <https://software.intel.com/en-us/android/articles/intel-hardware-accelerated-execution-manager> for more details.
7. Install sources `$ android`. We want to install 
    * - Android SDK Tools, revision 22.6.4
    * - Android SDK Platform-tools, revision 19.0.2
    * - Android SDK Build-tools, revision 19.1
    * - Documentation for Android SDK, API 19, revision 2
    * - SDK Platform Android 4.3, API 18, revision 2
    * - ARM EABI v7a System Image, Android API 18, revision 2
    * - Intel x86 Atom System Image, Android API 18, revision 1
    * - Google APIs, Android API 18, revision 3
    * - Sources for Android SDK, API 18, revision 1
    * - Intel x86 Emulator Accelerator (HAXM installer), revision 4
