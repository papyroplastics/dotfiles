#!/bin/sh
ansifilter | nvim -c "PagerSetLine $@" -R -
