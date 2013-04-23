;; -*- coding:utf-8 -*-
;- 2010/08/16
;* close all buffers
;; http://epian-wiki.appspot.com/wiki/Memo/20100327033507/Emacs:全てのバッファを閉じる(close-all-buffers)
(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;- 2011/01/11
;* revert all file buffers
;; http://hisashim.org/2009/09/21/my-revert-all-file-buffers.html
(defun revert-all-file-buffers ()
  "Revert all visited buffers."
  (interactive)
  (dolist (buf (buffer-list))
    (if (not (buffer-file-name buf))
        (message (concat (buffer-name buf) " skipped."))
      (save-excursion
        (set-buffer buf)
        (cond ((string-match "Emacs" (emacs-version))
               (revert-buffer t t))
              ((string-match "xyzzy" (emacs-version))
               (revert-buffer))
              (else (error (emacs-version))))
        (message (concat (buffer-name buf) " reverted."))))))

;- 2011/01/11
;* replace white lines
(defun replace-white-lines ()
  "Replace lines of only spaces with empty lines."
  (interactive)
  (replace-regexp "^[ \t]+$" ""))

;; full-screen の切り替え
(defun toggle-fullscreen ()
  (interactive)
  (if (frame-parameter nil 'fullscreen)
      (set-frame-parameter nil 'fullscreen nil)
    (set-frame-parameter nil 'fullscreen 'fullboth)))
(cond (window-system
       (global-set-key [(meta return)] 'toggle-fullscreen)))

;- 2012/09/08
;; 日時の入力
(defun insert-timestamp ()
  (interactive)
  (insert (format-time-string "%Y/%m/%d %H:%M:%S")))

;- 2009/10/28
;* 印刷用設定

;; メモ帳から印刷
;; http://d.hatena.ne.jp/tunefs/20060501/p2
;; この設定で M-x print-buffer RET などでの印刷ができるようになります
;;  notepad に与えるパラメータの形式の設定
(cond (is-meadow
       (define-process-argument-editing "notepad"
         (lambda (x) (general-process-argument-editing-function x nil t)))
       (defun w32-print-region (start end
                                      &optional lpr-prog delete-text buf display
                                      &rest rest)
         (interactive)
         (let ((tmpfile (expand-file-name (make-temp-name "w32-print-")
                                          temporary-file-directory))
               (coding-system-for-write w32-system-coding-system))
           (write-region start end tmpfile nil 'nomsg)
           (call-process "notepad" nil nil nil "/p" tmpfile)
           (and (file-writable-p tmpfile) (delete-file tmpfile))))
       (setq print-region-function 'w32-print-region)))
