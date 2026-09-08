#ifndef BACKGROUND_H
#define BACKGROUND_H

#include <QMap>
#include <QObject>
#include <QSettings>
#include <QString>
#include <qhashfunctions.h>
#include <qqmlintegration.h>
#include <qsettings.h>
#include <qtmetamacros.h>

class Background : public QObject {
  Q_OBJECT
  QML_ELEMENT
  Q_PROPERTY(QString active READ active WRITE setActive NOTIFY activeChanged)

public:
  explicit Background(QObject *parent = nullptr);

  QString active() const {
    return (_wallpapers.contains(_active)) ? _wallpapers[_active].toString()
                                           : QString();
  }

  Q_INVOKABLE QString getWallpaper(QString name);
  Q_INVOKABLE void addWallpaper(QString name, QString path);
  Q_INVOKABLE void removeWallpaper(QString name);

public slots:
  void setActive(const QString &active);

signals:
  void activeChanged();

private:
  QSettings *_settings;
  QString _active;
  QVariantMap _wallpapers;
};

#endif
