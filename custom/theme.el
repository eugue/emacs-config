;; Theme
(use-package doom-themes
  :ensure t)
(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup))

;; -- Automatically switch between ligh and dark theme based on time of day
(setq theme-autoswitch t)
(setq theme-autoswitch/light-theme 'doom-solarized-light)
(setq theme-autoswitch/dark-theme 'doom-peacock)
(setq theme-autoswitch/day-start-hour 6)
(setq theme-autoswitch/day-end-hour 17)
(if (and theme-autoswitch (display-graphic-p))
    (progn
      (setq current-theme theme-autoswitch/dark-theme)
      (defun sync-theme-with-time ()
        (setq theme-autoswitch/hour (string-to-number (substring (current-time-string) 11 13)))
        (if (member theme-autoswitch/hour (number-sequence theme-autoswitch/day-start-hour theme-autoswitch/day-end-hour))
            (setq theme-autoswitch/now theme-autoswitch/light-theme)
          (setq theme-autoswitch/now theme-autoswitch/dark-theme))
        (if (or (not (boundp 'current-theme)) (eq theme-autoswitch/now current-theme))
            nil
          (setq current-theme theme-autoswitch/now))
        (load-theme theme-autoswitch/now t)
        )
      (run-with-timer 0 3600 #'sync-theme-with-time)
      )
  (load-theme theme-autoswitch/dark-theme t)
  )

;; Typeface
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8-unix)
;; -- Default
;; (when (member "Source Code Pro" (font-family-list))
;;   (set-face-attribute 'default nil :font "Source Code Pro"))
;; (when (member "DejaVu Sans Mono" (font-family-list))
;;   (set-face-attribute 'default nil :font "DejaVu Sans Mono"))
;; (when (member "Inconsolata" (font-family-list))
;;   (set-face-attribute 'default nil :font "Inconsolata"))
;; (when (member "Consolas" (font-family-list))
;;   (set-face-attribute 'default nil :font "Consolas"))
(when (member "MesloLGS NF" (font-family-list))
  (set-face-attribute 'default nil :font "MesloLGS NF"))
;; -- Unicode
;; Symbola: https://dn-works.com/wp-content/uploads/2020/UFAS-Docs/Symbola.pdf
(when (member "Symbola" (font-family-list))
  (set-fontset-font t 'unicode "Symbola" nil 'prepend))
;; (when (member "Segoe UI Emoji" (font-family-list))
;;   (set-fontset-font t 'unicode "Segoe UI Emoji" nil 'prepend))
;; -- Chinese
(when (member "WenQuanYi Micro Hei" (font-family-list))
  (set-fontset-font t '(#x4e00 . #x9fff) "WenQuanYi Micro Hei" ))

(set-face-attribute 'default nil :height 90)
(font-family-list)
