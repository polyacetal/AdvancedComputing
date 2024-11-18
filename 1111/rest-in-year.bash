#!/usr/bin/bash
echo "残り$(($(date -d 12/31 '+%-j')-$(date -d today '+%-j')))日"
