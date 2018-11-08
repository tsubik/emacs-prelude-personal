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

(provide 'setup-neotree)
