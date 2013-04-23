(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.text" . markdown-mode) auto-mode-alist))

(when (locate-library "simplenote")
  (setq simplenote-notes-mode 'markdown-mode))
