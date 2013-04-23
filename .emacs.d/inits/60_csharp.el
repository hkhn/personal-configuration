;; -*- coding:utf-8 -*-
;* C#
(when (locate-library "csharp-mode")
  (require 'csharp-mode)
  (setq auto-mode-alist (cons '("\\.cs$" . csharp-mode) auto-mode-alist))
  (autoload 'csharp-mode "csharp" "Major mode for editing C# code" t)
  (add-hook 'csharp-mode-hook
            '(lambda ()
               ;; 見た目を Visual Studio に揃える
               (setq c-basic-offset 4)))
  ;; (defun csharp-exec-buffer-file ()
  ;;   "Execute compiled exe from current buffer file"
  ;;   (interactive)
  ;;   (shell-command (file-name-sans-extension (file-name-nondirectory buffer-file-name))))
  ;; (add-hook 'csharp-mode-hook
  ;;           '(lambda ()
  ;;              (setq compile-command (concat "csc " (file-name-nondirectory buffer-file-name)))
  ;;              (local-set-key "\C-cc" 'compile)
  ;;              (local-set-key "\C-ce" 'csharp-exec-buffer-file)
  ;;              ;; flymake を使用 (csc.exe が参照できる必要)
  ;;              (flymake-mode)))
  )
