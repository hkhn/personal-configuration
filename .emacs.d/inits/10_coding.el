;; -*- coding:utf-8 -*-
(cond (is-windows
       (set-default-coding-systems 'utf-8)
       (set-keyboard-coding-system 'sjis)
       (set-terminal-coding-system 'sjis)
       (setq file-name-coding-system 'sjis)
       (set-clipboard-coding-system 'sjis-dos)
       (set-w32-system-coding-system 'sjis-dos)
;       (set-buffer-file-coding-system 'utf-8-unix)
       (prefer-coding-system 'utf-8))
      (is-mac
       (set-default-coding-systems 'utf-8-unix)
       (set-terminal-coding-system 'utf-8-unix)
       (set-keyboard-coding-system 'utf-8-unix)
       (set-buffer-file-coding-system 'utf-8-unix))
      (is-unix
       (set-default-coding-systems 'utf-8-unix)
       (set-terminal-coding-system 'utf-8-unix)
;       (setq file-name-coding-system 'utf-8)
;       (set-clipboard-coding-system 'utf-8)
;       (setq coding-system-for-read 'mule-utf-8-unix)
       (prefer-coding-system 'utf-8)
       (set-keyboard-coding-system 'utf-8-unix)
       (set-buffer-file-coding-system 'utf-8-unix)))
