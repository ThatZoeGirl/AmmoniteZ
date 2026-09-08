#include "config.h"

Settings::Settings(QObject *parent) : QObject(parent) {
  _background = new Background(this);
}

Settings::~Settings() {}
