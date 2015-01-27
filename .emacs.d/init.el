(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(auto-save-default nil)
 '(c-basic-offset 2)
 '(dired-no-confirm (quote (print revert-subdirs)))
 '(dired-omit-extensions (quote ("_sm.*" ".in" ".a" ".class" ".lbin" ".bin" ".elc" ".obj" ".o" "CVS/" "CM/" ".svn/" "~" ".orig" ".rej" ".vrs" ".vr" ".tps" ".tp" ".pgs" ".pg" ".kys" ".ky" ".fns" ".fn" ".cps" ".cp" ".bbl" ".blg" ".glo" ".lot" ".lof" ".idx" ".dvi" ".aux" ".log" ".toc")))
 '(dired-omit-files "^\\.[^.]")
 '(dired-omit-regexps (quote ("\\`#" "\\`\\.[^.]" "\\`.*_sm\\.")))
 '(dired-use-ls-dired nil)
 '(ede-project-directories (quote ("/home/math/Code/automake")))
 '(ediff-coding-system-for-write (quote raw-text))
 '(fill-column 80)
 '(font-lock-mode t t (font-lock))
 '(graphviz-dot-view-command "xdot %s")
 '(indent-tabs-mode nil)
 '(tab-width 2)
 '(tags-auto-read-changed-tag-files t)
 '(tags-build-completion-table t)
 '(tags-case-fold-search nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))


;; space in C/C++ code
;;(custom-set-variables
;; '(indent-tabs-mode nil)  ;; do not use TAB character, use SPACE instead
;; '(tab-width 2)           ;; use 2 spaces as a tab
;; '(c-basic-offset 2)      ;; use 2 spaces as auto indent C language
;; '(fill-column 80))

;; rectangle 
;;; (global-set-key (kbd "M-*") 'kill-rectangle)
;;; (global-set-key (kbd "M-µ") 'yank-rectangle)


;; Simplify emacs
;; ==============================
;; disable recursive mini-buffer
(setq minibuffer-max-depth nil)

;; edit .emacs
(defun switch-to-buffer-emacs ()
  (interactive)
  (switch-to-buffer ".emacs" )
  )

;;(global-set-key (kbd "M-²") 'switch-to-buffer-emacs)



;; shortcut for developement
;; ==========================
(global-set-key [f1] 'dired-sources-file)
;;(global-set-key [(control f1)] 'Info-elisp-ref)
(global-set-key [f12] 'compile)
(global-set-key [(control f12)] 'recompile)
(global-set-key [f11] 'shell)

;; Clear Dired (with omit file) 
;; ==============================
;;;; load the lib manually
;;;; M x load-file /usr/share/emacs/23.4/lisp/dired-x.elc

(defun dired-sources-file ()
  (interactive)
  ;;(dired "*.*[hcpm]")  
  ;; (dired "*[^o~]")
  (dired default-directory)
  ;;(replace-in-string (buffer-file-name) "/[^/]+$" "/."))
)



;; Load Dired X when Dired is loaded.
(require 'dired-x)
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))


;; change shortcut
;;; TODO : dammed , do not overwrite local mode shortcut
(global-set-key (kbd "M-o") 'dired-omit-mode)

;; split window shortcut
;; ==========================
(global-set-key (kbd "M-&") 'delete-other-windows ) 
(global-set-key (kbd "M-é") 'split-window-vertically)
(global-set-key (kbd "M-\"") 'split-window-horizontally)
 
;; windows navigation
;; ==========================
(global-set-key (kbd "C-<tab>") 'other-window)
;; (global-set-key [(control tab)] 'other-window)

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

;; file navigation - C language facilities
;; =========================================
(defun c++-open-complementary-source-file ()
  (interactive)
  (setq file-name (buffer-name))  
  (setq base-file-name (car (split-string file-name "[.]")))
  (setq complementary-file "")

  (if (string-match "\.cpp$" file-name) 
      (setq complementary-file (concat base-file-name ".h"))
    (if (string-match "\.h$" file-name) 
        (setq complementary-file (concat base-file-name ".cpp"))    
      )
    )
  
  (if (not(string= complementary-file ""))
      (find-file complementary-file)
    )
  )

(global-set-key (kbd "C-²" ) 'c++-open-complementary-source-file) 
(global-set-key (kbd "C-œ" ) 'c++-open-complementary-source-file) 
  

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

;; ========================================


;; Buffer navigation
;; =========================================
(load-file "~/.emacs.d/init-buffer-nagigation.el")

;; related shortcut
;;(global-set-key (kbd "C-<prior>") 'previous-user-buffer) ; Ctrl+PageDown
;;(global-set-key (kbd "C-<next>")  'next-user-buffer) ; Ctrl+PageUp
(global-set-key (kbd "M-<left>") 'previous-user-buffer) ; ALT+ flèche gauche 
(global-set-key (kbd "M-<right>")  'next-user-buffer) ; ALT + flèche droite


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
