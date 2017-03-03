;;; 文件打开模式  ;;;
(add-to-list 'auto-mode-alist '("\\.launch\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.urdf\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.xacro\\'" . xml-mode))

;;; ido ;;;
(require 'ido)
(ido-mode t)
;; enable fuzzy matching
(setq ido-enable-flex-matching t)

;;; ecb ;;;
(require 'ecb)
;; 快速开启快捷键
(defun my-ecb-active-or-deactive ()
    (interactive)
    (if ecb-minor-mode
      (ecb-deactivate)
      (ecb-activate)))
(setq ecb-tip-of-the-day nil)
(global-set-key (kbd "<C-f1>") 'my-ecb-active-or-deactive) 

(provide 'browsing-config)
