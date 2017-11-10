(add-to-list 'semantic-lex-c-preprocessor-symbol-file
             "/home/user/Projects/websocket_poc/webserver/enableQt.h")

(ede-cpp-root-project "wallbox"
                       :name "wallbox"
                       :file "/home/user/Projects/wallbox/SW/Applicatif/NEWWBSTEP2_0.E.1_RC1/NEWWBSTEP2_Read_AppliVersion.bat"
                       :include-path '(
                                       "/Sources/BSP"
                                       "/Sources/BSP/GModbus"
                                       "/Sources/BSP/GModbus/Generic"
                                       "/Sources/BSP/GOS"
                                       "/Sources/BSP/GOS/Specific"
                                       "/Sources/BSP/GOS/Specific/EmbOS"
                                       "/Sources/BSP/GOS/Specific/EmbOS/STM32"
                                       "/Sources/BSP/GOS/Specific/EmbOS/Common"
                                       "/Sources/BSP/GOS/Generic"
                                       "/Sources/BSP/GOS/CPU"
                                       "/Sources/BSP/GOS/CPU/STM32"
                                       "/Sources/BSP/GOS/CPU/STM32/src"
                                       "/Sources/BSP/GOS/CPU/STM32/inc"
                                       "/Sources/BSP/GOS/CPU/STM32/spi"
                                       "/Sources/BSP/GOS/CPU/STM32/monitor"
                                       "/Sources/BSP/GOS/CPU/STM32/i2c"
                                       "/Sources/BSP/GOS/CPU/STM32/uart"
                                       "/Sources/BSP/GEMBuffer"
                                       "/Sources/BSP/GEMBuffer/Generic"
                                       "/Sources/BSP/Utilities"
                                       "/Sources/BSP/Utilities/Generic"
                                       "/Sources/BSP/EmbOS"
                                       "/Sources/BSP/EmbOS/3.84c"
                                       "/Sources/BSP/EmbOS/3.84c/STM32"
                                       "/Sources/BSP/EmbOS/3.84c/STM32/IAR6.30"
                                       "/Sources/BSP/EmbOS/3.84c/STM32/IAR6.30/INC"
                                       "/Sources/BSP/EmbOS/3.84c/STM32/IAR6.30/SRC"
                                       "/Sources/BSP/EmbOS/3.84c/STM32/IAR6.30/LIB"
                                       "/Sources/BSP/EmbOS/3.84c/STM32/IAR6.30/CPU"
                                       "/Sources/BSP/EmbOS/3.84c/STM32/IAR6.30/CPU/STM32"
                                       "/Sources/BSP/GFS"
                                       "/Sources/BSP/GFS/Generic"
                                       "/Sources/BSP/GFS/Files"
                                       "/Sources/BSP/GFS/Files/CEeprom"
                                       "/Sources/BSP/GFS/Files/CBinFiles"
                                       "/Sources/BSP/GFS/Files/CS19Files"
                                       "/Sources/BSP/GFS/Files/CBufferFiles"
                                       "/Sources/BSP/GFS/Files/CCmdWriter"
                                       "/Sources/BSP/GFS/Files/CRAMFiles"
                                       "/Sources/BSP/GFS/Files/CGPIO2Files"
                                       "/Sources/BSP/GFS/Files/CDumpFlashFiles"
                                       "/Sources/BSP/GFS/Files/IP"
                                       "/Sources/BSP/GFS/Files/IP/CTinyDPWSFile"
                                       "/Sources/BSP/GFS/Files/IP/CEepromFile"
                                       "/Sources/BSP/GFS/Files/IP/CFlashLogFile"
                                       "/Sources/BSP/GFS/Files/IP/CFlashFile"
                                       "/Sources/BSP/GFS/Files/IP/CBootFile"
                                       "/Sources/BSP/GEeprom"
                                       "/Sources/BSP/GEeprom/Specific"
                                       "/Sources/BSP/GEeprom/Specific/STM32"
                                       "/Sources/BSP/GEeprom/Specific/STM32/SPI"
                                       "/Sources/BSP/GEeprom/Specific/STM32/I2C"
                                       "/Sources/BSP/GEeprom/Generic"
                                       "/Sources/BSP/GClock"
                                       "/Sources/BSP/GClock/Specific"
                                       "/Sources/BSP/GClock/Specific/STM32"
                                       "/Sources/BSP/GClock/Generic"
                                       "/Sources/Appli"
                                       "/Sources/Appli/TestLevel3"
                                       "/Sources/Appli/MMI"
                                       "/Sources/Appli/Eeprom"
                                       "/Sources/Appli/Flash"
                                       "/Sources/Appli/I_max"
                                       "/Sources/Appli/Plug"
                                       "/Sources/Appli/Buzzer"
                                       "/Sources/Appli/Modbus"
                                       "/Sources/Appli/LedDriver"
                                       "/Sources/Appli/Cfg_Automaton"
                                       "/Sources/Appli/DI_Monitor"
                                       "/Sources/Appli/Contactor"
                                       "/Sources/Appli/CurrentCoding"
                                       "/Sources/Appli/RMS"
                                       "/Sources/Appli/Timer"
                                       "/Sources/Appli/Fan"
                                       "/Sources/Appli/TestLevel2"
                                       "/Sources/Appli/ControlPilot"
                                       "/Sources/Appli/Watchdog"
                                       "/Sources/Appli/TestLevel1"
                                       "/Sources/Appli/init"
                                       "/Sources/Appli/MNX"
                                       "/Sources/Appli/Automaton"
                                       "/Project"
                                       "/Project/GAIAPrj"
                                       )
                       :local-variables
                       '(;; split vertically !
                         (split-width-threshold . 160)
                         (split-height-threshold . nil)
                         ;; root dir name
                         (my-grep-root-name . '("Sources") )
                         ;; adding -L to follow link (needed to search in Project dir)
                         (grep-find-template . "find -L . <X> -type f <F> -exec grep <C> -nH -e <R> {} +")
                         )
                       )

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
