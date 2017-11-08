;;(add-to-list 'semantic-lex-c-preprocessor-symbol-file
;;             "/home/user/Projects/websocket_poc/webserver/enableQt.h")

(ede-cpp-root-project "historic-driver"
                      :name "historic-driver"
                      :file "/home/user/Projects/EV_HISTORIC/07_drivers/Makefile"
                      :include-path '(
                                      "DriverADC"
                                      "DriverBuzzer"
                                      "DriverFP"
                                      "DriverGPIO"
                                      "DriverLed"
                                      "DriverSC"
                                      "DriverSPI-Switch"
                                      )
                      :system-include-path '(
                                             "/home/user/Projects/EV_HISTORIC/02_kernel/include"
                                             )
                      )

(ede-cpp-root-project "dev-driver2"
                      :name "dev-driver2"
                      :file "/home/user/Code/LKM2/Makefile"
                      :include-path '(
                                      "."
                                      )
                       :system-include-path '(
                                              "/home/user/Projects/bsp/ev_link_bsp/output/build/linux-4.4.14/include"
                                              "/opt/arm/arm-buildroot-linux-gnueabi-4.9.3/usr/arm-buildroot-linux-gnueabi/include/c++/4.9.3"
                                              )
                      :local-variables
                       '((grep-command . "grep -nHi -e ")
                         (grep-find-command . ("find /home/user/Projects/bsp/ev_link_bsp/output/build/linux-4.4.14/drivers/ -type f -exec grep -nH -e  {} +" . 50))
                         )
                      )

(ede-cpp-root-project "dev-driver3"
                      :name "dev-driver3"
                      :file "/home/user/Code/LKM-M12/Makefile"
                      :include-path '(
                                      "."
                                      )
                       :system-include-path '(
                                              "/home/user/Projects/bsp/ev_link_bsp/output/build/linux-4.4.14/include"
                                              "/opt/arm/arm-buildroot-linux-gnueabi-4.9.3/usr/arm-buildroot-linux-gnueabi/include/c++/4.9.3"
                                              )
                      :local-variables
                       '((grep-command . "grep -nHi -e ")
                         (grep-find-command . ("find /home/user/Projects/bsp/ev_link_bsp/output/build/linux-4.4.14/drivers/ -type f -exec grep -nH -e  {} +" . 50))
                         )
                      )



(ede-cpp-root-project "new-driver"
                       :name "new-driver"
                       :file "/home/user/Projects/bsp/ev_link_bsp/output/build/linux-4.4.14/Makefile"
                       :include-path '(
                                       "."
                                       )
                       :system-include-path '(
                                              "/home/user/Projects/bsp/ev_link_bsp/output/build/linux-4.4.14/include"
                                              "/opt/arm/arm-buildroot-linux-gnueabi-4.9.3/usr/arm-buildroot-linux-gnueabi/include/c++/4.9.3"
                                              )
                       :spp-table '(
                                    ("CONFIG_IIO_BUFFER" . "")
                                    )
                       )

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
                                      "/src/OcppLib/Websocket/WebsocketServerPrivate"
                                      "/src/OcppLib/tests"
                                      "/src/OcppLib/Soap"
                                      "/src/OcppLib/Json"
                                      "/src/gsoap"
                                      )
                      :system-include-path '(
                                             "/home/user/Projects/websocket_poc/webserver/externals/poco/x86/include"
                                             "/home/user/Projects/websocket_poc/webserver/externals/qt/x86/include" )
                      :compile-command "make compile"
                      ;;:spp-files '("/enableQt.h")
    :spp-table '(
                 ;; OcppLib
                 ("ENABLE_QT" . "")
                 ;; QT
                 ("Q_CORE_EXPORT" . "")
                 ;; POCO
                 ("Net_API" ."")
                 ("Foundation_API" . "")
                 ("Util_API" . "")
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

(ede-cpp-root-project "dev-driver-se"
                      :name "dev-driver-se"
                      :file "/home/user/Projects/bsp_custom/evlink_charger_bsp_custom_for_pb/documentation/drivers/Makefile"
                      :include-path '(
                                      "."
                                      )
                       :system-include-path '(
                                              "/home/user/Projects/bsp/ev_link_bsp/output/build/linux-4.4.14/include"
                                              "/opt/arm/arm-buildroot-linux-gnueabi-4.9.3/usr/arm-buildroot-linux-gnueabi/include/c++/4.9.3"
                                              )
                      :local-variables
                       '((grep-command . "grep -nHi -e ")
                         (grep-find-command . ("find /home/user/Projects/bsp/ev_link_bsp/output/build/linux-4.4.14/drivers/ -type f -exec grep -nH -e  {} +" . 50))
                         )
                      )


;; (ede-cpp-root-project "testengine"
;;                       :name "testengine"
;;                       :file "/home/user/Projects/ev_link_charger/testengine/Makefile.am"
;;                       :include-path '(
;;                                       "/home/user/Projects/ev_link_charger/testengine/test-src"
;;                                       "/home/user/Projects/ev_link_charger/testengine/src"
;;                                       "/home/user/Projects/ev_link_charger/code/evse/src/main/test/Simu"
;;                                       "."
;;                                       )
;;                        :system-include-path '()
;;                       :local-variables
;;                        '((grep-command . "grep -nHi -e ")
;;                          (grep-find-command . ("find /home/user/Projects/ev_link_charger/testengine/ /home/user/Projects/ev_link_charger/code/evse/src/main/test/Simu -type f -exec grep -nH -e  {} +" . 50))
;;                          )
;;                       )
