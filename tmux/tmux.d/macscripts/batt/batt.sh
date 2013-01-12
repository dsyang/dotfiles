#!/bin/sh
pmset -g batt | grep Internal | perl "/Users/dsyang/Sandbox/scripts/batt/batt.pl"
