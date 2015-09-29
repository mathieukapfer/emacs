(require 'grep)
(provide 'my-grep)

(defconst my-grep-find-files-pattern "*.cpp *.h *.sm")

(defconst my-grep-find-ignored-files
  (quote   (".#*" "*.o" "*~")))

(defconst my-grep-find-ignored-directories
  (quote ("CVS" ".svn" ".git" "test")))

(custom-set-variables
  '(grep-find-ignored-files my-grep-find-ignored-files)
  '(grep-find-ignored-directories my-grep-find-ignored-directories)
  )

(defun my-default-entry ()
  (interactive)
  (let ((pos (point))
        (default-entry ""))    
    (skip-chars-backward "a-zA-Z0-9_")
    (if (looking-at "\\([a-zA-Z0-9_]+\\)" )
        (setq default-entry (match-string 1) )
      (setq default-entry "" )     
      )
    ;;(message (format "I see the word '%s'" default-entry)) 
    )
  )

(defun my-grep-smart-root-directory ()
  (concat
   (file-name-directory
    ;;(buffer-file-name)
    default-directory
    ) "../" )
  )


(defun my-grep ()
  (interactive)
  (grep-compute-defaults)
  (rgrep (my-default-entry)
         my-grep-find-files-pattern
         (my-grep-smart-root-directory)
          t)
  )
 
  
