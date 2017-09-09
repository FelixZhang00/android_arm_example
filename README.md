# android_arm_example

build on macos.
ndk version:android-ndk-r13b

step1:
run `make`

step2:
`adb push hello /sdcard/hello1`

step3:
`adb shell`

step4：
`shell@shamu:/ $ su` , now we are in root.

step5：
copy the elf file on /data/local
`shell@shamu:/#mv /sdcard/hello1 /data/local`

step 6:
`shell@shamu:/data/local # chmod 755 hello1`

step 7:
run 
`shell@shamu:/data/local # ./hello1 `
