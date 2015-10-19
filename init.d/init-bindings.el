;; General bindings.
(global-set-key (kbd "M-n") 'scroll-line-down)
(global-set-key (kbd "M-p") 'scroll-line-up)
(global-set-key (kbd "C-M-p") 'move-line-up)
(global-set-key (kbd "C-M-n") 'move-line-down)
(global-set-key (kbd "M-P") 'previous-user-buffer)
(global-set-key (kbd "M-N") 'next-user-buffer)
(global-set-key (kbd "C-c o") 'ff-find-other-file)
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; Cycle through "just one space", "no spaces" and original number of spaces,
;; instead of just "just one space". It does not delete newlines, too.
(global-set-key (kbd "M-SPC")
                '(lambda () (interactive) (cycle-spacing +1 t)))

;; Make font bigger/smaller.
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Indent, untabify and clean whitespace of entire buffer.
(global-set-key (kbd "C-c c") 'cleanup-buffer)

;; Using hippie-expand instead of dabbrev-expand.
(global-set-key (kbd "M-/") 'hippie-expand)

;; Jump to last mark and pop the mark (does not affect the mark ring). Easy way
;; to get back to a mark.
(global-set-key (kbd "C-x p") 'pop-to-mark-command)


(provide 'init-bindings)
