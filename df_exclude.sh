#!/bin/bash
df -h | grep -v -E 'tmpfs|loop'
