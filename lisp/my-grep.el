(require 'grep)
(require 'cl)
(provide 'my-grep)

;;; Customization
(defgroup my-grep nil
  "Grep into projects tree easily."
  :group 'tools
  :group 'processes)

(defcustom my-grep-find-files-pattern
  '("*.cpp *.c *.h *[^_].sm *.am *.cmake CMakeLists.txt")
  "A list of file pattern to find"
  :group 'my-grep
  :type '(repeat string)
  )

;;; Setting of customization of 'grep-find' group
(defconst my-grep-find-ignored-files
  (quote   (".#*" "*.o" "*~" "*_sm.cpp" "*_sm.h" )))

(defconst my-grep-find-ignored-directories
  (quote ("CVS" ".svn" ".git" ".moc" "test" )))

(custom-set-variables
  '(grep-find-ignored-files my-grep-find-ignored-files)
  '(grep-find-ignored-directories my-grep-find-ignored-directories)
  )

(defun my-default-entry ()
  (interactive)
  (let ((pos (point))
        (default-entry ""))
    (skip-chars-backward "_a-zA-Z0-9---")
    (if (looking-at "\\([_a-zA-Z0-9---]+\\)" )
        (setq default-entry (match-string 1) )
      (setq default-entry "" )
      )
    ;;(message (format "I see the word '%s'" default-entry))
    )
  )

(defun my-grep-root-directory ()
  (concat
   (file-name-directory
    ;;(buffer-file-name)
    default-directory
    ) "../.." )
  )


(defun my-grep ()
  (interactive)
  (grep-compute-defaults)
  (rgrep (my-default-entry)
         (car my-grep-find-files-pattern)
         ;;(my-grep-root-directory)
         (my-grep-root-locate-files-bottom-up)
          t)
  )


;;; helper to find root dir of project (inspired from projectile.el)
;;; ==================================================================(
(defcustom my-grep-root-name
  '("src"            ; evse
    "Sources"        ; wallbox
    )
  "A list of files or directories considered to mark the root of a project.
The topmost match has precedence."
  :group 'my-grep
  :type '(repeat string)
  )


(defcustom my-grep-root-dir-max-depth '10 "The max depth of root dir location research"
  :group 'my-grep
  :type 'integer
  )

(defun my-grep-root-locate-files (dir list)
  ;; (message "start in %s with %s" dir (car list))
  (cl-find-if
   ;; PREDICAT : function <dir>/<f> exist ?
   (lambda (f)
     ;; (message "inside loop %s" f)
     (file-exists-p (expand-file-name f dir)))
   ;; SEQ : list of possible root name (file or dir!)
   list
   ))

(defun my-grep-root-locate-files-bottom-up()
  (let ((root nil)
        (depth 0)
        (current-dir default-directory)
        )
    ;;  “repeat...until” loop ('while' form without body!)
    (while
        (progn
          (setq depth (+ 1 depth))
          (setq current-dir (my-grep-parent-dir current-dir))
          ;;(message "try with depth:%d - %s" depth current-dir )
          (setq root (my-grep-root-locate-files current-dir my-grep-root-name))
          ;; until
          (and (< depth my-grep-root-dir-max-depth)
               (not root))
          )
      )
    (if root
        (setq root (expand-file-name root current-dir)))
    ;;(message "result: %s" root)
    )
  )

(defun my-grep-test()
  (interactive)
  ;;(message "%s" (my-grep-root-locate-files default-directory my-grep-root-name))
  (message "%s" (my-grep-root-locate-files-bottom-up))
  )

;;; Project root related utilities
(defun my-grep-parent-dir (path)
  "Return the parent directory of PATH.
PATH may be a file or directory and directory paths may end with a slash."
  (directory-file-name (file-name-directory (directory-file-name (expand-file-name path)))))
