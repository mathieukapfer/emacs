(defconst log-to-csv-separator ";" )

(setq log-to-csv-timestamp "^.* \\([[:digit:]]+\.[[:digit:]]+\\) \\[.*")

(setq log-to-csv-regexp-list
      (list
       ;; \\(balise-in-log\\) ... \\(value\\)
   "\\(UpdateEVStatePresenceM12\\) KO: last value is:\\(true\\|false\\)"
   "\\(GetCPW1Voltage\\): \\([[:digit:]]+\\) milivolts"
   "Increment\\(CommunicationErrorCounter\\) exits (counter: \\([[:digit:]]+\\)"
   )
  )

(defun log-to-csv-make-indent (nb-col)
  (setq indent-string "")
  (dotimes (i nb-col indent-string)
    (setq indent-string (concat indent-string " " log-to-csv-separator))
    )
  )

;;; the global
(setq log-to-csv-column-alist)
;;; adding a entry in the alist column name
(defun log-to-csv-create-column (column name)
  (add-to-list 'log-to-csv-column-alist (cons column name))
  )

;;; main entry point
(defun log-to-csv()
  (interactive)
  ;; init buffer
  (generate-new-buffer "foo")
  (setq log-to-csv-column-alist)
  ;; parse each log line
  (while (< (point) (point-max))
    (let ((level 0))
      (dolist (expr log-to-csv-regexp-list)
        (setq level (+ level 1))
        (if (looking-at (concat log-to-csv-timestamp expr))
            (progn
              (princ
               (concat (match-string 1) log-to-csv-separator ;; timestamps
                       (log-to-csv-make-indent level) ;; adding void column
                       (match-string 3) ;; value
                       "\n")
               (get-buffer "foo")
               )
              (log-to-csv-create-column level (match-string 2) )
              (return)
            )
          )
        )
      )
    (forward-line 1)
    )
  ;; adding column header
  ;; (while ...
  )
