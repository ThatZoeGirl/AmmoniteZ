#ifndef SCREEN_H
#define SCREEN_H

#include <QMetaType>
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

  Q_PROPERTY(QString name READ name NOTIFY onNameChanged)
  Q_PROPERTY(bool shell READ shell WRITE setShell NOTIFY onShellChanged)

  Q_PROPERTY(bool background READ background WRITE setBackground NOTIFY
                 onBackgroundChanged)
  Q_PROPERTY(QString wallpaper READ wallpaper WRITE setWallpaper NOTIFY
                 onWallpaperChanged)

public:
  explicit Screen(QObject *parent = nullptr);
  explicit Screen(QString name, QObject *parent = nullptr);

  QString name();

  bool shell();

  bool background();
  QString wallpaper();

public slots:
  void setShell(const bool &shell);

  void setBackground(const bool &background);
  void setWallpaper(const QString &wallpaper);

signals:
  void onNameChanged();
  void onShellChanged();

  void onBackgroundChanged();
  void onWallpaperChanged();

private:
  QString _name;
  bool _shell;

  bool _background;
  QString _wallpaper;

  QSettings *_settings;
};

class Screens : public QObject {
  Q_OBJECT
  QML_ELEMENT

public:
  explicit Screens(QObject *parent = nullptr);

  Q_INVOKABLE Screen *getScreen(QString name);
  Q_INVOKABLE void addScreen(QString name);
  Q_INVOKABLE void removeScreen(QString name);

private:
  QSettings *_settings;
  QList<Screen *> _screens;
};

#endif
