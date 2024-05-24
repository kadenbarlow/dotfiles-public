#!/usr/bin/env bash

# To execute javascript or to view a tab's source you must first enable View > Developer > Allow JavaScript from 
# Apple Events. More details here. Thanks to @kevinfrommelt and @paulp for providing this information.
TAB_ID=`chrome-cli open 'chrome://inspect/#devices' -n | head -n 1 | awk '{ print $2 }'`
sleep 0.5
chrome-cli execute "document.getElementById('node-frontend').click()" -t $TAB_ID && chrome-cli close -t $TAB_ID
