#!/usr/bin/env bash
version=$1

major=`echo ${version} | cut -d. -f1`
minor=`echo ${version} | cut -d. -f2`

echo "$major.$minor"