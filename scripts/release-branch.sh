#!/bin/bash

last_tag=$(git describe --tags)
echo "$last_tag"