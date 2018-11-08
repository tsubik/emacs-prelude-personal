;; Better expand region mapping
(global-set-key (kbd "C-M-]") 'er/expand-region)
(global-set-key (kbd "C-M-[") 'er/contract-region)

;; indent-rigidly
(global-set-key (kbd "M-<left>") 'indent-rigidly-left)
(global-set-key (kbd "M-<right>") 'indent-rigidly-right)

;; smartparens
(global-set-key (kbd "C-M-a") 'sp-beginning-of-sexp)
(global-set-key (kbd "C-M-e") 'sp-end-of-sexp)
(global-set-key (kbd "M-[") 'sp-backward-unwrap-sexp)
(global-set-key (kbd "M-]") 'sp-unwrap-sexp)

;; multiple cursors configuration
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; better comment's like in Sublime Text toggle comment
(global-set-key (kbd "C-/") 'comment-dwim-2)
;; kill current buffer immediatly
(global-set-key (kbd "C-x C-k C-k") 'kill-this-buffer)

;; hidshow-org
(global-set-key "\C-ch" 'hs-org/minor-mode)

(provide 'setup-key-bindings)
