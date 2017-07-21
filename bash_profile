if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi


# added by setup_fb4a.sh
export ANDROID_SDK=/Users/tian/android-sdk
export ANDROID_NDK_REPOSITORY=/Users/tian/android-ndk
export ANDROID_HOME=${ANDROID_SDK}
export PATH=${PATH}:${ANDROID_SDK}/tools:${ANDROID_SDK}/platform-tools

# BEGIN: Block added by chef, to set environment strings
# Please see https://fburl.com/AndroidProvisioning if you do not use bash
# or if you would rather this bit of code 'live' somewhere else
. ~/.fbchef/environment
# END: Block added by chef
