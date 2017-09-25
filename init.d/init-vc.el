(require 'req-package)

(req-package magit
  :config
  ;; Set defaults used by specific operations.
  (setq magit-pull-arguments '("--rebase")
        magit-cherry-pick-arguments '("-x")
        magit-log-arguments '("-n50" "--graph" "--decorate" "--color")
        magit-diff-arguments '("-U3" "--stat" "--no-ext-diff")
        magit-fetch-arguments '("--prune"))

  (global-set-key (kbd "C-x g") 'magit-status))

;; Highlight uncommitted changes/additions/deletions in the fringe.
(req-package diff-hl
  :require magit
  :config
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)

  (diff-hl-flydiff-mode 1)
  (global-diff-hl-mode 1))

(req-package gitignore-mode)
(req-package gitconfig-mode)

(req-package helm-ls-git
  :require helm
  :bind ("M-+" . helm-ls-git-ls))

;; Show git commit at line.
(req-package git-messenger
  :bind ("C-x v p" . git-messenger:popup-message)
  :config
  (setq git-messenger:show-detail t))

(req-package git-timemachine
  :config
  (defalias 'tm 'git-timemachine))


(provide 'init-vc)
