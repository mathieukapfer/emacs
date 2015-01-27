;;
(setq semantic-idle-scheduler-idle-time 10)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")
;; (ede-cpp-root-project "NAME" :file "FILENAME"
;;          :include-path '( "/include" "../include" "/c/include" )
;;          :system-include-path '( "/usr/include/c++/3.2.2/" )
;;          :spp-table '( ("MOOSE" . "")
;;                        ("CONST" . "const") ) )

(ede-cpp-root-project "EVSE" 
                       :file "/home/math/Projets/code/evse/Makefile.am" )

(ede-cpp-root-project "EVSE" 
                       :file "/home/math/Projets/code/evse/Makefile.am"
                       :include-path '( 
                                       "/src/log"
                                       "/src"
                                       "/src/io"
                                       "/src/mngt"
                                       "/src/fwupdate"
                                       "/src/hal"
                                       "/src/cpw"
                                       "/src/utils"
                                       "/src/utils/test"
                                       "/src/sqldb"
                                       "/src/database"
                                       "/src/modbus_proxy"
                                       "/src/modbusAction"
                                       "/src/gateway"
                                       "/src/delayServer"
                                       "/src/polling"
                                       "/src/xgcs"
                                       "/src/aMasterAdmin"
                                       "/src/aMasterBadgeMgr/api"
                                       "/src/aMasterBadgeMgr/txt"
                                       "/src/aMasterBadgeMgr/sqldb"
                                       "/src/aMasterGui"
                                       "/src/aMasterModel"
                                       "/src/aSlaveEnergy"
                                       "/src/aSlaveModel"
                                       "/src/aStationClusterMng"
                                       "/src/aStationClusterMng/test"
                                       "/src/aStationMngtIp"
                                       "/src/aSlavePowerMeter"
                                       "/src/aSlavePowerMeter/test"
                                       "/src/aSqlDbEngine"
                                       "/src/aSqlDbEngine/test"
                                       "/src/aUserManager"
                                       "/src/aUserManager/TestU"
                                       "/src/aLogManager"
                                       "/src/aBmwModel"
                                       "/src/aBmwModel/test"
                                       "/src/aEnergyMng"
                                       "/src/aEnergyMng/test"
                                       "/src/aErrorManager"
                                       "/src/aConnectivity"
                                       "/src/aConnectivity/test" ) 
                       )


  
