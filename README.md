# RTL-SDR VCVRack plugin

A voltage-controlled FM radio tuner for [VCVRack](https://vcvrack.com) supporting USB dongles via [librtlsdr](https://osmocom.org/projects/sdr/wiki/rtl-sdr). Based on [rtl_fm](http://kmkeen.com/rtl-demod-guide/)

[Downloads](https://vcvrack.com/plugins.html#RTL_SDR)

[![Build Status](https://travis-ci.org/WIZARDISHUNGRY/vcvrack-rtlsdr.svg?branch=master)](https://travis-ci.org/WIZARDISHUNGRY/vcvrack-rtlsdr)

## Dependencies

On Mac, in addition to those needed by VCVRack

    brew install libusb librtlsdr

## Build

To build this, checkout the `vcvrack-rtlsdr` directory within the `plugins` directory of the `VCV` tree.

See <https://vcvrack.com/manual/PluginDevelopmentTutorial> for general advice.

Then just

    make

and then

    make install

If it does not load, check `log.txt` in the `Rack2` user directory.
