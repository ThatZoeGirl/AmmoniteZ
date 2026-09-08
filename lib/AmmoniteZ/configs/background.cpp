#include "background.h"

Background::Background(QObject *parent) : QObject(parent) {
  _settings = new QSettings("Zoomi", "AmmoniteZ");
  _active = _settings->value("background/active", "default").toString();
  _wallpapers =
      _settings->value("background/wallpapers", QVariantMap()).toMap();
}

void Background::setActive(const QString &active) {
  if (_active == active)
    return;
  _active = active;
  _settings->setValue("background/active", active);
  emit activeChanged();
}

QString Background::getWallpaper(QString name) {
  return (_wallpapers.contains(name)) ? _wallpapers[name].toString()
                                      : QString();
}

void Background::addWallpaper(QString name, QString path) {
  _wallpapers.insert(name, path);
  _settings->setValue("background/wallpapers", _wallpapers);
}

void Background::removeWallpaper(QString name) {
  _wallpapers.remove(name);
  _settings->setValue("background/wallpapers", _wallpapers);
}
