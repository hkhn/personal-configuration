;; -*- coding:utf-8 -*-
;- 2007/10/01
;* インデントに TAB を使わない
;* use space for indent
;; if you want to use [TAB], press "\C-q [TAB]"
(setq-default indent-tabs-mode nil)
;(setq-default tab-width 4)

;; 一行ずつスクロールする
;; scroll by one line
(setq scroll-conservatively 1)

;- 2007/11/23
;* スクリプトを保存する時、自動的に chmod +x を行うようにする
;* save a script starting "#!" as an executable one
(defun make-file-executable ()
  "Make the file of this buffer executable, when it is a script source."
  (save-restriction
    (widen)
    (if (string= "#!" (buffer-substring-no-properties 1 (min 3 (point-max))))
        (let ((name (buffer-file-name)))
          (or (equal ?. (string-to-char (file-name-nondirectory name)))
              (let ((mode (file-modes name)))
                (set-file-modes name (logior mode (logand (/ mode 4) 73)))
                (message (concat "Wrote " name " (+x)"))))))))
(add-hook 'after-save-hook 'make-file-executable)
