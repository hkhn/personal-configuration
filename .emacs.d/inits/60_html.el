;; -*- coding:utf-8 -*-
;* HTML
(autoload 'html-helper-mode "html-helper-mode" "HTML helper mode." t)
(setq auto-mode-alist
      (append '(("\\.html$" . html-helper-mode)) auto-mode-alist))
;; change time stamp format
(add-hook 'html-helper-timestamp-hook
          (lambda ()
            (insert "Last modified: "
                    (format-time-string "%04Y/%02m/%02d %T\n"))))

;; for Template::Toolkit syntax in HTML
(setq auto-mode-alist
      (append '(("\\.tmpl$" . html-helper-mode)) auto-mode-alist))
(add-hook 'html-helper-mode-hook
          (lambda ()
            ;; for Template::Toolkit
            (when (locate-library "html-tt")
              (require 'html-tt)
              (html-tt-load-hook)
              (make-face 'tt-sequence-face)
              (set-face-foreground 'tt-sequence-face "pink")
              ; (set-face-background 'tt-sequence-face "black")
              (setq html-tt-sequence-face 'tt-sequence-face)
              ; (setq html-tt-sequence-face 'underline)
              )))
