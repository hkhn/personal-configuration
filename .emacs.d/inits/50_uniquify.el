;; -*- coding:utf-8 -*-
;- 2009/09/24
;; http://www-tsujii.is.s.u-tokyo.ac.jp/~yoshinag/tips/dot_emacs.html

;; 同一名の buffer があったとき、開いているファイルのパスの一部を表示して区別する
;; use partial path for the same buffer name
(when (locate-library "uniquify")
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets))
