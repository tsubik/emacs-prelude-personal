(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; Flycheck
;; disable flyspell spellchecking
(setq prelude-flyspell nil)

;; flycheck eslint
;; (add-hook 'js2-mode-hook 'qoobaa/js2-mode-setup)
;; (add-hook 'js2-mode-hook 'tsubik/find-local-standard-executable)

;; (flycheck-add-mode 'javascript-standard 'rjsx-mode)
;; (flycheck-add-mode 'javascript-standard 'web-mode)
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; (setq flycheck-check-syntax-automatically '(save mode-enable))
;; ;; the default value was '(save idle-change new-line mode-enabled)

(provide 'setup-flycheck)
