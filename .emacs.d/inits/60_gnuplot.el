;; -*- coding:utf-8 -*-
;* GNUPLOT

(when (locate-library "gnuplot")
  (require 'gnuplot)
  (setq auto-mode-alist (cons '("\\.gp$" . gnuplot-mode) auto-mode-alist))
  (autoload 'gnuplot-mode "gnuplot" "Major mode for editing GNUPLOT code" t)
  )
