;; -*- coding:utf-8 -*-
;; dired でサイズ，拡張子で並び換え
; (load-safe "sorter")
(when (locate-library "sorter")
  (add-hook 'dired-load-hook
            (lambda ()
              (autoload 'sorter))))
