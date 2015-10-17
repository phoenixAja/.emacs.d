(require 'req-package)

(req-package magit
  :config
  (progn
    (setq magit-revert-item-confirm t)
    (setq magit-save-some-buffers t)
    (setq magit-auto-revert-mode nil) ;; Do _not_ auto-revert!
    (setq magit-revert-buffers t)
    (setq magit-last-seen-setup-instructions "1.4.0") ;; Silence latest info.
    (setq magit-push-always-verify nil) ;; Only ask when upstream is not conf'ed!

    (global-set-key (kbd "C-x g") 'magit-status)))

(req-package gitignore-mode)
(req-package gitconfig-mode)

(req-package helm-ls-git
  :require helm
  :bind ("M-+" . helm-ls-git-ls))

;; Show git commit at line.
(req-package git-messenger
  :bind ("C-x v p" . git-messenger:popup-message)
  :config
  (progn
    (setq git-messenger:show-detail t)))

(req-package git-timemachine
  :config
  (progn
    (defalias 'tm 'git-timemachine)))


(provide 'init-vc)