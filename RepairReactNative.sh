 #!/bin/bash

green=`tput setaf 2`

echo "${green}[Reactive native repair]"

yarn

rm -rf node_modules/react-native/third-party/* > /dev/null
mkdir -p node_modules/react-native/third-party/
cd node_modules/react-native/third-party/ && wget http://r.devdylan.cn/repair.zip

unzip repair.zip
for i in $(ls *.tar.gz);do tar -zxvf $i;done > /dev/null

rm -rf __MACOSX > /dev/null
rm -rf repair.zip > /dev/null

mkdir -p ~/.rncache/
mv -f *.tar.gz ~/.rncache/

cd glog-0.3.4 && ../../scripts/ios-configure-glog.sh

sudo xcode-select -s /Applications/Xcode.app/Contents/Developer > /dev/null
sudo xcode-select -s /Applications/Xcode-beta.app/Contents/Developer > /dev/null

echo "${green}[Completed!]"