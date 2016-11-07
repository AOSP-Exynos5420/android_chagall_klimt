# Getting sources

repo init -u https://github.com/[USER NAME]/android_chagall_klimt.git -b nougat-release

repo sync

# Building sources
./build.sh <device> <clean/noclean>

./build.sh chagalllte noclean
