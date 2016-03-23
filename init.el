;; ------------------------
;;   Emacs Configurations
;; ------------------------

;; Constants.
(defconst init-dir (concat user-emacs-directory "init.d"))
(defconst backup-dir (concat temporary-file-directory "emacs"))
(defconst yas-dir (concat user-emacs-directory "snippets"))
(defconst themes-dir (concat user-emacs-directory "themes"))

;; These are without .el because `load` will add these as appropriately when using them.
(defconst general-file (concat user-emacs-directory "general"))
(defconst functions-file (concat user-emacs-directory "functions"))

(setq custom-theme-directory themes-dir)

;; Custom.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (danneskjold-netrom)))
 '(custom-safe-themes
   (quote
    ("ff531c9015fdf81bacbc1e29686dba68d049bd049cedff6f58c1672ec1f3dad3" default)))
 '(recentf-exclude
   (quote
    ("ido.last" ".emacs.d/saveplace.txt" "/var/folders/" "~/Maildir")))
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Prefer newest version of a file, especially for compiled files this is
;; useful.
(setq load-prefer-newer t)

;; Load general stuff that other init.d things might use.
(load functions-file)
(load general-file)

;; Packages setup.
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;;(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

;; Aliases for viewing packages.
(defalias 'lp 'package-list-packages)
(defalias 'lpn 'package-list-packages-no-fetch)

(eval-when-compile (package-initialize))

(defun require-package (package)
  "Refresh package archives, check package presence and install if it's not installed."
  (if (null (require package nil t))
      (progn (let* ((ARCHIVES (if (null package-archive-contents)
                                  (progn (package-refresh-contents)
                                         package-archive-contents)
                                package-archive-contents))
                    (AVAIL (assoc package ARCHIVES)))
               (if AVAIL
                   (package-install package)))
             (require package))))

;; The "backbone" uses req-package.
(require-package 'req-package)
(require 'req-package)
(random t)
(req-package-force load-dir
  :defer 1
  :init
  (setq force-load-messages nil)
  (setq load-dir-debug nil)
  (setq load-dir-recursive t)
  :config
  (load-dir-one init-dir)
  (req-package-finish))
