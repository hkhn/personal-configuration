;; -*- coding:utf-8 -*-
;- 2009/08/30
;* OS の識別用変数
(defvar is-unix
  (or (equal system-type 'gnu/linux)
      (equal system-type 'usg-unix-v)))
(defvar is-windows
  (and (null is-unix)
       (or (equal system-type 'windows-nt)
           (equal system-type 'ms-dos))))
(defvar is-mac
  (equal system-type 'darwin))
(defvar is-meadow (featurep 'meadow))
(defvar is-xemacs (featurep 'xemacs))
(defvar is-xemacs-no-mule
  (and is-xemacs (not (featurep 'mule))))
(defvar is-meadow1
  (and is-meadow
       (null is-xemacs)
       (equal emacs-major-version 20)))
(defvar is-meadow2
  (and is-meadow
       (null is-xemacs)
       (equal emacs-major-version 21)))
(defvar is-meadow3
  (and is-meadow
       (null is-xemacs)
       (equal emacs-major-version 22)))

;- 2010/09/25
;* ファイルパスに関して，DOS 形式と Unix 形式を相互変換
;; / と \ の相互変換をしているだけなので不完全 (ドライブレターとか？)
(cond ((not is-meadow)
       (defun unix-to-dos-filename (filename)
         (concat (mapcar '(lambda (x) (if (= x ?/) ?\\ x)) (string-to-list filename))))
       (defun dos-to-unix-filename (filename)
         (concat (mapcar '(lambda (x) (if (= x ?\\) ?/ x)) (string-to-list filename))))))
