FROM zephyrprojectrtos/ci:latest AS base

RUN \
  git clone https://github.com/arduino/ArduinoCore-API.git .ArduinoCore-API \
  && sed '/WCharacter.h/ s/./\/\/ &/' .ArduinoCore-API/api/ArduinoAPI.h > .ArduinoCore-API/api/tmpArduinoAPI.h \
  && mv .ArduinoCore-API/api/tmpArduinoAPI.h .ArduinoCore-API/api/ArduinoAPI.h \
  # && ln -sf ~/.ArduinoCore-API/api cores/arduino/. \
  && ls -la \
  && printf '%s\n' "Module Successfully setup..."
