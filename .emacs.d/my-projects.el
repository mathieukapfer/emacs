(ede-cpp-root-project "websocket"
                      :name "websocket"
                      :file "/home/user/Projects/websocket_poc/webserver/README.md"
                      :include-path '(
                                      "/src"
                                      "/src/common"
                                      "/src/Supervision"
                                      "/src/Borne"
                                      "/src/OcppLib"
                                      "/src/OcppLib/Message"
                                      "/src/OcppLib/Websocket"
                                      "/src/OcppLib/tests"
                                      "/src/OcppLib/Soap"
                                      "/src/OcppLib/Json"
                                      "/src/gsoap"
                                      )
                      :system-include-path '(
                                             "/home/user/Projects/websocket_poc/webserver/externals/poco/x86/include"
                                             "/home/user/Projects/websocket_poc/webserver/externals/qt/x86/include" )
    :compile-command "make compile"
    :spp-table '(
                 ;; QT
                 ("Q_CORE_EXPORT" . "")
                 ;; POCO
                 ("Net_API" ."")
                 ("Foundation_API" . "")
                 )
    )


(ede-cpp-root-project "poco"
                      :name "poco"
                      :file "/home/user/Projects/websocket_poc/poco/README.md"
                      :directory "/home/user/Projects/websocket_poc/poco"
                      :include-path '(
                                      ;; cpp
                                      "/Net/src"
                                      ;; header
                                      "."
                                      "/Data/SQLite/include"
                                      "/Data/ODBC/include"
                                      "/Data/MySQL/include"
                                      "/Data/include"
                                      "/Crypto/include"
                                      "/XML/include"
                                      "/MongoDB/include"
                                      "/Zip/include"
                                      "/Foundation/include"
                                      "/SevenZip/include"
                                      "/CppParser/include"
                                      "/PDF/include"
                                      "/JSON/include"
                                      "/ApacheConnector/include"
                                      "/Util/include"
                                      "/Net/include"
                                      "/CppUnit/WinTestRunner/include"
                                      "/CppUnit/include"
                                      "/NetSSL_OpenSSL/include"
                                      "/NetSSL_Win/include"
                                      )
                      ;;:system-include-path '()
    :compile-command "make compile"
    :spp-table '(
                 ("Net_API" ."")
                 ("Foundation_API" . "")
                 )
    )

(ede-cpp-root-project "poco-demo"
                      :name "poco-demo"
                      :file "/home/user/Code/poco/PocoNet/Makefile"
                      ;;:directory "/home/user/Code/poco"
                      :system-include-path '("/home/user/Projects/websocket_poc/webserver/externals/poco/x86/include")
                      :compile-command "make compile"
                      :spp-table '(
                                   ("Net_API" ."")
                                   )
                      )

(ede-cpp-root-project "qt-demo"
                      :name "qt-demo"
                      :file "/home/user/Code/qt/net/Makefile"
                      :include-path '("/simple"
                                      "/client"
                                      "/server"
                                      "/websocketserver"
                                      "/websocketclient"
                                      )
                      :system-include-path '("/home/user/Projects/qt5/qt5/qtbase/include"
                                             "/home/user/Projects/qt5/qt5/qtwebsockets/include")
                      :spp-table '(
                                   ("Net_API" ."")
                                   )
                      )
