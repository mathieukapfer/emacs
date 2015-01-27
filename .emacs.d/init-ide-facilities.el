;; cedet
;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
;; IMPORTANT: For Emacs >= 23.2, you must place this *before* any
;; CEDET component (including EIEIO) gets activated by another 
;; package (Gnus, auth-source, ...).

;(load-file "~/emacs/cedet-1.1/common/cedet.el")

;; Enable EDE (Project Management) features
;(global-ede-mode 1)

;(ede-cpp-root-project "TEST" :file "/home/math/Code/automake/Makefile.am")
;(load-file "~/.emacs.d/init-my-ede-project.el")

;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
;(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode,
;;   imenu support, and the semantic navigator
;(semantic-load-enable-code-helpers)

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

;; ====================================================

;; turn on semantic
;;(semantic-mode 1)

;; Enable EDE (Project Management) features
;;(global-ede-mode 1)

;; create EDE project 
;;(ede-cpp-root-project "toto" 
;;                      :file "/home/math/Code/toto-tree/Demo/demo.cpp"
;;                      :include-path '( "/../src/Hello" "/../src/HelloExt" ) )


;; ======================================================

; force c++ mode for *.h files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; ======================================================
;; Code edition facilites - step 0 - completion / language key word   
;; ======================================================

; start auto-complete with emacs
(require 'auto-complete)

; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; ======================================================
;; Code edition facilites - step 1 - langage idiomatisme 
;; ======================================================

; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

;; ======================================================
;; Code edition facilites - step 2 - completion / system & project head file 
;; ======================================================

;; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include")
  )



;; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;; ======================================================
;; Code edition facilites - step 3 - local refacto 
;; ======================================================

; Fix iedit bug in Mac
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;; ======================================================
;; Code edition facilites - step 4 - project code navigation & completion
;; ======================================================

; turn on Semantic
(semantic-mode 1)

; let's define a function which adds semantic as a suggestion backend to auto complete
; and hook this function to c-mode-common-hook
(defun my:add-semantic-to-autocomplete() 
  (add-to-list 'ac-sources 'ac-source-semantic)
)

(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

; turn on ede mode 
(global-ede-mode 1)

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
(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode,
;;   imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)

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
