
(setq include-dir-evse  (list
                         "/home/math/Projets/code/evse/src/webserver" "/home/math/Projets/code/evse/src/webserver/cgiServer" "/home/math/Projets/code/evse/src/webserver/cgiServer/values" "/home/math/Projets/code/evse/src/webserver/cgiServer/typeserver" "/home/math/Projets/code/evse/src/webserver/cgiServer/plcbadgemgr" "/home/math/Projets/code/evse/src/webserver/cgiServer/plcterminalmgr" "/home/math/Projets/code/evse/src/webserver/cgiServer/dictionaries" "/home/math/Projets/code/evse/src/webserver/cgiServer/dictionaries/tools" "/home/math/Projets/code/evse/src/webserver/cgiServer/settings" "/home/math/Projets/code/evse/src/webserver/cgiServer/uploader" "/home/math/Projets/code/evse/src/webserver/cgiServer/uploader/parsing" "/home/math/Projets/code/evse/src/webserver/cgiServer/uploader/parsing/boundary" "/home/math/Projets/code/evse/src/webserver/cgiServer/uploader/parsing/header" "/home/math/Projets/code/evse/src/webserver/cgiServer/uploader/parsing/reading" "/home/math/Projets/code/evse/src/webserver/cgiServer/uploader/parsing/section" "/home/math/Projets/code/evse/src/webserver/cgiServer/uploader/parsing/header/content-disposition" "/home/math/Projets/code/evse/src/webserver/cgiServer/uploader/parsing/header/content-type" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/badges" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/badges/actions" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/badges/importexport" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/cluster" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/config" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/config/models" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/config/actions" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/masterkeys" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/masterkeys/actions" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/masterkeys/importexport" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/modbus/models" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/modbus" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/firmware" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/generic" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/generic/TabsModel" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/index" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/log" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/login" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/menu" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/reset" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/session" "/home/math/Projets/code/evse/src/webserver/cgiServer/workers/settings" "/home/math/Projets/code/evse/src/webserver/cgiServer/utils" "/home/math/Projets/code/evse/src/webserver/cgiServer/modbusmgr" "/home/math/Projets/code/evse/src/webserver/cgiServer/modbusmgr/simu" "/home/math/Projets/code/evse/src/webserver/cgiServer/modbusmgr/simu/plc" "/home/math/Projets/code/evse/src/webserver/cgiServer/modbusmgr/simu/evse" "/home/math/Projets/code/evse/src/webserver/cgiServer/modbusmgr/tcp" "/home/math/Projets/code/evse/src/webserver/cgiServer/modbusmgr/tcp/plc" "/home/math/Projets/code/evse/src/webserver/cgiServer/modbusmgr/tcp/evse" "/home/math/Projets/code/evse/src/webserver/cgiServer/modbusmgr/helpers" "/home/math/Projets/code/evse/src/webserver/cgiServer/cgi" "" "/home/math/Projets/code/evse/src/log" "/home/math/Projets/code/evse/." "/home/math/Projets/code/evse/src" "/home/math/Projets/code/evse/src/io" "/home/math/Projets/code/evse/src/mngt" "/home/math/Projets/code/evse/src/fwupdate" "/home/math/Projets/code/evse/src/hal" "/home/math/Projets/code/evse/src/cpw" "/home/math/Projets/code/evse/src/utils" "/home/math/Projets/code/evse/src/utils/test" "/home/math/Projets/code/evse/src/sqldb" "/home/math/Projets/code/evse/src/database" "/home/math/Projets/code/evse/src/modbus_proxy" "/home/math/Projets/code/evse/src/modbusAction" "/home/math/Projets/code/evse/src/gateway" "/home/math/Projets/code/evse/src/delayServer" "/home/math/Projets/code/evse/src/polling" "/home/math/Projets/code/evse/src/xgcs" "/home/math/Projets/code/evse/src/../../../gen/smc/smc_6_0_1/lib/C++" "/home/math/Projets/code/evse/src/aMasterAdmin" "/home/math/Projets/code/evse/src/aMasterBadgeMgr/api" "/home/math/Projets/code/evse/src/aMasterBadgeMgr/txt" "/home/math/Projets/code/evse/src/aMasterBadgeMgr/sqldb" "/home/math/Projets/code/evse/src/aMasterGui" "/home/math/Projets/code/evse/src/aMasterModel" "/home/math/Projets/code/evse/src/aSlaveEnergy" "/home/math/Projets/code/evse/src/aSlaveModel" "/home/math/Projets/code/evse/src/aStationClusterMng" "/home/math/Projets/code/evse/src/aStationClusterMng/test" "/home/math/Projets/code/evse/src/aStationMngtIp" "/home/math/Projets/code/evse/src/aSlavePowerMeter" "/home/math/Projets/code/evse/src/aSlavePowerMeter/test" "/home/math/Projets/code/evse/src/aSqlDbEngine" "/home/math/Projets/code/evse/src/aSqlDbEngine/test" "/home/math/Projets/code/evse/src/aUserManager" "/home/math/Projets/code/evse/src/aUserManager/TestU" "/home/math/Projets/code/evse/src/aLogManager" "/home/math/Projets/code/evse/src/aBmwModel" "/home/math/Projets/code/evse/src/aBmwModel/test" "/home/math/Projets/code/evse/src/aEnergyMng" "/home/math/Projets/code/evse/src/aEnergyMng/test" "/home/math/Projets/code/evse/src/aErrorManager" "/home/math/Projets/code/evse/src/aConnectivity" "/home/math/Projets/code/evse/src/aConnectivity/test" "/home/math/Projets/code/evse/src/ocpp" "/home/math/Projets/code/evse/src/ocpp/soapFiles" "/home/math/Projets/code/evse/../components/cppunit-1.12.1/include" "" "/home/math/Projets/code/evse/../components/_i686/include" "/home/math/Projets/code/evse/../components/_i686/include/modbus" "/home/math/Projets/code/evse/../components/_i686/include/iniparser" "/home/math/Projets/code/evse/../components/_i686/include/curl" "/home/math/Projets/code/evse/../components/_i686/include/libopkg") )

(setq achead:include-directories (append include-dir-evse achead:include-directories) )

(defvar c-files-regex ".*\\.\\(c\\|cpp\\|h\\|hpp\\)"
  "A regular expression to match any c/c++ related files under a directory")

(defun my-semantic-parse-dir (root regex)
  "
   This function is an attempt of mine to force semantic to
   parse all source files under a root directory. Arguments:
   -- root: The full path to the root directory
   -- regex: A regular expression against which to match all files in the directory
  "
  (let (
        ;;make sure that root has a trailing slash and is a dir
        (root (file-name-as-directory root))
        (files (directory-files root t ))
       )
    ;; remove current dir and parent dir from list
    (setq files (delete (format "%s." root) files))
    (setq files (delete (format "%s.." root) files))
    (while files
      (setq file (pop files))
      (if (not(file-accessible-directory-p file))
          ;;if it's a file that matches the regex we seek
          (progn (when (string-match-p regex file)
               (save-excursion
                 (message "parse file %s" file)
                 (semanticdb-file-table-object file))
           ))
          ;;else if it's a directory
          (message "parse dir %s" file)
          (my-semantic-parse-dir file regex)
      )
     )
  )
)

(defun parse-evse ()
  (interactive)
  (my-semantic-parse-dir "/home/math/Projets/code/evse/src" "\\(h\\|cpp\\)")
)

