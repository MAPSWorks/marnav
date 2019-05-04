#!/bin/bash -e

export SCRIPT_BASE=$(dirname `readlink -f $0`)
export BASE=${SCRIPT_BASE}/..
export BUILD=${BASE}/build

dockerid=marnav:gcc-8.3.0
builddir=${BUILD}/$(echo "${dockerid}" | tr '/:' '__')

if [ ! -d ${builddir} ] ; then
	mkdir -p ${builddir}
fi

${SCRIPT_BASE}/docker-run.sh ${dockerid} "cmake -B ${builddir} -DCMAKE_BUILD_TYPE=Debug ${BASE}"
${SCRIPT_BASE}/docker-run.sh ${dockerid} "cmake --build ${builddir} -j 2"

