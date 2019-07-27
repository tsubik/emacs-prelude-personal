;; (projectile-rails-global-mode)
;; Seeing is believing in-line ruby code evaluation and showing results as comments
(setq seeing-is-believing-prefix "C-?")
(add-hook 'ruby-mode-hook 'seeing-is-believing)
(require 'seeing-is-believing)

;; Ruby test mode
(require 'ruby-test-mode)
(add-hook 'ruby-mode-hook 'ruby-test-mode)

;; Setting rbenv path
;; (setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
;; (setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))

;; ;; Robe - Ruby autocomplete
;; (add-hook 'ruby-mode-hook 'robe-mode)
;; (eval-after-load 'company
;;   '(push 'company-robe company-backends))
;; (add-hook 'robe-mode-hook 'ac-robe-setup)

(provide 'setup-ruby)
