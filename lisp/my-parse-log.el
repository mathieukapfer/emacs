;;(require 'projectile)

(defun projectile-find-file_ (initial-input)
  "Jump to a project's file using completion (with initial input)."
  ;;(interactive "P")
  (let ((file (projectile-completing-read "Find file: "
                                          (projectile-current-project-files)
                                          initial-input
                                          )))
    (find-file (expand-file-name file (projectile-project-root)))
    (run-hooks 'projectile-find-file-hook)))


(defconst parse-evse-log-regexp
  ;; 0215|MasterBehavour:918        0005.6903 [INFO ][MASTER][CTXT]        UpdateUserSession called
  ;;       timestamps      file name            line number
  "^ ?[[:digit:]]+\\(?:|\\|?\\)\\([[:alnum:]_]+\\):\\([[:digit:]]+\\)"
  ;;(concat "[[:digit:]]+" "\(|\|+\|?\)" "\\([[:alnum:]]+\\)" ":" "\\([[:digit:]]+\\)")
  )


(defun parse-evse-log ()
  (interactive)
  (beginning-of-line)
  ;;(message "looking at %s" (eval parse-evse-log-regexp))
  (if (looking-at (eval parse-evse-log-regexp))
      (progn
        (setq filename (match-string 1))
        (setq linenumber (match-string 2))
        ;; (setq filenameandline(format "%s*.cpp:%d" filename (string-to-number linenumber)))
        ;; (message "%s" filenameandline)
        ;; (princ (string-to-vector filename))
        (projectile-find-file_  (concat filename ".cpp"))
        (goto-line (string-to-number linenumber))
        ;;(call-interactively 'projectile-find-file nil (string-to-vector filename) )
        ;;(message (directory-files "." (format "%s*" filename)))
        ;;(message "%s" infoline)
        )
    )
  )
