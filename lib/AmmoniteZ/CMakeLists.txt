qt_add_qml_module(AmmoniteZ
  URI AmmoniteZ
  SOURCES
    config.h
    config.cpp

    configs/background.h
    configs/background.cpp
)

install(TARGETS AmmoniteZ
  #LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    # OR install to QML module directory:
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/qt6/qml/AmmoniteZ
)

install(TARGETS AmmoniteZplugin
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/qt6/qml/AmmoniteZ
)

install(FILES "${CMAKE_CURRENT_BINARY_DIR}/qmldir"
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/qt6/qml/AmmoniteZ
)

install(FILES "${CMAKE_CURRENT_BINARY_DIR}/AmmoniteZ.qmltypes"
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/qt6/qml/AmmoniteZ
)
