NDK_ROOT=/Developer/android-ndk-r13b
TOOLCHAINS_ROOT=$(NDK_ROOT)/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64
TOOLCHAINS_PREFIX=$(TOOLCHAINS_ROOT)/bin/arm-linux-androideabi
TOOLCHAINS_INCLUDE=$(TOOLCHAINS_ROOT)/lib/gcc/arm-linux-androideabi/4.9.x/include-fixed

PLATFORM_ROOT=$(NDK_ROOT)/platforms/android-14/arch-arm
PLATFORM_INCLUDE=$(PLATFORM_ROOT)/usr/include
PLATFORM_LIB=$(PLATFORM_ROOT)/usr/lib

MODULE_NAME=hello
RM=rm

FLAGS=-I$(TOOLCHAINS_INCLUDE) \
	-I$(PLATFORM_INCLUDE) \
	-L$(PLATFORM_LIB) \
	-nostdlib \
	-lgcc \
	-Bdynamic \
	-lc \
	-pie \
	-fPIE

OBJS=$(MODULE_NAME).o \
	$(PLATFORM_LIB)/crtbegin_dynamic.o \
	$(PLATFORM_LIB)/crtend_android.o

# 生成预处理过程的中间文件
generate_i:
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) -E $(MODULE_NAME).c -o $(MODULE_NAME).i

#
generate_s:
	$(generate_i)
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) -S $(MODULE_NAME).i -o $(MODULE_NAME).s	

all:
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) -c $(MODULE_NAME).c -o $(MODULE_NAME).o
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) $(OBJS) -o $(MODULE_NAME)
clean:
	$(RM) *.o
install:
	adb push $(MODULE_NAME) /data/local/
	adb shell chmod 755 /data/local/$(MODULE_NAME)
