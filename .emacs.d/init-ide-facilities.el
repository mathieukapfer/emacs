; force c++ mode for *.h files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; FACILITES - STEP1: auto complete and snippet
;; dependencies: install package 'auto-install' and 'yasnippet
;; ===================================================
; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

;; FACILITES - STEP2: header name completion
;; dependencies: provide 'achead:include-directories' with system and project header directories
;; ================================================================================
; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
;; (defun my:ac-c-header-init ()
;;   (require 'auto-complete-c-headers)
;;   (add-to-list 'ac-sources 'ac-source-c-headers)
;;   (add-to-list 'achead:include-directories '"/usr/include")
;; )
;; ; now let's call this function from c/c++ hooks
;; (add-hook 'c++-mode-hook 'my:ac-c-header-init)
;; (add-hook 'c-mode-hook 'my:ac-c-header-init)

;; FACILITES - STEP2: - local refacto
;; dependenceis:  install package 'iedit
;; ======================================================

; Fix iedit bug in Mac
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;; advanced refacto
(require 'srefactor)

;; FACILITES - STEP3: based on semantic
;; ================================================================================

;; turn on Semantic
(semantic-mode 1)

;; key shortcut
(global-set-key (kbd "C-<f9>") 'semantic-symref-symbol)
(global-set-key (kbd "M-<f9>") 'semantic-symref)

;;(global-set-key (kbd "C-<f2>") 'semantic-ia-fast-jump)
;;(global-set-key (kbd "C-<f3>") 'pop-global-mark)
(global-set-key (kbd "C-<f2>") 'semantic-goto-definition)
(global-set-key (kbd "C-<f3>") 'semantic-pop-tag-mark)

;; let's define a function which adds semantic as a suggestion backend to auto complete
;; and hook this function to c-mode-common-hook
(defun my:add-semantic-to-autocomplete() 
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
(add-hook 'c++-mode-common-hook 'my:add-semantic-to-autocomplete)


;; turn on ede mode 
(global-ede-mode 1)


;; load project definition if exist
(setq my-projects "/home/user/.emacs.d/my-projects.el")
(if (file-exists-p my-projects)
    (load-file my-projects)
  )

;; ; create a project for our program.
;; (ede-cpp-root-project "my project" :file "~/Code/titi-tree/main.cpp"
;; 		      :include-path '("/src"))

;; ; create a project for our program.
;; ;(ede-cpp-root-project "my other project" :file "~/Code/toto-tree/Demo/demo.cpp"
;; ;		      :include-path '("/../HelloExt" "/../Hello" "/../Demo"))

;; (ede-cpp-root-project "my other project" :file "~/Code/toto-tree/ver.h"
;; 		      :include-path '("/HelloExt" "/Hello" "/Demo"))


; you can use system-include-path for setting up the system header file locations.
; turn on automatic reparsing of open buffers in semantic
(global-semantic-idle-scheduler-mode 1)


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
;;(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode,
;;   imenu support, and the semantic navigator
;;(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode,
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberant ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languages only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)


;; FACILITES - STEP5: flycheck
;; ================================================================================

;; dependencies:
;;   - install 'flymake-google...' package
;;   - install 'flymake-cursor' package
;; 
; start flymake-google-cpplint-load
; let's define a function for flymake initialization

(defun my:cpplint-command()
  (setq cpplint-cmd "/home/user/Projects/ev_link_charger_hermes/testengine/script/cpplint-warning.sh")
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


;; cmake support
;; ===================
;; source https://github.com/redguardtoo/cpputils-cmake

;;(add-to-list 'load-path "~/.emacs.d/lisp/")
;;(require 'cpputils-cmake)

;;(add-hook 'c-mode-common-hook
;;          (lambda ()
;;            (if (derived-mode-p 'c-mode 'c++-mode)
;;                (cppcm-reload-all)
;;              )))

;; OPTIONAL, somebody reported that they can use this package with Fortran
;;(add-hook 'c90-mode-hook (lambda () (cppcm-reload-all)))
;; OPTIONAL, avoid typing full path when starting gdb
;;(global-set-key (kbd "C-c C-g")
;; '(lambda ()(interactive) (gud-gdb (concat "gdb --fullname " (cppcm-get-exe-path-current-buffer)))))
;; OPTIONAL, some users need specify extra flags forwarded to compiler
;; (setq cppcm-extra-preprocss-flags-from-user '("-I/usr/src/linux/include" "-DNDEBUG"))



;; QT integration
;; ===================
(setq qt-base-directory "/home/user/Projects/websocket_poc/webserver/externals/qt/x86")
;;setq qt-base-directory "/usr/local/Qt-5.7.0/")
(setq qt-include-directory (expand-file-name "include/" qt-base-directory))
(add-to-list 'auto-mode-alist (cons qt-include-directory 'c++-mode))
;; ADDING symbol file to preprocess
;; (semantic-c-reset-preprocessor-symbol-map)
;; NOTE use command below for debuging :
;; (semantic-c-describe-environment)

;;add-to-list 'semantic-lex-c-preprocessor-symbol-map
;;             '("Q_CORE_EXPORT" . ""))
;;(add-to-list 'cc-search-directories qt-source-directory)








;;; APPENDIX

;; semantic tag navigation
(defvar semantic-tags-location-ring (make-ring 20))

(defun semantic-goto-definition (point)
  "Goto definition using semantic-ia-fast-jump   
save the pointer marker if tag is found"
  (interactive "d")
  (condition-case err
      (progn                            
        (ring-insert semantic-tags-location-ring (point-marker))  
        (semantic-ia-fast-jump point))
    (error
     ;;if not found remove the tag saved in the ring  
     (set-marker (ring-remove semantic-tags-location-ring 0) nil nil)
     (signal (car err) (cdr err)))))

(defun semantic-pop-tag-mark ()             
  "popup the tag save by semantic-goto-definition"   
  (interactive)                                                    
  (if (ring-empty-p semantic-tags-location-ring)                   
      (message "%s" "No more tags available")                      
    (let* ((marker (ring-remove semantic-tags-location-ring 0))    
              (buff (marker-buffer marker))                        
                 (pos (marker-position marker)))                   
      (if (not buff)                                               
            (message "Buffer has been deleted")                    
        (switch-to-buffer buff)                                    
        (goto-char pos))                                           
      (set-marker marker nil nil))))
