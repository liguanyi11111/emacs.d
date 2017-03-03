;;; 选项设置 ;;;

;; 关闭开机动画
(setq inhibit-startup-message t)
;; 关闭guns开机动画
(setq gnus-inhibit-startup-message t)
;; 取消自动保存
(setq auto-save-default nil)
;; 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文
(setq scroll-margin 3
      scroll-conservatively 10000)
;; 把缺省的 major mode 设置为 text-mode
(setq default-major-mode 'text-mode)
;; 标题栏显示buffer名字
(setq frame-title-format "emacs@%b")
;; 允许 dired 递归的删除与拷贝目录
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
;; 关闭tool bar
(tool-bar-mode 0)
;; 显示配对括号
(show-paren-mode 1)
;; Yes to y, No to n
(fset 'yes-or-no-p 'y-or-n-p)

;;Show current position of cursor in all buffers
(line-number-mode 1)
(column-number-mode 1)

;; 取消backup file 与 显示行号
(custom-set-variables
 '(make-backup-files nil)
 '(global-linum-mode t)
 )


;;; 包管理 ;;;

(require 'package)
;; If you want to use latest version
(add-to-list 'package-archives '
  ("melpa" . "https://melpa.org/packages/"))

;; If you want to use last tagged version
(add-to-list 'package-archives '
  ("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)


;;; eshell ;;;
(defun eshell-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    ;; (insert (concat "ls"))
    ;; (eshell-send-input)
  )
)

(global-set-key (kbd "C-x t") 'eshell-here)
(global-set-key (kbd "C-x T") 'eshell)

(require 'ansi-color)
;; eshell 的颜色
;; 这样可以显示颜色，但是当在文件很多的目录里面显示的时候
;; 会很慢
(add-hook 'eshell-preoutput-filter-functions
         'ansi-color-apply)
;; 这样直接把颜色滤掉
;; (add-hook 'eshell-preoutput-filter-functions
;;           'ansi-color-filter-apply)

(provide 'common-config)



