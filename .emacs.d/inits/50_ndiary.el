;; -*- coding:utf-8 -*-
;- 2008/01/17
;* nDiary を使うために
(when (locate-library "ndiary-mode")
  (require 'ndiary-mode)
  (setq ndiary-ruby-file-name "ruby")
  ;; 日記ファイルの場所
  (setq ndiary-log-directory "~/ndiary/log")
  ;; diary のあるディレクトリ
  (setq ndiary-script-derectory "~/ndiary/script")
  ;; トップページ
  (setq ndiary-latest-filename "~/html/index.html")
  ;; ftp ソフトと引数．分からなければ nil でいいです．
  (setq ndiary-upload-command nil)
  (setq ndiary-upload-command-option nil)
  ;; nDiary の日記を一覧表示するために
  (require 'schedule "nikki" nil t)
  ;; 日記ファイルのあるディレクトリ
  (setq schedule-dir "~/ndiary/log")
  ; (schedule)
  )
