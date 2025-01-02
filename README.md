# RTL-SDR VCVRack plugin

A voltage-controlled FM radio tuner for [VCVRack](https://vcvrack.com) supporting USB dongles via [librtlsdr](https://osmocom.org/projects/sdr/wiki/rtl-sdr). Based on [rtl_fm](http://kmkeen.com/rtl-demod-guide/)

[Downloads](https://vcvrack.com/plugins.html#RTL_SDR)

[![Build Status](https://travis-ci.org/WIZARDISHUNGRY/vcvrack-rtlsdr.svg?branch=master)](https://travis-ci.org/WIZARDISHUNGRY/vcvrack-rtlsdr)

## Build

Building a package requires the VCVRack source tree. You can either check out this module inside the `plugins` directory, or build with an explicit path like

    make RACK_DIR=$HOME/src/vcvrack

This branch can use [vcpkg](https://learn.microsoft.com/en-us/vcpkg/) to fetch dependencies, and requires that `vcpkg` already be installed. Before building, run

    make vcpkg
