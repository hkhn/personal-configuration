;; -*- coding:utf-8 -*-
;; TeX
(when (fboundp 'flymake-mode)
  (defun flymake-tex-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
;;     (list "platex" (list "-file-line-error" "-interaction=nonstopmode" local-file))))
;;     (list "chktex" (list "-g0" "-r" "-l" (expand-file-name "~/.chktexrc") "-I1" "-q" "-v0" local-file))))
      (list "flycheck_tex" (list local-file))))
  (push '("\\.tex$" flymake-tex-init) flymake-allowed-file-name-masks)
;; (add-hook 'tex-mode-hook
;;           '(lambda ()
;;              (flymake-mode)))
  )
;; TeX を編集する際には flyspell-mode になるようにする
(add-hook 'tex-mode-hook
          '(lambda ()
             (flyspell-mode)))
(add-hook 'TeX-mode-hook
          '(lambda ()
             (flyspell-mode)))
;; BibTeX を編集する際には flyspell-mode になるようにする
(add-hook 'bibtex-mode-hook
          '(lambda ()
             (flyspell-mode)))

;; YaTeX-mode
;; http://oku.edu.mie-u.ac.jp/~okumura/texwiki/?YaTeX
;; (setq auto-mode-alist (cons (cons "\\.tex$\\|\\.ins$" 'yatex-mode) auto-mode-alist))
;; (autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
;; YaTeX 用コマンド設定
(setq tex-command "platex --kanji=utf8"
      dvi2-command "dviout"
;;      dviprint-command-format "dvipdfmx -f msembed.map -f dlbase14.map %s"
      dviprint-command-format "dvipdfmx %s"
      bibtex-command "pbibtex --kanji=utf8"
      makeindex-command "mendex")
;; UTF-8 を使う
(setq YaTeX-kanji-code 4)
;; 新規作成時に自動挿入するテンプレートファイル
(setq YaTeX-template-file "~/.templates/template.tex")

;; YaTeX-typeset-buffer などのため
;;; あんまりうまくいかないので make を導入すべき
(when (locate-library "yatexprc")
  (require 'yatexprc)
  ;; YaTeX 用のキーマッピング
  (defun my-YaTeX-compile ()
    (interactive)
    ;; デフォルト設定で typeset (tex のコンパイル)
    (YaTeX-typeset-buffer)
    ;; プリントアウト
    (YaTeX-lpr 1)))
;; (defun my-YaTeX-compile-command ()
;;   (interactive)
;;   (let* ((target-filename
;;           (file-name-nondirectory buffer-file-name))
;;          (target-filebase
;;           (file-name-sans-extension target-filename)))
;;     (format (format "%s %s && %s" tex-command target-filename dviprint-command-format) (concat target-filebase ".dvi"))))
;; (defun my-YaTeX-compile ()
;;   (interactive)
;;   (call-process (my-YaTeX-compile-command)))

;; 不要なファイルを削除 (.aux など)
(defun do-very-clean-tex ()
  (interactive)
  (dired default-directory)
  (dired-very-clean-tex)
  (dired-do-flagged-delete)
  (kill-buffer))
(defun my-YaTeX-clean ()
  (interactive)
  (do-very-clean-tex))

(add-hook 'yatex-mode-hook
          '(lambda ()
             (local-set-key "\C-c\C-c" 'my-YaTeX-compile)
             (local-set-key "\C-c\C-k" 'my-YaTeX-clean)))

;; Windows の場合，生成した PDF を開くための関数を定義する
(cond (is-windows
       (defun my-YaTeX-open-pdf ()
         (interactive)
         (let* ((target-filedir
                 (file-name-directory buffer-file-name))
                (target-filename
                 (file-name-nondirectory buffer-file-name))
                (target-filebase
                 (file-name-sans-extension target-filename))
                (target-pdffile
                 (expand-file-name (concat target-filebase ".pdf") target-filedir)))
           (w32-shell-execute "open" target-pdffile)
           (message "win-started %s" target-pdffile)))
       (add-hook 'yatex-mode-hook
                 '(lambda ()
                    (local-set-key "\C-c\C-o" 'my-YaTeX-open-pdf)))))

;; tex-mode に似せるための設定
(add-hook 'yatex-mode-hook
          '(lambda ()
             (local-set-key "\C-c\C-e" 'YaTeX-end-environment)))

;; YaTeX を使う場合には flyspell-mode になるようにする
(add-hook 'yatex-mode-hook
          '(lambda ()
             (flyspell-mode)))
