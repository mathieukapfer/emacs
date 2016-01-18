(require 'my-grep "~/.emacs.d/my-grep.el")
(require 'my-cpp-facilites "~/.emacs.d/my-cpp-facilites.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(auto-save-default nil)
 '(c-basic-offset 2)
 '(dired-no-confirm (quote (print revert-subdirs)))
 '(dired-omit-extensions
   (quote
    ("_sm.*" ".in" ".a" ".class" ".lbin" ".bin" ".elc" ".obj" ".o" "CVS/" "CM/" ".svn/" "~" ".orig" ".rej" ".vrs" ".vr" ".tps" ".tp" ".pgs" ".pg" ".kys" ".ky" ".fns" ".fn" ".cps" ".cp" ".bbl" ".blg" ".glo" ".lot" ".lof" ".idx" ".dvi" ".aux" ".log" ".toc")))
 '(dired-omit-files "^\\.[^.]")
 '(dired-omit-regexps (quote ("\\`#" "\\`\\.[^.]" "\\`.*_sm\\.")))
 '(dired-use-ls-dired nil)
 '(ede-project-directories
   (quote
    ("/home/user/Qt5.5.1/5.5/Src/qtbase/src" "/home/user/Projects/ev_link_charger_hermes/code/evse/src" "/home/math/Code/automake")))
 '(ediff-coding-system-for-write (quote raw-text))
 '(fill-column 80)
 '(flymake-google-cpplint-command (my:cpplint-command))
 '(font-lock-mode t t (font-lock))
 '(graphviz-dot-view-command "xdot %s")
 '(grep-find-ignored-directories my-grep-find-ignored-directories)
 '(grep-find-ignored-files my-grep-find-ignored-files)
 '(indent-tabs-mode nil)
 '(omnisharp-auto-complete-popup-help-delay 1)
 '(omnisharp-imenu-support t)
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(smtpmail-smtp-server "smtp.laposte.net")
 '(smtpmail-smtp-service 25)
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
 '(default ((t (:inherit nil :stipple nil :background "#606060" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

(set-face-attribute 'default nil :height 110)

(defun my-lookup-elisp ()
  (interactive)
  (elisp-index-search (my-default-entry)))

(global-set-key (kbd "ESC <C-f1>") 'my-lookup-elisp)


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
;;(global-set-key (kbd "C-<prior>") 'previous-user-buffer) ; Ctrl+PageDown
;;(global-set-key (kbd "C-<next>")  'next-user-buffer) ; Ctrl+PageUp
(global-set-key (kbd "M-<left>") 'previous-user-buffer) ; ALT+ flèche gauche 
(global-set-key (kbd "M-<right>")  'next-user-buffer) ; ALT + flèche droite



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


;; TAGS setting
;; ========================================
;; set tag search as case sensitive
;; MOVE IN CUSTOM PART
;; (setq tags-case-fold-search 'nil)

(global-set-key (kbd "M-<f2>")  'find-tag)

(defun find-tags-next ()
  (interactive)
  (find-tag "dummy" t);
  )

(global-set-key (kbd "M-<f3>") 'find-tags-next)
(global-set-key (kbd "M-<f4>") 'pop-tag-mark)


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
