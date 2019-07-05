PROJ_ROOT        := $(shell pwd)
INC = -I $(PROJ_ROOT)/include
LIB = -L $(PROJ_ROOT)/lib
CFLAGS += -Wall -Wextra
Fakeweb_C_PAGES := $(PROJ_ROOT)/out
LOCAL_TARGET := transform_to_fakeweb

#export Fakeweb_C_PAGES LOCAL_TARGET

objects := $(patsubst %.c, %.o,$(wildcard *.c))

#all:$(LOCAL_TARGET)
#	strip $(LOCAL_TARGET)

$(LOCAL_TARGET): init $(objects)
	cc $(CFLAGS) $(INC) -o $(LOCAL_TARGET) $(objects)
	strip $@
init:
	#mkdir -p $(BUILD_DIR)
	#mkdir -p $(HTML_folder)
	#mkdir -p $(CSS_folder)
	#mkdir -p $(JS_folder)


.PHONY: clean
clean:
	rm -rf *.o $(LOCAL_TARGET)
