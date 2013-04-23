;; -*- coding:utf-8 -*-
;* ajc-java-complete
;;(add-to-list 'load-path "~/local/share/emacs/site-lisp/ajc-java-complete")
(when (locate-library "ajc-java-complete-config")
  (require 'ajc-java-complete-config)
  (add-hook 'java-mode-hook 'ajc-java-complete-mode)
  (add-hook 'find-file-hook 'ajc-4-jsp-find-file-hook))
