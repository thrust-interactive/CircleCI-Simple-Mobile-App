#! /bin/sh

# Example build script for Unity3D project. See the entire example: https://github.com/JonathanPorta/ci-build

# Change this the name of your project. This will be the name of the final executables as well.
project="Simple Mobile Placeholder"

# echo "Attempting to build $project for Windows"
# /Applications/Unity/Unity.app/Contents/MacOS/Unity \
#   -batchmode \
#   -nographics \
#   -silent-crashes \
#   -logFile $(pwd)/unity.log \
#   -projectPath $(pwd) \
#   -buildWindowsPlayer "$(pwd)/Build/windows/$project.exe" \
#   -quit

# echo "Attempting to build $project for OS X"
# /Applications/Unity/Unity.app/Contents/MacOS/Unity \
#   -batchmode \
#   -nographics \
#   -silent-crashes \
#   -logFile $(pwd)/unity.log \
#   -projectPath $(pwd) \
#   -buildOSXUniversalPlayer "$(pwd)/Build/osx/$project.app" \
#   -quit

echo "Attempting to build $project for iOS"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -silent-crashes \
  -serial "$serial" \
  -username "$username" \
  -password "$password" \
  -logFile $(pwd)/unity.log \
  -projectPath $(pwd) \
  -executeMethod CommandLineBuild.iOSBuild \
  -quit

echo 'Logs from build'
cat $(pwd)/unity.log 

echo "returning the license"

/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -returnlicense \
  -silent-crashes \
  -serial "$serial" \
  -username "$username" \
  -password "$password" \
  -logFile $(pwd)/unity.log \
  -projectPath $(pwd) \
  -quit

echo 'Logs from build returning license'
cat $(pwd)/unity.log 

cd Builds/iOS
xcodebuild -project Unity-iPhone.xcodeproj -scheme Unity-iPhone clean build CONFIGURATION_BUILD_DIR=$CIRCLE_ARTIFACTS



# echo "Attempting to build $project for Linux"
# /Applications/Unity/Unity.app/Contents/MacOS/Unity \
#   -batchmode \
#   -nographics \
#   -silent-crashes \
#   -logFile $(pwd)/unity.log \
#   -projectPath $(pwd) \
#   -buildLinuxUniversalPlayer "$(pwd)/Build/linux/$project.exe" \
#   -quit


