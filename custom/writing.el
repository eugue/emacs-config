(defun set-reader-view ()
  (text-scale-set 1)
  (setq line-spacing 4)
  )
(use-package olivetti
  :ensure t
  :init
  (setq olivetti-body-width 88)
  :config
  (add-hook 'text-mode-hook 'olivetti-mode)
  (add-hook 'olivetti-mode-hook 'set-reader-view)
  ;; (add-hook 'text-mode-hook '(whitespace-mode nil))
  )

;; Thesaurus
(use-package powerthesaurus
  :ensure t)
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))