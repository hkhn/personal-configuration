;; -*- coding:utf-8 -*-
;* color-theme を有効にする
;* use color-theme
(when (locate-library "color-theme")
  (require 'color-theme)
  (color-theme-initialize)
  ;(color-theme-arjen)
  (cond (is-unix
         (color-theme-clarity))
        (is-mac
         (color-theme-clarity))))

