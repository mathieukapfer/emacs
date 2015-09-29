(provide 'my-cpp-facilites)

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
