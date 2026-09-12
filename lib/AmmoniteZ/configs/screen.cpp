#include "screen.h"
#include <QMetaType>
#include <qcontainerfwd.h>
#include <qforeach.h>
#include <qobject.h>
#include <qsettings.h>

Screen::Screen(QObject *parent) : QObject(parent) {}

Screen::Screen(QString name, QObject *parent) : QObject(parent) {
  _settings = new QSettings("Zoomi", "AmmoniteZ");
  _name = _settings->value("screens/screen/" + name + "/name", name).toString();
  _shell = _settings->value("screens/screen/" + name + "/shell", true).toBool();
  _background =
      _settings->value("screens/screen/" + name + "/background", true).toBool();
  _wallpaper =
      _settings->value("screens/screen/" + name + "/wallpaper", "global")
          .toString();
}

QString Screen::name() { return _name; }

bool Screen::shell() { return _shell; }

bool Screen::background() { return _background; }

QString Screen::wallpaper() { return _wallpaper; }

void Screen::setShell(const bool &shell) {
  _shell = shell;
  _settings->setValue("screens/screen/" + _name + "/shell", _shell);
  emit onShellChanged();
}

void Screen::setBackground(const bool &background) {
  _background = background;
  _settings->setValue("screens/screen/" + _name + "/background", _background);
  emit onBackgroundChanged();
}

void Screen::setWallpaper(const QString &wallpaper) {
  if (wallpaper.isNull())
    return;
  _wallpaper = wallpaper;
  _settings->setValue("screens/screen/" + _name + "/wallpaper", _wallpaper);
  emit onWallpaperChanged();
}

Screens::Screens(QObject *parent) : QObject(parent) {
  _screens = QList<Screen *>();
}

Screen *Screens::getScreen(QString name) {
  for (int i = 0; i < _screens.length(); i++) {
    Screen *s = _screens.value(i);
    if (s->name() == name)
      return s;
  }
  return NULL;
}

void Screens::addScreen(QString name) { _screens.push_back(new Screen(name)); }

void Screens::removeScreen(QString name) {
  for (int i = 0; i < _screens.length(); i++) {
    Screen *s = _screens.value(i);
    if (s->name() == name) {
      _screens.removeAt(i);
      return;
    }
  }
}
