(prelude-require-packages
 '(ido-vertical-mode
   editorconfig
   comment-dwim-2
   multiple-cursors
   neotree
   projectile-rails
   ag))

;; Lines numbering
(defadvice linum-update-window (around linum-dynamic activate)
  "Dynamic format for linum."
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))

(setq linum-format 'dynamic)
(global-linum-mode)

;; Do not compile SCSS files on save
(setq scss-compile-at-save nil)

(when (require 'ido-vertical-mode nil 'noerror)
  (ido-vertical-mode 1))

(when (require 'ag nil 'noerror)
  (setq ag-highlight-search t)
  (setq ag-reuse-buffers 't))

(add-hook 'projectile-mode-hook 'projectile-rails-on)

(global-undo-tree-mode 0)

;; Neotree configuration
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(setq neo-dont-be-alone t)
(setq neo-show-hidden-files t)
(setq projectile-switch-project-action 'neotree-projectile-action)

(set-face-attribute 'neo-button-face      nil :height 80)
(set-face-attribute 'neo-file-link-face   nil :height 80)
(set-face-attribute 'neo-dir-link-face    nil :height 80)
(set-face-attribute 'neo-header-face      nil :height 80)
(set-face-attribute 'neo-expand-btn-face  nil :height 80)

(add-to-list 'auto-mode-alist '("\\.hbs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))

(editorconfig-mode 1)

(global-set-key (kbd "C-M-]") 'er/expand-region)
(global-set-key (kbd "C-M-[") 'er/contract-region)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; better comment's like in Sublime Text toggle comment
(global-set-key (kbd "C-/") 'comment-dwim-2)
;; kill current buffer immediatly
(global-set-key (kbd "C-x C-k C-k") 'kill-this-buffer)

(setq backup-by-copying t)
(setq backup-directory-alist  (quote (("." . "~/.emacs.backups"))))
(setq create-lockfiles nil)
(setq auto-save-file-name-transforms `((".*" ,(expand-file-name "~/.emacs.backups/") t)))
(setq delete-auto-save-files t)
