# Copyright (c) 2022 Dhruva Gole <goledhruva@gmail.com>
# SPDX-License-Identifier: Apache-2.0

FROM zephyrprojectrtos/ci:latest AS base

RUN \
  west init -m https://github.com/zephyrproject-rtos/gsoc-2022-arduino-core.git && west update \
  && git clone https://github.com/arduino/ArduinoCore-API.git ArduinoCore-API \
  && sed '/WCharacter.h/ s/./\/\/ &/' ArduinoCore-API/api/ArduinoAPI.h > ArduinoCore-API/api/tmpArduinoAPI.h \
  && mv ArduinoCore-API/api/tmpArduinoAPI.h ArduinoCore-API/api/ArduinoAPI.h \
  && cp -r /ArduinoCore-API/api /modules/lib/Arduino-Zephyr-API/cores/arduino/. \
  && cd modules/lib/Arduino-Zephyr-API && ls -la \
  && west build -p -b arduino_nano_33_ble samples/blinky_arduino \
  && printf '%s\n' "Module Successfully setup and built..."
