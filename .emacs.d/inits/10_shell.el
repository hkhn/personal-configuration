;; -*- coding:utf-8 -*-
;- 2007/09/30
;* bash を使用するために
;; http://www.bookshelf.jp/soft/meadow_9.html#SEC48
(cond (is-meadow
       ;; Cygwin のインストールが前提
       (setq explicit-shell-file-name "bash.exe")
       (setq shell-file-name "sh.exe")
       (setq shell-command-switch "-c")
       ;; (modify-coding-system-alist 'process ".*sh\\.exe" '(undecided-dos . euc-japan))
       ))

;; argument-editing の設定
(cond (is-meadow
       (require 'mw32script)
       (mw32script-init)
       (setq exec-suffix-list '(".exe" ".sh" ".pl" ".py"))
       (setq shell-file-name-chars "~/A-Za-z0-9_^$!#%&{}@`'.:()-")))

;- 2007/11/23
;* shell を使う際のエスケープシーケンスの処理
;; http://www.namazu.org/~tsuchiya/elisp/
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
  "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
