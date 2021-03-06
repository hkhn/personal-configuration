;; -*- coding:utf-8 -*-
;* C
(when (fboundp 'flymake-mode)
  (defun flymake-c-init ()
    (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))
           (local-file  (file-relative-name
                         temp-file
                         (file-name-directory buffer-file-name))))
      (list "gcc" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))
  (push '("\\.c$" flymake-c-init) flymake-allowed-file-name-masks)
  (cond (is-unix
         (add-hook 'c-mode-hook
                   '(lambda ()
                      (flymake-mode t))))))
