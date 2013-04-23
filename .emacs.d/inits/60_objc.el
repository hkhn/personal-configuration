;; -*- coding:utf-8 -*-
;* Objective-C

(add-hook 'objc-mode-hook
          '(lambda()
             (setq c-site-default-style "bsd")
             (setq c-basic-offset 4)
             ))
;(setq auto-mode-alist (cons '("\\.h$" . objc-mode) auto-mode-alist))
