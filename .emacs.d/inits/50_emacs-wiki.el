;; -*- coding:utf-8 -*-
;- 2009/03/28
;- 2012/09/08
;* Emacs Wiki
(when (locate-library "emacs-wiki")
  (require 'emacs-wiki)
  ;; M-x customize-group で emacs-wiki とやれば色々できる
  (setq emacs-wiki-directories (cons "~/emacswiki" nil))
  (setq emacs-wiki-publishing-directory "~/emacswiki_html")
  (setq emacs-wiki-maintainer "xxx@example.com")
  (setq emacs-wiki-charset-default "utf-8")
  (setq emacs-wiki-publish-url-coding-system "utf-8")
  (setq emacs-wiki-default-page "Home")
  (setq emacs-wiki-index-page "Index")
  )
