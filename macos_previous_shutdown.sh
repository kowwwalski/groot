#!/bin/bash
log show --predicate 'eventMessage contains "Previous shutdown cause"' --last 24h
