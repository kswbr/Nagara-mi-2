#!/bin/bash -eu
if [ $# -ne 1 ]; then
GCP_PROJECT=`gcloud config get-value project`
else
GCP_PROJECT=$1
fi

SHA=`git rev-parse HEAD`
gcloud docker --verbosity=error -- push asia.gcr.io/${GCP_PROJECT}/ruby:${SHA}
