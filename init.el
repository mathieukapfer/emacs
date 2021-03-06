(require 'my-grep "~/.emacs.d/lisp/my-grep.el")
(require 'my-cpp-facilites "~/.emacs.d/lisp/my-cpp-facilites.el")
(require 'sr-speedbar "~/.emacs.d/lisp/sr-speedbar.el")

;; '(compilation-error-regexp-alist
;;   (quote
;;    (evse-log merged-smc absoft ada aix ant bash borland python-tracebacks-and-caml comma cucumber msft edg-1 edg-2 epc ftnchek iar ibm irix java jikes-file jikes-line gcc-include ruby-Test::Unit gnu lcc makepp mips-1 mips-2 msft omake oracle perl php rxp sparc-pascal-file sparc-pascal-line sparc-pascal-example sun sun-ada watcom 4bsd gcov-file gcov-header gcov-nomark gcov-called-line gcov-never-called perl--Pod::Checker perl--Test perl--Test2 perl--Test::Harness weblint))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(auto-save-default nil)
 '(c-basic-offset 2)
 '(compilation-auto-jump-to-first-error nil)
 '(compilation-error-regexp-alist
   (quote
    (evse-log merged-smc bash java gcc-include gnu lcc gcov-file )))
 '(compilation-scroll-output (quote first-error))
 '(dired-no-confirm (quote (print revert-subdirs)))
 '(dired-omit-extensions
   (quote
    ("_sm.*" ".in" ".a" ".class" ".lbin" ".bin" ".elc" ".obj" ".o" "CVS/" "CM/" ".svn/" "~" ".orig" ".rej" ".vrs" ".vr" ".tps" ".tp" ".pgs" ".pg" ".kys" ".ky" ".fns" ".fn" ".cps" ".cp" ".bbl" ".blg" ".glo" ".lot" ".lof" ".idx" ".dvi" ".aux" ".toc")))
 '(dired-omit-files "^\\.[^.]")
 '(dired-omit-regexps (quote ("\\`#" "\\`\\.[^.]" "\\`.*_sm\\.")))
 '(dired-use-ls-dired nil)
 '(ede-project-directories
   (quote
    ("/home/user/Projects/wallbox/SW/Applicatif/NEWWBSTEP2_0.E.1_RC1/Sources" "/home/user/Code/LKM-M12" "/home/user/Projects/ev_link_charger/code/evse/src")))
 '(ediff-coding-system-for-write (quote raw-text))
 '(fill-column 80)
 '(flycheck-c/c++-googlelint-executable (my:cpplint-command))
 '(flycheck-check-syntax-automatically (quote (save idle-change new-line mode-enabled)))
 '(flycheck-disabled-checkers (quote (c/c++-gcc)))
 '(flymake-google-cpplint-command (my:cpplint-command))
 '(font-lock-mode t t (font-lock))
 '(graphviz-dot-view-command "xdot %s")
 '(grep-find-ignored-directories (quote ("CVS" ".svn" ".git" ".moc")))
 '(grep-find-ignored-files my-grep-find-ignored-files)
 '(indent-tabs-mode nil)
 '(magit-diff-arguments
   (quote
    ("--ignore-space-change" "--ignore-all-space" "--no-ext-diff")))
 '(magit-diff-section-arguments
   (quote
    ("--ignore-space-change" "--ignore-all-space" "--no-ext-diff")))
 '(omnisharp-auto-complete-popup-help-delay 1)
 '(omnisharp-imenu-support t)
 '(package-selected-packages
   (quote
    (jedi pydoc-info pydoc magit flycheck elpy auto-complete)))
 '(projectile-globally-ignored-file-suffixes (quote (".o" ".cmd")))
 '(projectile-indexing-method (quote alien))
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(smtpmail-smtp-server "smtp.laposte.net")
 '(smtpmail-smtp-service 25)
 '(speedbar-default-position (quote left))
 '(split-width-threshold nil)
 '(sr-speedbar-right-side nil)
 '(tab-width 2)
 '(tags-auto-read-changed-tag-files t)
 '(tags-build-completion-table t)
 '(tags-case-fold-search nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#999999" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(font-lock-comment-face ((t (:foreground "gold"))))
 '(magit-section-highlight ((t (:background "dim gray")))))

(set-face-attribute 'default nil :height 110)

;; all stuff is in 'lisp' dir
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; ease help request
(defun my-lookup-elisp ()
  (interactive)
  (elisp-index-search (my-default-entry)))

(global-set-key (kbd "ESC <C-f1>") 'my-lookup-elisp)

;; delete space defore saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Colorize compilation buffer
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (let ((inhibit-read-only t))
    ;;(ansi-color-apply-on-region (point-min) (point-max))))
    (ansi-color-apply-on-region compilation-filter-start (point))))

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; Compilation error
;;; parse the merged smc file and jump to source file
(add-to-list 'compilation-error-regexp-alist
             'merged-smc)

(add-to-list
 'compilation-error-regexp-alist-alist
 '(merged-smc
   ;; (REGEXP FILE [LINE COLUMN TYPE ...
   ;; /*test_prodA.sm:22:*/  goBack pop ...
    "/\\*\\([A-Za-z_]+\\.[A-Za-z]+\\):\\([[:digit:]]+\\):" 1 2))

;;; parse the merged smc file and jump to source file
(add-to-list 'compilation-error-regexp-alist
             'evse-log)

(add-to-list
 'compilation-error-regexp-alist-alist
 '(evse-log
   ;; (REGEXP FILE [LINE COLUMN TYPE ... - TYPE = (WARNING . INFO)
   ;; 14195?CTestEvseCaseHermesRe:673 0011 [NOTIC][CTHermesReservation]TEST OK 11
   ;;<  p num   ><>< filename       >:<line            >         < warn>   | < info   > |  < error                   >
   "^ ?[[:digit:]]+.\\([[:alnum:]_]+\\):\\([[:digit:]]+\\).*\\[\\(\\(WARN\\)\\|\\(NOTIC\\|INFO\\|DEBUG\\)\\|\\(ERROR\\|FATAL\\|TEST KO\\)\\)"
   ;;"^ ?[[:digit:]]+.\\([[:alnum:]_]+\\):\\([[:digit:]]+\\)[^[]+\\(\\(WARN\\)\\|\\(NOTIC\\)\\|\\(ERROR\\|FATAL\\|TEST KO\\)\\)"
   1 2 nil (4 . 5) ))


;; space in C/C++ code
;;(custom-set-variables
;; '(indent-tabs-mode nil)  ;; do not use TAB character, use SPACE instead
;; '(tab-width 2)           ;; use 2 spaces as a tab
;; '(c-basic-offset 2)      ;; use 2 spaces as auto indent C language
;; '(fill-column 80))

;; C++ style : do not indent namespace
(defconst my-cc-style
  '("cc-mode"
    (c-offsets-alist . ((innamespace . [0])))))

(c-add-style "my-cc-mode" my-cc-style)

(defun my:set-my-c++-style ()
  ;;(interactive)
  ;;(message "FORCE MY STYLE")
  (c-set-style "my-cc-mode" )
  )

(add-hook 'c++-mode-hook 'my:set-my-c++-style)


;; rectangle
;;; (global-set-key (kbd "M-*") 'kill-rectangle)
;;; (global-set-key (kbd "M-µ") 'yank-rectangle)


;; Simplify emacs
;; ==============================
;; disable recursive mini-buffer
(setq minibuffer-max-depth nil)

;; edit init.el
(defun switch-to-buffer-emacs ()
  (interactive)
  (find-file "~/.emacs.d/init.el")
  ;;(switch-to-buffer "init.el" )
  )
(global-set-key (kbd "M-C-œ") 'switch-to-buffer-emacs)

;; simple dired content
(require 'dired-x)
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))
;; and simplier shortcut
(global-set-key (kbd "M-o") 'dired-omit-mode)


;; shortcut for developement
;; ==========================
;; basic F key bingind
(global-set-key [f1] 'dired-sources-file)
;;(global-set-key [(control f1)] 'Info-elisp-ref)
(global-set-key [f12] 'compile)
(global-set-key [(control f12)] 'recompile)
(global-set-key [f11] 'shell)
(global-set-key (kbd "<f9>") 'my-grep)

(defun dired-sources-file ()
  (interactive)
  (dired default-directory)
  ;;(replace-in-string (buffer-file-name) "/[^/]+$" "/."))
)

;; split window helper in french keyboard
(global-set-key (kbd "M-&") 'delete-other-windows )
(global-set-key (kbd "M-é") 'split-window-vertically)
(global-set-key (kbd "M-\"") 'split-window-horizontally)

;; windows navigation
(global-set-key (kbd "C-<tab>") 'other-window)

;; Buffer navigation
(load-file "~/.emacs.d/init-buffer-nagigation.el")

;; related shortcut
;(global-set-key (kbd "C-<prior>") 'previous-user-buffer) ; Ctrl+PageDown
;;(global-set-key (kbd "C-<next>")  'next-user-buffer) ; Ctrl+PageUp
(global-set-key (kbd "M-<left>") 'previous-user-buffer) ; ALT+ flèche gauche
(global-set-key (kbd "M-<right>")  'next-user-buffer) ; ALT + flèche droite

;; Log parser navigation
(load-file "~/.emacs.d/lisp/my-parse-log.el")
(global-set-key (kbd "C-<return>") 'parse-evse-log)


;; grep facilities
;; ==================
;; find .  \( -name "*.cpp" -o -name "*.h" -o -name "*.sm" \) -print
;; find .  -iname "test*" -prune -o \( \( -name "*.cpp" -o -name "*.h" -o -name "*.sm" \) -print \)
;; find .  \( -iname "test*" -o -name webserver -o -name soapFiles \) -prune -o \( -name "*.cpp" -o -name "*.h" -o -name "*.sm" \) -print  | wc
;; find . -name "*.h" -type f -print0 -o -iname "test*" -prune | "xargs" -0 -e grep -nH -e EvseModel
;; find . \( -iname "test*" -o -name "*_sm.*" \) -prune -o \( -name "*.h" -o -name "*.cpp" -o -name "*.sm" \) -type f -print0  | "xargs" -0 -e grep -nH -e UpdateAndSendIMaxEV

;; ebrowse generation
;;=====================
;; rm BROWSE
;; find . \( -iname "test*" -o -name "*_sm.*" \) -prune -o \( -name "*.h" -o -name "*.cpp" -o -name "*.sm" \) -type f -print > files
;; ebrowse `cat files`


;; Git with maggit
(global-set-key (kbd "C-<escape>") 'magit-status)


;; TAGS setting
;; ========================================
;; set tag search as case sensitive
;; MOVE IN CUSTOM PART
;; (setq tags-case-fold-search 'nil)

(global-set-key (kbd "s-<f2>")  'find-tag)

(defun find-tags-next ()
  (interactive)
  (find-tag "dummy" t);
  )

(global-set-key (kbd "s-<f3>") 'pop-tag-mark)
(global-set-key (kbd "s-<f4>") 'find-tags-next)


;; ebrowse
;; ========================================
;; Create BROWSE file with:
;; > rm BROWSE
;; > find . \( -iname soapFiles -o -iname "test*" -o -name "*_sm.*" \) -prune -o \( -name "*.h" -o -name "*.cpp" -o -name "*.sm" \) -type f -print > file_list
;; > ebrowse   `cat file_list `


(defun switch-to-buffer-tree ()
  (interactive)
  (switch-to-buffer "*Tree*" )
  )

(defun ebrowse-tags-find-definition-hook()
  (interactive)
  (ebrowse-tags-find-definition)
  (setq ebrowse-position-index 0)
  )

;; ebrowse shortcut
(global-set-key (kbd "C-<f1>") 'switch-to-buffer-tree )
(global-set-key (kbd "<f2>") 'ebrowse-tags-find-definition-hook )
(global-set-key (kbd "<f3>") 'ebrowse-back-in-position-stack)
(global-set-key (kbd "<f4>") 'ebrowse-forward-in-position-stack)
(global-set-key (kbd "<f5>") 'ebrowse-tags-loop-continue)

(global-set-key (kbd "C-*") 'ebrowse-tags-search-member-use)

(global-set-key (kbd "C-%") 'ebrowse-tags-query-replace)
(global-set-key (kbd "C-ù") 'ebrowse-tags-search)
(global-set-key (kbd "C-:") 'ebrowse-tags-complete-symbol)
(global-set-key (kbd "C-/") 'ebrowse-tags-complete-symbol)

(setq ebrowse-position-stack nil)

;; add icicles
;;(add-to-list 'load-path "/home/math/emacs")
;;(require 'icicles)
;; enable icycles mode
;;(icy-mode 1)


;; to investigate :
;; (normal-top-level-add-subdirs-to-load-path)

;; download package from emacswiki.org (?)
(when (> emacs-major-version 23)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/")
               'APPEND))

(put 'erase-buffer 'disabled nil)


;; git support
;(add-to-list 'load-path ".../git/contrib/emacs")
;;(add-to-list 'load-path "/usr/share/emacs23/site-lisp/git")
;;(require 'git)
;;(require 'git-blame)



;; IDE facilites
;; =========================================
(when (> emacs-major-version 23)
  (load-file "~/.emacs.d/init-ide-facilities.el")
)
(put 'downcase-region 'disabled nil)



;; for python / elpy setting
;; =============================
(setq elpy-rpc-backend "jedi")
