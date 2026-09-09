#ifndef SCREEN_H
#define SCREEN_H

#include <QObject>
#include <QSettings>
#include <QString>
#include <qobject.h>
#include <qqmlintegration.h>
#include <qtmetamacros.h>
#include <qvariant.h>

class Screen : public QObject {
  Q_OBJECT
  QML_ELEMENT

  Q_PROPERTY(QString name READ name WRITE setName NOTIFY onNameChanged)
  Q_PROPERTY(bool shell READ shell WRITE setShell NOTIFY onShellChanged)

  Q_PROPERTY(bool background READ background WRITE setBackground NOTIFY
                 onBackgroundChanged)
  Q_PROPERTY(QString wallpaper READ wallpaper WRITE setWallpaper NOTIFY
                 onWallpaperChnaged)

public:
  explicit Screen(QObject *parent = nullptr);

  QString name();

  bool shell();

  bool background();
  QString wallpaper();

  QVariant toVariant();
  static Screen fromVariant();

public slots:
  void setName(const QString &name);
  void setShell(const bool &shell);

  bool setBackground(const bool &background);
  QString setWallpaper(const QString &wallpaper);

signals:
  void onNameChanged();
  void onShellChanged();

  void onBackgroundChanged();
  void onWallpaperWhanged();

private:
  QString _name;
  bool _shell;

  bool _background;
  QString _wallpaper;
};

class Screens : public QObject {
  Q_OBJECT
  QML_ELEMENT

public:
  explicit Screens(QObject *parent = nullptr);

  Q_INVOKABLE Screen getScreen(QString name);
  Q_INVOKABLE void setScreen(QString name, Screen *screen);
  Q_INVOKABLE void removeScreen(QString name);

private:
  QSettings *_settings;
  QMap<QString, Screen> _screens;
};

#endif
