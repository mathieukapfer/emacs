(require 'grep)
(provide 'my-grep)

(defconst my-grep-find-files-pattern "*.cpp *.c *.h *.sm *.am *.cmake CMakeLists.txt")

(defconst my-grep-find-ignored-files
  (quote   (".#*" "*.o" "*~")))

(defconst my-grep-find-ignored-directories
  (quote ("CVS" ".svn" ".git" "test" ".moc")))

(custom-set-variables
  '(grep-find-ignored-files my-grep-find-ignored-files)
  '(grep-find-ignored-directories my-grep-find-ignored-directories)
  )

(defun my-default-entry ()
  (interactive)
  (let ((pos (point))
        (default-entry ""))    
    (skip-chars-backward "_a-zA-Z0-9---")
    (if (looking-at "\\([_a-zA-Z0-9---:]+\\)" )
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
 
