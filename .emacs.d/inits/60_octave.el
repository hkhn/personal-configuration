;; -*- coding:utf-8 -*-
;* Octave
(when (locate-library "octave-mod")
  (autoload 'octave-mode "octave-mod" nil t)
  (setq auto-mode-alist
        (cons '("\\.m$" . octave-mode) auto-mode-alist))
  (add-hook 'octave-mode-hook
            (lambda ()
              (setq octave-block-offset 4)
              (abbrev-mode 1)
              (auto-fill-mode 1)
              (if (eq window-system 'x)
                  (font-lock-mode 1)))))
