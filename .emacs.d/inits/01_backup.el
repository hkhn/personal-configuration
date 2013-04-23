;; -*- coding:utf-8 -*-
;- 2011/07/26
;- http://ubulog.blogspot.com/2008/10/emacs.html
;* change backup file directory
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
            backup-directory-alist))
;* backup several versions
(setq version-control t)
(setq kept-new-versions 5)
(setq kept-old-versions 5)
;* delete older versions without confirmation
(setq delete-old-versions t)
;* create backup files for version controled files
(setq vc-make-backup-files t)

