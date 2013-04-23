;; -*- coding:utf-8 -*-
;- 2011/11/02
;* auto-complete
;;(add-to-list 'load-path "~/local/share/emacs/site-lisp/auto-complete-1.3.1")
(when (locate-library "auto-complete-config")
  (require 'auto-complete-config)
  (add-to-list 'ac-dictionary-directories "~/local/share/emacs/site-lisp/auto-complete-1.3.1/ac-dict")
  (ac-config-default)
  (global-auto-complete-mode t)
  (define-key ac-complete-mode-map "\C-n" 'ac-next)
  (define-key ac-complete-mode-map "\C-p" 'ac-previous))
