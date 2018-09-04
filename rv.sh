#!/bin/bash
set -x

json_out=`pwd`/error.sjon
report_out=`pwd`/report
export RVP_ANALYSIS_ARGS="--output=json" 
export RVP_REPORT_FILE=$json_out

make CC=rvpc
make test

touch $json_out && rv-html-report $json_out -o $report_out
rv-upload-report $report_out
