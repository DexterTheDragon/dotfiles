#!/bin/bash
find autoload colors doc ftdetect ftplugin indent plugin syntax -type l | xargs ls -l | grep external | awk '{print $8}' | xargs rm
