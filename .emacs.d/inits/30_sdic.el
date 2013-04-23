;; -*- coding:utf-8 -*-
;- 2008/10/16
;; sdic-mode 用設定
(autoload 'sdic-describe-word
  "sdic" "英単語の意味を調べる" t nil)
(global-set-key "\C-cw" 'sdic-describe-word)
(autoload 'sdic-describe-word-at-point
  "sdic" "カーソルの位置の英単語の意味を調べる" t nil)
(global-set-key "\C-cW" 'sdic-describe-word-at-point)

;; 英和検索で使用する辞書
(setq sdic-eiwa-dictionary-list
      '(
        (sdicf-client
         "~/local/share/dict/gene.sdic")
        (sdicf-client
         "~/local/share/dict/eedict.sdic")
        ))
;; 和英検索で使用する辞書
(setq sdic-waei-dictionary-list
      '(
        (sdicf-client
         "~/local/share/dict/jedict.sdic")
        ))

;; 文字色
(setq sdic-face-color "pink")
