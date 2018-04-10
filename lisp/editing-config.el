;;; 常用编辑设置 ;;;


;; 用空格代替tab
(setq-default indent-tabs-mode nil);
;; 设置tab宽度
(setq default-tab-width 2)
;; 括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;; 注释
(global-set-key (kbd "M--") 'comment-dwim)
;; 行跳转 m-g-g
;; 撤销
(global-set-key (kbd "C-z") 'undo)
;;在编辑时删除掉选中单位
(delete-selection-mode 1)


;;; 自动匹配括号 ;;;
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
(global-set-key "%" 'match-paren)


;;; 选中整行 ;;;
(defun mark-line (&optional arg)
  "Marks a line"
  (interactive "p")
  (beginning-of-line)
  (push-mark (point) nil t)
  (end-of-line))

(global-set-key (kbd "C-c l") 'mark-line)

;;; 删除整行 ;;;
(global-set-key (kbd "C-d") 'kill-whole-line)

;;; 复制当前行到下一行 ;;;
(defun djcb-duplicate-line (&optional commentfirst)
  "comment line at point; if COMMENTFIRST is non-nil, comment the
  original" (interactive)
  (beginning-of-line)
  (push-mark)
  (end-of-line)
  (let ((str (buffer-substring (region-beginning) (region-end))))
    (when commentfirst
      (comment-region (region-beginning) (region-end)))
    (insert-string
     (concat (if (= 0 (forward-line 1)) "" "\n") str "\n"))
    (forward-line -1)))

;; duplicate a line
(global-set-key (kbd "C-M-<down>") 'djcb-duplicate-line)

;;; 移动一行 ;;;
(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

;; Mimic Alt-<up> Alt-<down> in Eclipse
(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)


;;; ace jump ;;; 
;; 一个神奇的跳转方式

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c j") 'ace-jump-mode)

;;; 以root权限打开当前文件 ;;;

(defun sudo-reopen ( ) 
  "reopen current file with sudo."
  (setq sudo-file-real-path
	(replace-regexp-in-string "\n" ""
				  (shell-command-to-string (concat "readlink -f " buffer-file-truename))
				  )
	)
  (kill-this-buffer)
  (find-file (concat "/sudo::" sudo-file-real-path))
  (interactive) 
  )

(global-set-key (kbd "C-c s u") 'sudo-reopen)


(provide 'editing-config)

