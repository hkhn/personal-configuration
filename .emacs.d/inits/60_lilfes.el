;; -*- coding:utf-8 -*-
;* LiLFeS
(when (locate-library "lilfes-mode")
  (setq auto-mode-alist (cons '("\\.lil$" . lilfes-mode) auto-mode-alist))
  (autoload 'lilfes-mode "lilfes-mode21" "Major mode for editing LiLFeS code." t))
