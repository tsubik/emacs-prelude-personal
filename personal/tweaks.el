(prelude-require-packages
  '(
     ag
     alchemist
     all-the-icons
     comment-dwim-2
     company
     company-lsp
     editorconfig
     exec-path-from-shell
     flymd
     hideshow-org
     ido-vertical-mode
     lsp-mode
     multiple-cursors
     neotree
     prettier-js
     projectile-rails
     rjsx-mode
     robe
     rubocop
     ruby-test-mode
     seeing-is-believing
     solarized-theme
     monokai-theme
     theme-changer
     tide
     use-package
     ))

(require 'hideshow-org)
(require 'multiple-cursors)

(add-to-list 'load-path (expand-file-name "setup" prelude-personal-dir))

(require 'setup-theme)
(require 'setup-helpers)

(require 'setup-elixir)
(require 'setup-eslint)
(require 'setup-json)
(require 'setup-markdown)
(require 'setup-ruby)
(require 'setup-stylelint)
(require 'setup-typescript)

(require 'setup-key-bindings)
(require 'setup-flycheck)
(require 'setup-neotree)

;; LSP is a Language Server Protocol, for code completion
;; (require 'setup-lsp)

;; MISC configuration
;; Increase character limit in line to 100
(setq whitespace-line-column 100)
;; add new line at the end of buffer with C-n
(setq next-line-add-newlines t)

(setq backup-by-copying t)

(setq backup-directory-alist  (quote (("." . "~/.emacs.backups"))))

(setq create-lockfiles nil)

(setq auto-save-file-name-transforms `((".*" ,(expand-file-name "~/.emacs.backups/") t)))

(setq delete-auto-save-files t)
;; exec path from shell
(exec-path-from-shell-initialize)

(global-undo-tree-mode 0)

;; Lines numbering
(defadvice linum-update-window (around linum-dynamic activate)
  "Dynamic format for linum."
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))

(setq linum-format 'dynamic)
(global-linum-mode)
;; End of lines numbering

(when (require 'ido-vertical-mode nil 'noerror)
  (ido-vertical-mode 1))

(when (require 'ag nil 'noerror)
  (setq ag-highlight-search t)
  (setq ag-reuse-buffers 't)
  (setq ag-arguments (append '("--ignore-case") ag-arguments)))

;; Projectile
(add-hook 'projectile-mode-hook 'projectile-rails-on)

;; EditorConfig
(editorconfig-mode 1)

;; setting up mode loaders
(add-to-list 'auto-mode-alist '("\\.hbs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs$" . web-mode))
;; ruby template from rails
(add-to-list 'auto-mode-alist '("\\.ruby$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.arb$" . ruby-mode))
;; react
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode))
;; postcss
(add-to-list 'auto-mode-alist '("\\.pcss$" . scss-mode))

;; Web mode config
(setq web-mode-content-types-alist
  '(("jsx" . "\\.js[x]?\\'")))
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-attr-indent-offset 2)
  )
(add-hook 'web-mode-hook 'my-web-mode-hook)

;; company global config
(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
     (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)))
;; prevent company dabbrev from downcasing auto completions
(setq company-dabbrev-downcase nil)

;; setting up tide mode
;; (defun setup-tide-mode ()
;;   (interactive)
;;   (tide-setup)
;;   (flycheck-mode +1)
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (eldoc-mode +1)
;;   (tide-hl-identifier-mode +1)
;;   ;; company is an optional dependency. You have to
;;   ;; install it separately via package-install
;;   (company-mode +1))

;; (add-hook 'js2-mode-hook #'setup-tide-mode)
