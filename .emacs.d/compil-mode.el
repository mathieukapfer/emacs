
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
   "^[[:digit:]]+.\\([[:alnum:]_]+\\):\\([[:digit:]]+\\).*\\(\\(WARN\\)\\|\\(INFO\\|NOTIC\\|DEBUG\\)\\|\\(ERROR\\|FATAL\\|TEST KO\\)\\)"
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
