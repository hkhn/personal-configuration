;; -*- coding:utf-8 -*-
;- 2012/09/19
;* evernote
(when (locate-library "evernote-mode")
  (require 'evernote-mode)
  (global-set-key "\C-cec" 'evernote-create-note)
  (global-set-key "\C-ceo" 'evernote-open-note)
  (global-set-key "\C-ces" 'evernote-search-notes)
  (global-set-key "\C-ceS" 'evernote-do-saved-search)
  (global-set-key "\C-cew" 'evernote-write-note)
  (global-set-key "\C-cep" 'evernote-post-region)
  (global-set-key "\C-ceb" 'evernote-browser)
  (setq evernote-username "username")
  (setq evernote-password-cache t)
  )
