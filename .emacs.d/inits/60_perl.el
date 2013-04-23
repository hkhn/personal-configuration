;; -*- coding:utf-8 -*-
;* Perl
(autoload 'cperl-mode "cperl-mode" "alternate mode for editing Perl programs" t)
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))
;- 2008/04/09
;* perl-mode の代わりに cperl-mode を起動させる
;; (setq auto-mode-alist
;;       (append '(("\\.\\([pP][Plm]\\|al\\|cgi\\|t\\)$" . cperl-mode)) auto-mode-alist))
;; (setq interpreter-mode-alist (append interpreter-mode-alist
;;                                      '(("miniperl" . cperl-mode))))
;; ;; cperl-mode が上手く autoload できないので仕方なく
;; ;; この設定では perl-mode が使用できないことに注意する
;; (defalias 'perl-mode 'cperl-mode)

;; http://d.hatena.ne.jp/hilde/20070515
(add-hook 'cperl-mode-hook
          (lambda ()
            ;; 括弧の自動補完
;            (setq cperl-hairy t)
            ;; インデント
            (setq cperl-indent-level 4)
;            (setq cperl-comment-column 40)
;            (setq cperl-brace-imaginary-offset 0)
;            (setq cperl-brace-offset 0)
;            (setq cperl-label-offset -2)
;            (setq cperl-min-label-indent 1)
            (setq cperl-continued-statement-offset 4)
            (setq cperl-continued-brace-offset -4)
            (setq cperl-close-paren-offset -4)
;            (setq cperl-indent-wrt-brace t)
            (setq cperl-indent-parens-as-block t)
            ;; set face
            (set-face-bold-p 'cperl-array-face nil)
            (set-face-background 'cperl-array-face "black")
            (set-face-bold-p 'cperl-hash-face nil)
            (set-face-italic-p 'cperl-hash-face nil)
            (set-face-background 'cperl-hash-face "black")
            ;; use \C-h as globally set
            (local-unset-key "\C-h")
            ;; use perlplus
            (when (locate-library "perlplus")
              (require 'perlplus)
              (local-set-key "\M-o" 'perlplus-complete-symbol)
              (perlplus-setup))
            ))

(when (fboundp 'flymake-mode)
  (defun flymake-perl-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "perl" (list "-wc" local-file))))
  (push '("\\(\\.pl$\\|\\.pm$\\)" flymake-perl-init) flymake-allowed-file-name-masks)
  (add-hook 'perl-mode-hook
            '(lambda ()
               (flymake-mode)))
  (add-hook 'cperl-mode-hook
            '(lambda ()
               (flymake-mode))))


;; for Template::Toolkit syntax
(setq auto-mode-alist
      (append '(("\\.tt$\\|\\.tmpl$" . tt-mode)) auto-mode-alist))
(autoload 'tt-mode "tt-mode" "Mode for editing Template." t)
