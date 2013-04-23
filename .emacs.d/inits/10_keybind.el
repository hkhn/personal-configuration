;; -*- coding:utf-8 -*-
;- 2007/10/01
;* \C-h を BS として使う
;* use \C-h for [BS]
(global-set-key "\C-h" 'delete-backward-char)
;* GUI で使っているときには \C-z を無効化する
;* when used on GUI, \C-z is disabled
(cond (window-system
       (global-unset-key "\C-z")))

;- 2010/10/05
;* \C-l を連打してもずっと中央にとどまるようにする
;* (default は recenter-top-bottom)
(global-set-key "\C-l" 'recenter)

;- 2011/10/18
;* Cocoa Emacs での Meta キーを Command に変更 (デフォルトは Option)
(cond (is-mac
       (setq ns-command-modifier (quote meta))
       (setq ns-alternate-modifier (quote super))))

;- 2012/09/08
;; 日時の入力
(define-key global-map [f5]
  '(lambda ()
     (interactive)
     (insert-timestamp)))
