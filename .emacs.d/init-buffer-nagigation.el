;; Buffer navigation
;; =========================================
(defvar buffer-navigation-skip-regexp "\\(^*Completions\\|^TAGS\\)"
  "Buffer name that match this regexp will be skipped on navigation" )

(defun next-user-buffer ()
  "Switch to the previous user buffer in cyclic order.\n
User buffers are those not starting with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (string-match buffer-navigation-skip-regexp (buffer-name)) (< i 100))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-user-buffer ()
  "Switch to the next user buffer in cyclic order.\n
User buffers are those not starting with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (string-match buffer-navigation-skip-regexp (buffer-name)) (< i 100))
      (setq i (1+ i)) (previous-buffer) )))



(if (not (fboundp 'next-buffer))
    (defun next-buffer ()
  "Switch to the next buffer in cyclic order."
  (interactive)
  (switch-to-other-buffer 0)))

(if (not (fboundp 'previous-buffer))
     (defun previous-buffer ()
  "Switch to the previous buffer in cyclic order."
  (interactive)
  (while (string-match "\\` "
                       (buffer-name (switch-to-other-buffer
                                     (- (length (buffer-list)) 2)))))))

