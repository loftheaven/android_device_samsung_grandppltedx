# Use uber-4.8 toolchain
# AOSP (or lineage one) will return NO LOGGING..
export ANDROID_EABI_TOOLCHAIN="prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-UB-4.8/bin"
export ANDROID_EABI_TOOLCHAIN_PATH=":prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-UB-4.8/bin"


# This is optional. It always errors out on my side
# Assertion `cnt
# Your mileage may vary
export LC_ALL=C
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

# 8GB-dual
add_lunch_combo lineage_grandppltedx-userdebug
add_lunch_combo lineage_grandppltedx-eng

# 16GB-single
add_lunch_combo lineage_grandppltedx16-userdebug
add_lunch_combo lineage_grandppltedx16-eng
