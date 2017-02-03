#! /bin/sh

project="Simple Mobile Placeholder"


echo "Attempting to build $project for iOS"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -silent-crashes \
  -serial "$UNITY_LICENSE_KEY" \
  -username "$UNITY_USERNAME" \
  -password "$UNITY_PASSWORD" \
  -logFile $(pwd)/unity.log \
  -projectPath $(pwd) \
  -executeMethod CommandLineBuild.iOSBuild \
  -quit

cp $(pwd)/unity.log $CIRCLE_ARTIFACTS/unity_build.log

echo "returning the license"

/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -returnlicense \
  -silent-crashes \
  -serial "$UNITY_LICENSE_KEY" \
  -username "$UNITY_USERNAME" \
  -password "$UNITY_PASSWORD" \
  -logFile $(pwd)/unity.log \
  -projectPath $(pwd) \
  -quit

cp $(pwd)/unity.log $CIRCLE_ARTIFACTS/unity_return_key.log
#
cd Builds/iOS
xcodebuild -project Unity-iPhone.xcodeproj -scheme Unity-iPhone clean build CONFIGURATION_BUILD_DIR=$CIRCLE_ARTIFACTS/build
