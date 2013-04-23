;; -*- coding:utf-8 -*-
;* Python

;; reload local python-mode because default 'python-mode' may have some errors
(load-safe "python-mode")

;; see:
;;   http://d.hatena.ne.jp/mowamowa/20071217/1197865281
;;   http://stackoverflow.com/questions/2681203/flymake-and-python-execute-region
; You must prepare epylint by hand
; See also http://www.emacswiki.org/cgi-bin/wiki/PythonMode
;; (defun flymake-pylint-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                      'flymake-create-temp-inplace))
;;          (local-file (file-relative-name
;;                       temp-file
;;                       (file-name-directory buffer-file-name))))
;;     (list "epylint" (list local-file))))
;; (push '("\\.py\\'" flymake-pylint-init) flymake-allowed-file-name-masks)

;; ;; use pyflakes instead of pylint
;; ;; see: http://stackoverflow.com/questions/1259873/how-can-i-use-emacs-flymake-mode-for-python-with-pyflakes-and-pylint-checking-cod
;; (when (fboundp 'flymake-mode)
;;   (defun flymake-pyflakes-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "pyflakes" (list local-file))))
;;   (push '("\\.py\\'" flymake-pyflakes-init) flymake-allowed-file-name-masks)
;;   (add-hook 'python-mode-hook
;;             '(lambda ()
;;                (flymake-mode t))))
