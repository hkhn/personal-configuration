;; -*- coding:utf-8 -*-
;* Emacs Speaks Statistics (R, SAS, etc.)
(when (locate-library "ess-site")
  (setq auto-mode-alist
        (cons (cons "\\.r$" 'R-mode) auto-mode-alist))
  (autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t))
