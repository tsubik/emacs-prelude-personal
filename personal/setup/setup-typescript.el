;; typescript
(add-hook 'typescript-mode-hook
  (lambda ()
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    ;; company is an optional dependency. You have to
    ;; install it separately via package-install
    (company-mode-on)))

;; Setup tsx mode
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
  (lambda ()
    (when (string-equal "tsx" (file-name-extension buffer-file-name))
      (setup-tide-mode))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

(provide 'setup-typescript)
