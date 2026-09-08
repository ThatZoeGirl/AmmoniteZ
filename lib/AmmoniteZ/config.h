#ifndef SETTINGS_H
#define SETTINGS_H

#include <QMap>
#include <QObject>
#include <QQmlEngine>
#include <QSettings>
#include <QString>
#include <qhashfunctions.h>
#include <qqmlintegration.h>
#include <qsettings.h>
#include <qtmetamacros.h>

#include "configs/background.h"

class Settings : public QObject {
  Q_OBJECT
  QML_ELEMENT
  QML_SINGLETON

  Q_PROPERTY(Background *background READ bg CONSTANT)

public:
  explicit Settings(QObject *parent = nullptr);
  ~Settings();

  static QObject *singletonProvider(QQmlEngine *engine,
                                    QJSEngine *scriptEngine) {
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)
    return new Settings();
  }

  Background *bg() const { return _background; }

private:
  Background *_background;
};

#endif
