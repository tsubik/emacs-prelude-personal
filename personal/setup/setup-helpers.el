;; simple open THIS file command
(defun open-config ()
  (interactive)
  (find-file "~/.emacs.d/personal/tweaks.el"))

(defun reload-init-file ()
  (interactive)
  (load-file user-init-file))

(defun insert-random-uuid ()
  (interactive)
  (shell-command "uuidgen" t))

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
    (delq (current-buffer)
      (remove-if-not 'buffer-file-name (buffer-list)))))

(provide 'setup-helpers)
