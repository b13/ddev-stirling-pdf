#!/usr/bin/env bats

setup_suite() {
  export DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
  set -eu -o pipefail
  export TESTDIR=~/tmp/test-stirling-pdf-addon
  mkdir -p $TESTDIR
  export PROJNAME=test-addon-stirling-pdf
  export DDEV_NON_INTERACTIVE=true

  ddev delete -Oy ${PROJNAME} >/dev/null 2>&1 || true
  cd "${TESTDIR}"
  ddev config --project-name=${PROJNAME}
  ddev start -y >/dev/null

  echo "# ddev get ${DIR} with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev get "${DIR}/.."
  cp -rf "$DIR" "$TESTDIR/"
  cp -rf "$DIR/testdata/stirling-pdf-DB.mv.db" "$TESTDIR/.ddev/stirling-pdf/extraConfigs/"
  ddev restart -y >/dev/null
}

teardown_suite() {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  ddev delete -Oy ${PROJNAME} >/dev/null 2>&1
  [ "${TESTDIR}" != "" ] && sudo rm -rf ${TESTDIR}
}
