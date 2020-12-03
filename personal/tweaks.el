(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(prelude-require-packages
  '(
     ag
     ;; alchemist
     all-the-icons
     comment-dwim-2
     company
     company-lsp
     company-quickhelp
     csv-mode
     editorconfig
     exec-path-from-shell
     flymd
     ;; hideshow-org
     ido-vertical-mode
     imenu-anywhere
     lsp-mode
     multiple-cursors
     neotree
     ;; prettier-js
     projectile-rails
     pos-tip
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
     web-mode
     ))

(require 'hideshow-org)
(require 'multiple-cursors)

(add-to-list 'load-path (expand-file-name "setup" prelude-personal-dir))

(require 'setup-theme)
(require 'setup-helpers)

;; (require 'setup-elixir)
(require 'setup-company)
(require 'setup-eslint)
(require 'setup-json)
(require 'setup-markdown)
(require 'setup-ruby)
(require 'setup-stylelint)
(require 'setup-typescript)
(require 'setup-webmode)

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

;; IDO
(when (require 'ido-vertical-mode nil 'noerror)
  (ido-vertical-mode 1))
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(when (require 'ag nil 'noerror)
  (setq ag-highlight-search t)
  (setq ag-reuse-buffers 't)
  (setq ag-arguments (append '("--ignore-case") ag-arguments)))

;; Projectile
(add-hook 'projectile-mode-hook 'projectile-rails-on)

;; EditorConfig
(editorconfig-mode 1)

;; postcss
(add-to-list 'auto-mode-alist '("\\.pcss$" . scss-mode))
