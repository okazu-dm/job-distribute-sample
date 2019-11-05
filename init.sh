#!/bin/bash


docker build --tag foo:latest .

mkdir -p shared/input shared/output shared/artifacts
cp sample_job shared/artifacts/
chmod 755 shared/artifacts/sample_job

for i in {0..300}; do
    echo "argument-$i" > shared/input/$i.txt
done

 