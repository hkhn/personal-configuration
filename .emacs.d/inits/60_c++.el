;; -*- coding:utf-8 -*-
;* C++
(when (fboundp 'flymake-mode)
  (defun flymake-cc-init ()
    (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))
           (local-file  (file-relative-name
                         temp-file
                         (file-name-directory buffer-file-name))))
      (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))
  (push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)
  (push '("\\.c\\+\\+$" flymake-cc-init) flymake-allowed-file-name-masks)
  (cond (is-unix
         (add-hook 'c++-mode-hook
                   '(lambda ()
                      (flymake-mode t))))))
