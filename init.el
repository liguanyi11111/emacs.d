;;; ======================================================================= ;;;
;;; EXECUTABLE PATH
;;; ======================================================================= ;;;
;;; have a private script directory for emacs only; all utilities will
;;; be put into ~/.emacs.d/scripts
(setenv "PATH" (concat (getenv "PATH") ":~/.emacs.d/scripts"))
(setq exec-path (append exec-path '("~/.emacs.d/scripts")))


;;; ======================================================================= ;;;
;;; LOADPATH
;;; ======================================================================= ;;;
(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(require 'init-all)

(provide 'init)

;; ecb 自动保存
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes (quote (("left8" (ecb-directories-buffer-name 0.1722488038277512 . 0.38461538461538464) (ecb-sources-buffer-name 0.1722488038277512 . 0.2692307692307692) (ecb-methods-buffer-name 0.1722488038277512 . 0.15384615384615385) (ecb-history-buffer-name 0.1722488038277512 . 0.17307692307692307)))))
 '(ecb-options-version "2.50")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(global-linum-mode t)
 '(make-backup-files nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


