#!/bin/bash

echo "Don't use it like this, check adapt and use at your own risk"
return 



#kernel 
pushd kernel/samsung/chagalllte
git remote add exynos5420 https://github.com/exynos5420/android_kernel_samsung_exynos5420
git remote add CyanogenMod https://github.com/CyanogenMod/android_kernel_samsung_exynos5420 
git remote add cm-tab-s  https://github.com/CM-Tab-S/android_kernel_samsung_chagallwifi
git remote add andrewt12 https://github.com/Andrewt12/android_kernel_samsung_chagalllte
git remote add deadman96385 https://github.com/deadman96385/android_kernel_samsung_exynos5420
git remote add ssehovic https://github.com/ssehovic/android_kernel_samsung_chagalllte
git fetch --all
popd

#AOSP
pushd build
git remote add aosp https://android.googlesource.com/platform/build
git fetch aosp
popd

pushd external/boringssl
git remote add aosp https://android.googlesource.com/platform/external/boringssl
git fetch aosp
popd

pushd external/e2fsprogs
git remote add aosp https://android.googlesource.com/platform/external/e2fsprogs 
git fetch aosp
popd

pushd frameworks/av
git remote add aosp https://android.googlesource.com/platform/frameworks/av
git fetch aosp
popd

pushd frameworks/base
git remote add aosp  https://android.googlesource.com/platform/frameworks/base
git fetch aosp
popd

pushd frameworks/native
git remote add aosp https://android.googlesource.com/platform/frameworks/native
git fetch aosp
popd

pushd frameworks/opt/net/wifi 
git remote add aosp https://android.googlesource.com/platform/frameworks/opt/net/wifi 
git fetch aosp
popd

pushd frameworks/opt/telephony 
git remote add aosp https://android.googlesource.com/platform/frameworks/opt/telephony 
git fetch aosp
popd

pushd hardware/broadcom/libbt 
git remote add aosp https://android.googlesource.com/platform/hardware/broadcom/libbt 
git fetch aosp
popd

pushd hardware/libhardware 
git remote add aosp https://android.googlesource.com/platform/hardware/libhardware 
git fetch aosp
popd

pushd hardware/ril 
git remote add aosp https://android.googlesource.com/platform/hardware/ril 
git fetch aosp
popd

pushd packages/apps/Settings
git remote add aosp https://android.googlesource.com/platform/packages/apps/Settings
git fetch aosp
popd

pushd system/core 
git remote add aosp https://android.googlesource.com/platform/system/core 
git fetch aosp
popd

pushd system/sepolicy
git remote add aosp https://android.googlesource.com/platform/system/sepolicy
git fetch aosp
popd

#CM
pushd hardware/samsung
git remote add CyanogenMod https://github.com/CyanogenMod/android_hardware_samsung.git
git fetch CyanogenMod
popd

pushd hardware/samsung_slsi/exynos 
git remote add CyanogenMod https://github.com/CyanogenMod/android_hardware_samsung_slsi-cm_exynos 
git fetch CyanogenMod
popd

pushd hardware/samsung_slsi/exynos5-insignal
git remote add CyanogenMod https://github.com/CyanogenMod/android_hardware_samsung_slsi_exynos5-insignal
git fetch CyanogenMod
popd

pushd hardware/samsung_slsi/exynos5420
git remote add CyanogenMod https://github.com/CyanogenMod/android_hardware_samsung_slsi_exynos5420 
git fetch CyanogenMod
popd

pushd hardware/samsung_slsi/openmax
git remote add CyanogenMod https://github.com/CyanogenMod/android_hardware_samsung_slsi-cm_openmax 
git fetch CyanogenMod
popd

pushd system/vold
git remote add CyanogenMod https://github.com/CyanogenMod/android_system_vold 
git fetch CyanogenMod
popd

pushd device/samsung/chagalllte
git remote add CyanogenMod https://github.com/CyanogenMod/android_device_samsung_chagalllte
git fetch CyanogenMod
popd

#Same for those  : 
#git remote add CyanogenMod https://github.com/CyanogenMod/android_device_samsung_chagallwifi
#git remote add CyanogenMod https://github.com/CyanogenMod/android_device_samsung_klimtwifi
#git remote add CyanogenMod https://github.com/CyanogenMod/android_device_samsung_klimtlte

pushd vendor/samsung/chagalllte
git remote add CM-Tab-S https://github.com/CM-Tab-S/android_vendor_samsung_chagalllte
git fetch CM-Tab-S
popd

#Same for other devices
#...

#Misc

pushd packages/apps/OpenDelta 
git remote add omnirom https://github.com/omnirom/android_packages_apps_OpenDelta 
git fetch omnirom
popd

pushd android
git remote add  aosp https://android.googlesource.com/platform/manifest
git fetch aosp
popd
