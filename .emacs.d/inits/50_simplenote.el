;; -*- coding:utf-8 -*-
;* simplenote
(when (locate-library "simplenote")
  (require 'simplenote)
  (setq simplenote-email (shell-command-to-string "~/my/bin/pitget.pl simplenote email"))
  (setq simplenote-password (shell-command-to-string "~/my/bin/pitget.pl simplenote password"))
  (simplenote-setup)
  (global-set-key "\C-csb" 'simplenote-browse)

  ;; ;; https://gist.github.com/458545
  ;; (add-hook 'before-save-hook
  ;;           (lambda()
  ;;             (when (equal (buffer-name) "*Simplenote*")
  ;;               (simplenote-sync-notes)
  ;;               (simplenote-browser-refresh))
  ;;             ;; (when (equal (buffer-name) " *hoge*")
  ;;             ;; ...)
  ;;             ))

  ;; ;; http://blog.on-net.jp/tf/2011/01/emacssimplenote-mode.html
  ;; (defun simplenote-sync-after-save ()
  ;;   "If there is the buffer on simplenote-directory, sync the buffer to simplenote."
  ;;   (interactive)
  ;;   (when (string-match simplenote-directory default-directory)
  ;;     (simplenote-sync-notes)
  ;;     ;; only when create new note.
  ;;     (let (simplenote-new-note-dir)
  ;;       (setq simplenote-new-note-dir (concat (file-name-as-directory simplenote-directory) "new"))
  ;;       (when (string-match simplenote-new-note-dir default-directory)
  ;;         (kill-buffer (get-buffer (current-buffer)))
  ;;         (simplenote-browse)))
  ;;     ))
  ;; (add-hook 'after-save-hook 'simplenote-sync-after-save)
  )
