#!/bin/sh
pmset -g batt | grep Internal | perl "/Users/dsyang/.tmux.d/macscripts/batt/batt.pl"
