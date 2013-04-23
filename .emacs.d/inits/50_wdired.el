;; -*- coding:utf-8 -*-
;; dired バッファを編集 (rename)
(when (locate-library "wdired")
  (require 'wdired)
  (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode))
