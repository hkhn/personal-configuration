;; -*- coding:utf-8 -*-
;- 2007/11/15
;* 左側に行番号を表示する
;* display line number on the left side
(when (locate-library "wb-line-number")
  (require 'wb-line-number)
  ; (wb-line-number-toggle)
  (setq wb-line-number-scroll-bar t))
