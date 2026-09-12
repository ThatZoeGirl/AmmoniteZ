#include "background.h"

Background::Background(QObject *parent) : QObject(parent) {
  _settings = new QSettings("Zoomi", "AmmoniteZ");
  _active = _settings->value("background/active", "default").toString();
}

void Background::setActive(const QString &active) {
  if (_active == active)
    return;
  _active = active;
  _settings->setValue("background/active", active);
  emit activeChanged();
}

QString Background::getWallpaper(QString name) {
  return _settings->value("background/wallpapers/" + name, "default")
      .toString();
}

void Background::addWallpaper(QString name, QString path) {
  _settings->setValue("background/wallpapers/" + name, path);
}

void Background::removeWallpaper(QString name) {
  _settings->remove("background/wallpapers/" + name);
}
