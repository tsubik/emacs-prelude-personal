;; THEME
;; Configure theme changer
;; it switches day/night themes
(require 'theme-changer)
(setq calendar-location-name "Gliwice, PL")
(setq calendar-latitude 50.29)
(setq calendar-longitude 18.67)
(change-theme 'solarized-light 'solarized-dark)

;; (load-theme 'monokai)

(provide 'setup-theme)
