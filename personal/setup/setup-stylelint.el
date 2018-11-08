;; use local stylelint from node_modules before global
;; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
(defun my/use-stylelint-from-node-modules ()
  (let* ((root (locate-dominating-file
                 (or (buffer-file-name) default-directory)
                 "node_modules"))
          (stylelint (and root
                       (expand-file-name "node_modules/.bin/stylelint"
                         root))))
    (when (and stylelint (file-executable-p stylelint))
      (setq-local flycheck-scss-stylelint-executable stylelint))))
(add-hook 'flycheck-mode-hook #'my/use-stylelint-from-node-modules)

(provide 'setup-stylelint)
