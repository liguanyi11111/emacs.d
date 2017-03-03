;;; init all

;;; 自动补全配置 ;;;

;;yasnippet
;;(require 'yasnippet)
;;(yas-global-mode 1)


;;auto-complete
(require 'auto-complete)
(defalias 'ac 'auto-complete-mode)
(setq ac-auto-start 3)
;; 设置tab 键启动complete 不能直接使用define key会覆盖掉tab本来功能
(ac-set-trigger-key "TAB")
(define-key ac-mode-map (kbd "M-/") 'auto-complete)
;; 删除仍触发
(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))
;; 仅menu出现时使用
(setq ac-use-menu-map t)
;; Default settings
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(define-key ac-menu-map "\r"   'ac-complete)
(require 'auto-complete-config)
(ac-config-default)

;;auto-complete-clang


(provide 'coding-config)
