#!/usr/bin/env bash

set -o pipefail
set -o errexit
set -o nounset
#set -o xtrace

__DIR__="$(cd "$(dirname "${0}")"; echo $(pwd))"
__BASE__="$(basename "${0}")"
__FILE__="${__DIR__}/${__BASE__}"

file="${__DIR__}/../android-vitality.iml"
tmp_file="/tmp/android-vitality-tmp.iml"
lines=$(cat ${file} | wc -l)
needed_lines=$((lines-3))
framework='<orderEntry type="jdk" jdkName="Android API [1-9]* Platform" jdkType="Android SDK" />'
vitality_android_sdk=$(grep "${framework}" ${file})

head -n ${needed_lines} ${file} | grep -v "${framework}" > ${tmp_file}

cat << EOF >> ${tmp_file}
${vitality_android_sdk}
  </component>
</module>

EOF

mv ${tmp_file} ${file}
