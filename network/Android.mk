LOCAL_PATH:= $(call my-dir)

# network plugin

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	common.c \
	connection.c \
	main.c \
	manager.c \
	server.c

LOCAL_CFLAGS:= \
	-DVERSION=\"4.69\" \
	-DSTORAGEDIR=\"/data/misc/bluetoothd\" \
	-DCONFIGDIR=\"/etc/bluetooth\" \
	-DANDROID_NO_BRIDGE \

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH)/../lib \
	$(LOCAL_PATH)/../src \
	$(LOCAL_PATH)/../gdbus \
	$(call include-path-for, glib) \
	$(call include-path-for, dbus)

LOCAL_SHARED_LIBRARIES := \
	libbluetoothd \
	libbluetooth \
	libdbus \
	libcutils \
	libglib \

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/bluez-plugin
LOCAL_UNSTRIPPED_PATH := $(TARGET_OUT_SHARED_LIBRARIES_UNSTRIPPED)/bluez-plugin
LOCAL_MODULE := network
LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)
