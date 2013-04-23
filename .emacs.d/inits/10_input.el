;; -*- coding:utf-8 -*-
;- 2007/09/30
;- 2010/09/25
;* 日本語環境
;* for Japanese
(cond (is-unix
       (setq default-input-method "japanese"))
      (is-meadow
       (setq default-input-method "MW32-IME"))
      ((and is-windows (not is-meadow))
       (setq default-input-method "W32-IME")))

;- 2009/08/30
;; IME 使用時に色を付ける
(cond (is-meadow
       (add-hook 'mw32-ime-on-hook
                 (lambda () (set-cursor-color "red")))
       (add-hook 'mw32-ime-off-hook
                 (lambda () (set-cursor-color "black")))
       (add-hook 'minibuffer-setup-hook
                 (lambda ()
                   (if (fep-get-mode)
                       (set-cursor-color "red")
                     (set-cursor-color "black"))))))
