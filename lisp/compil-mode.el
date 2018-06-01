
;;; parse the merged smc file and jump to source file
(add-to-list 'compilation-error-regexp-alist
             'evse-log)

(defun build-file-name ()
  (match-string 2)
  )

(add-to-list
 'compilation-error-regexp-alist-alist
 '(evse-log
   ;; (REGEXP FILE [LINE COLUMN TYPE ... - TYPE = (WARNING . INFO)
   ;; 14195?CTestEvseCaseHermesRe:673 0011 [NOTIC][CTHermesReservation]TEST OK 11
   ;;<  p num   ><>< filename       >:<line            >
   "^[[:digit:]]+.\\([[:alnum:]_]+\\):\\([[:digit:]]+\\).* \\[\\(\\(WARN\\)\\|\\(INFO\\|NOTIC\\|DEBUG\\)\\|\\(ERROR\\|FATAL\\|TEST KO\\)\\)"
   1 2 nil (4 . 5) ))

(add-to-list 'compilation-error-regexp-alist
             'wbtest-log)

(add-to-list
 'compilation-error-regexp-alist-alist
 '(wbtest-log
   ;; (REGEXP FILE [LINE COLUMN TYPE ... - TYPE = (WARNING . INFO)
   ;;< filename   >      :<line >
   ;;TestModbus.cpp      :033:[IDLE] End of init
   ;;stubGUART/GUARTDrv.c:053:[IDLE] TEST_GUART_TOCallback called:
   ;;../ModbusAppliMasr.c:087:[INFO]  Rsp:OK
   "^\\(^[[:alnum:]/\.]+\.[hcpp]+\\) *:\\([[:digit:]]+\\).*\\[\\(\\(WARN\\)\\|\\(INFO\\|NOTI\\|DBUG\\)\\|\\(ERR\\|FATL\\|TEST KO\\)\\)"
   1 2 nil (4 . 5) ))

   ;;   1 (progn (concat (match-string 1) ".cpp")) ))


;;   "^\\(?[[:digit:]]+\\).\\([[:alnum:]_]+\\):\\([[:digit:]]+\\).*\\(NOTIC\\|WARN\\)"
;;   1 2 nil (4 . 3)))

;; ========================================================
;; OK
   ;; (REGEXP FILE [LINE COLUMN TYPE ...
   ;; 14195?CTestEvseCaseHermesRe:673 0011 [NOTIC][CTHermesReservation]TEST OK 11
   ;;<  p num   ><>< filename       >:<line            >
;   "^[[:digit:]]+.\\([[:alnum:]_]+\\):\\([[:digit:]]+\\)"
;   1 2 ))
