#!/bin/sh
# --

modules=(
  CocoaPods.RoxieMobile
)

# --
# Reliable way for a bash script to get the full path to itself?
# @link http://stackoverflow.com/a/4774063

pushd `dirname $0` > /dev/null
prefix=`pwd -P`
popd > /dev/null

# --

for module in "${modules[@]}" ; do
  folder=`pwd` ; cd "${prefix}/../Modules/${module}"

  echo "\033[0;31m>> ${module}\033[0m"
  ./gradlew -Pp=$1 -Pn=$2 -Pv=$3 setup

  echo ; cd $folder

done
