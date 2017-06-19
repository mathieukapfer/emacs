;; FACILITES - STEP5: flycheck
;; ================================================================================

;; dependencies:
;;   - install 'flymake-google...' package
;;   - install 'flymake-cursor' package
;;
; start flymake-google-cpplint-load
; let's define a function for flymake initialization

(defun my:cpplint-command()
  (setq cpplint-cmd "/home/user/Projects/ev_link_charger/testengine/script/cpplint-warning.sh")
  (if (not (file-exists-p cpplint-cmd) )
      (setq cpplint-cmd "/usr/local/bin/cpplint" )
    (setq cpplint-cmd cpplint-cmd)
    )
  )

(defun my:flymake-google-init ()
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command (my:cpplint-command)))
  (flymake-google-cpplint-load)
  )

(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

;; same with cppcheck
(require 'flymake-cppcheck)
(add-hook 'c-mode-hook 'flymake-cppcheck-load)
(add-hook 'c++-mode-hook 'flymake-cppcheck-load)

(custom-set-variables
 '(flymake-cppcheck-enable "warning"))
;; '(flymake-cppcheck-enable "warning,performance,information,style"))

(custom-set-variables
 '(flymake-cppcheck-command "/usr/bin/cppcheck"))

(custom-set-variables
 '(flymake-cppcheck-location 'tempdir))
