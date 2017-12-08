(prelude-require-packages
  '(ido-vertical-mode
     editorconfig
     comment-dwim-2
     flymd
     multiple-cursors
     neotree
     projectile-rails
     alchemist
     ag
     tide
     solarized-theme
     theme-changer
     exec-path-from-shell
     rjsx-mode))

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

;; THEME
;; Configure theme changer
;; it switches day/night themes
(require 'theme-changer)
(setq calendar-location-name "Gliwice, PL")
(setq calendar-latitude 50.29)
(setq calendar-longitude 18.67)

(change-theme 'dichromacy 'wombat)

;; Lines numbering
(defadvice linum-update-window (around linum-dynamic activate)
  "Dynamic format for linum."
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))

(setq linum-format 'dynamic)
(global-linum-mode)

;; SCSS
;; Do not compile SCSS files on save
(setq scss-compile-at-save nil)

(when (require 'ido-vertical-mode nil 'noerror)
  (ido-vertical-mode 1))

(when (require 'ag nil 'noerror)
  (setq ag-highlight-search t)
  (setq ag-reuse-buffers 't))

;; Projectile
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

;; EditorConfig
(editorconfig-mode 1)

;; Better expand region mapping
(global-set-key (kbd "C-M-]") 'er/expand-region)
(global-set-key (kbd "C-M-[") 'er/contract-region)

;; Markdown
;;flymd config
(require 'flymd)
(defun my-flymd-browser-function (url)
  (let ((browse-url-browser-function 'browse-url-firefox))
    (browse-url url)))
(setq flymd-browser-open-function 'my-flymd-browser-function)

;; multiple cursors configuration
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; better comment's like in Sublime Text toggle comment
(global-set-key (kbd "C-/") 'comment-dwim-2)
;; kill current buffer immediatly
(global-set-key (kbd "C-x C-k C-k") 'kill-this-buffer)

;; setting up mode loaders
(add-to-list 'auto-mode-alist '("\\.hbs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
;; react
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.js$" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsx$" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode))
;; postcss
(add-to-list 'auto-mode-alist '("\\.pcss$" . scss-mode))

;; Flycheck
;; disable flyspell spellchecking
(setq prelude-flyspell nil)
;; not sure why I disabled that
;; (setq flycheck-display-errors-function nil)

;; flycheck eslint
;; (add-hook 'js2-mode-hook 'qoobaa/js2-mode-setup)
;; (add-hook 'js2-mode-hook 'tsubik/find-local-standard-executable)

;; (flycheck-add-mode 'javascript-standard 'rjsx-mode)
;; (flycheck-add-mode 'javascript-standard 'web-mode)
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; alchemist
(add-hook 'elixir-mode-hook 'alchemist-mode)

;; use local eslint from node_modules before global
;; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                 (or (buffer-file-name) default-directory)
                 "node_modules"))
          (eslint (and root
                    (expand-file-name "node_modules/.bin/eslint"
                      root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

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

;; json-mode
(add-hook 'json-mode-hook
  (lambda ()
    (make-local-variable 'js-indent-level)
    (setq js-indent-level 2)))

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

;; company config
(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
     (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)))
;; prevent company dabbrev from downcasing auto completions
(setq company-dabbrev-downcase nil)

;; simple open THIS file command
(defun open-config ()
  (interactive)
  (find-file "~/.emacs.d/personal/tweaks.el"))

;; Ruby stuff

;; Setting rbenv path
;; (setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
;; (setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))

;; Run ruby test at point
(defun ruby-get-current-test-name ()
  (save-excursion
    (let ((pos)
           (test-name))
      (re-search-backward "test \"\\([^\"]+\\)\" do")
      (setq test-name (buffer-substring-no-properties (match-beginning 1) (match-end 1)))
      (concat "test_" (replace-regexp-in-string " " "_" test-name)))))

(defun ruby-run-test-at-point ()
  (interactive)
  (let ((root-dir (projectile-project-root)))
    (compile (format "ruby -Ilib:test -I%s/test %s -n %s" root-dir (expand-file-name (buffer-file-name)) (ruby-get-current-test-name)))))

(defun insert-random-uuid ()
  (interactive)
  (shell-command "uuidgen" t))

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
    (delq (current-buffer)
      (remove-if-not 'buffer-file-name (buffer-list)))))
