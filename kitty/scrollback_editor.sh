#!/bin/sh
ansifilter | nvim -R -c "PagerSetLine $@"
