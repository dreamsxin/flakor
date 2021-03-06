LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := flakor_static
LOCAL_MODULE_FILENAME := libflakor

LOCAL_CFLAGS    := -Werror

BASE_PATH = $(LOCAL_PATH)/../

LOCAL_SRC_FILES := \
Flakor.cpp \

LOCAL_EXPORT_LDLIBS := -lGLESv1_CM \
                       -lGLESv2 \
                       -lEGL \
                       -llog \
                       -lz \
                       -landroid

LOCAL_LDLIBS := -lGLESv1_CM \
                   -lGLESv2 \
                   -lEGL \
                   -llog \
                   -lz \
                   -landroid


LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include

LOCAL_STATIC_LIBRARIES := jpeg
LOCAL_STATIC_LIBRARIES += png
LOCAL_CPP_EXTENSION := .cxx .cpp .cc
# define the macro to compile through support/zip_support/ioapi.c
#LOCAL_CFLAGS   :=  -DUSE_FILE32API
#LOCAL_CPPFLAGS := -Wno-deprecated-declarations -Wno-extern-c-compat
#LOCAL_EXPORT_CFLAGS   := -DUSE_FILE32API
#LOCAL_EXPORT_CPPFLAGS := -Wno-deprecated-declarations -Wno-extern-c-compat

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_ARM_NEON  := true
endif

include $(BUILD_STATIC_LIBRARY)
include $(CLEAR_VARS)
include $(LOCAL_PATH)/support/libjpeg/Android.mk  $(LOCAL_PATH)/support/libpng/Android.mk
