;; -*- coding:utf-8 -*-
;* JavaScript
;; (autoload 'js2-mode "js2" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;(autoload 'js-mode "js" nil t)
;(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))

(when (fboundp 'flymake-mode)
  (defun flymake-javascript-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "jsl" (list "-process" local-file))))
  (push '("\\.js$" flymake-javascript-init) flymake-allowed-file-name-masks)

  (add-hook 'js-mode-hook
            '(lambda ()
               (flymake-mode))))
