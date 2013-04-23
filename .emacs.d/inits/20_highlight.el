;; -*- coding:utf-8 -*-
;- 2009/09/26
;; http://gist.github.com/raw/51782/537ac17e7bdc69e2c624187b01cf32807df707eb/yagihiro.emacs.el
;* バッファを切り替えても色がついた状態を保持
(setq highlight-nonselected-windows t)

;- 2007/10/01
;* 現在カーソルのある行をハイライトする
;(global-hl-line-mode)
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "blue" :foreground "white"))
    (((class color)
      (background light))
     (:background "ForestGreen"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
;(setq hl-line-face 'underline)
