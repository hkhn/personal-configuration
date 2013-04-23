;; -*- coding:utf-8 -*-
;- 2007/10/31
;* color buffer
;; (custom-set-variables
;;  '(auto-compression-mode t nil (jka-compr))
;;  '(case-fold-search t)
;;  '(global-font-lock-mode t nil (font-lock)))
;; 予約語を色分け
(global-font-lock-mode t)

;- 2008/11/21
;; モードライン行の設定
;; set color of mode line
;(set-face-foreground 'modeline "black")
;(set-face-foreground 'modeline "white")
;(set-face-background 'modeline "lime green")
;(set-face-background 'modeline "black")
;; underline for modeline
;(set-face-underline-p 'modeline t)
;; use bold font for modeline
;(set-face-bold-p 'modeline t)

;- 2008/11/21
;; 全角／タブ／行末スペースに色をつける
;; color white spaces
;;(defface my-face-r '((t (:background "gray15"))) nil)
(defface my-face-zs '((t (:background "medium aquamarine"))) nil)
(defface my-face-t '((t (:background "gray26"))) nil)
(defface my-face-es '((t (:foreground "SteelBlue" :underline t))) nil)
;;(defvar my-face-r 'my-face-r)
(defvar my-face-zs 'my-face-zs)
(defvar my-face-t 'my-face-t)
(defvar my-face-es 'my-face-es)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(
     ("　" 0 my-face-zs append)
     ("\t" 0 my-face-t append)
     ("[ \t]+$" 0 my-face-es append)
;;     ("[\r]*\n" 0 my-face-r append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(add-hook 'find-file-hooks '(lambda ()
                              (if font-lock-mode
                                  nil
                                (font-lock-mode t))) t)
