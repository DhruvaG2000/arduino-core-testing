FROM zephyrprojectrtos/ci:latest AS base

RUN \
  west init -m https://github.com/DhruvaG2000/arduino-core-testing.git && west update \
  && git clone https://github.com/arduino/ArduinoCore-API.git .ArduinoCore-API \
  && sed '/WCharacter.h/ s/./\/\/ &/' .ArduinoCore-API/api/ArduinoAPI.h > .ArduinoCore-API/api/tmpArduinoAPI.h \
  && mv .ArduinoCore-API/api/tmpArduinoAPI.h .ArduinoCore-API/api/ArduinoAPI.h \
  && ln -sf .ArduinoCore-API/api modules/lib/Arduino-Zephyr-API/cores/arduino/. \
  && ls -la && ls -la home/* \
  && cd modules/lib/Arduino-Zephyr-API && ls -la \
  && west build -p -b arduino_nano_33_ble samples/blinky_arduino \
  && printf '%s\n' "Module Successfully setup..."
