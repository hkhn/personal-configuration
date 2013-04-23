;; -*- coding:utf-8 -*-
;* yasnippet
(when (locate-library "yasnippet")
  (require 'yasnippet) ;; not yasnippet-bundle
  (yas/initialize)
  (yas/load-directory "~/local/share/emacs/site-lisp/yasnippet-0.6.1c/snippets"))
