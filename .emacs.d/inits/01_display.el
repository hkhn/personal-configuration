;; -*- coding:utf-8 -*-
;- 2007/10/01
;* startup のメッセージを表示しない
;* do not display startup message
(setq inhibit-startup-message t)

;- 2008/04/18
;- 2011/01/16

;; メニューバー非表示
;; hide menu bar
(menu-bar-mode 0)

(cond (window-system
       ;; ツールバー非表示
       ;; hide tool bar
       (tool-bar-mode 0)
       ;; スクロールバー非表示
       ;; hide scroll bar
       (set-scroll-bar-mode nil)
       ))

;- 2007/10/01
;* mark した領域に色を付ける
;* color marked region
(setq transient-mark-mode t)
;* 括弧を強調表示する
;* emphasize parenthetical region
(show-paren-mode t)
;* 行番号を表示する
;* display line-number
(line-number-mode t)
;* 列番号を表示する
;* display column-number
(column-number-mode t)

;- 2007/11/13
;* 文字の折り返しをしない
;* do not wrap line
;(setq-default truncate-lines t)

;; 無駄な空行に気付きやすくする
;; indicate meaningless empty lines
(setq-default indicate-empty-lines t)

;- 2008/11/21
;; 時刻の表示
;; display time
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(setq display-time-string-forms
      '((if display-time-day-and-date
            (format "%s/%s/%s " year month day)
          "")
        (format "%s:%s%s"
                (if display-time-24hr-format 24-hours 12-hours)
                minutes
                (if display-time-24hr-format "" am-pm))))
(display-time-mode t)
