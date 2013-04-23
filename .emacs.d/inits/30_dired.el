;; -*- coding:utf-8 -*-
;- 2010/09/25
;* dired
;; http://www.bookshelf.jp/soft/meadow_25.html

;; ディレクトリを先に表示する
(setq ls-lisp-dirs-first t)

;; dired の並び換え方法を保存
(defadvice dired-advertised-find-file
  (around dired-sort activate)
  (let ((sw dired-actual-switches))
    ad-do-it
    (if (string= major-mode 'dired-mode)
        (progn
          (setq dired-actual-switches sw)
          (dired-sort-other dired-actual-switches)))
    ))

(defadvice dired-my-up-directory
  (around dired-sort activate)
  (let ((sw dired-actual-switches))
    ad-do-it
    (if (string= major-mode 'dired-mode)
        (progn
          (setq dired-actual-switches sw)
          (dired-sort-other dired-actual-switches)))
    ))

;; フォルダを開く時, 新しいバッファを作成しない
(defvar my-dired-before-buffer nil)
(defadvice dired-advertised-find-file
  (before kill-dired-buffer activate)
  (setq my-dired-before-buffer (current-buffer)))
(defadvice dired-advertised-find-file
  (after kill-dired-buffer-after activate)
  (if (eq major-mode 'dired-mode)
      (kill-buffer my-dired-before-buffer)))
(defadvice dired-up-directory
  (before kill-up-dired-buffer activate)
  (setq my-dired-before-buffer (current-buffer)))
(defadvice dired-up-directory
  (after kill-up-dired-buffer-after activate)
  (if (eq major-mode 'dired-mode)
      (kill-buffer my-dired-before-buffer)))

;; RET でフォルダを開いたときにも新しいバッファを作成しない
;;; 少なくとも NTEmacs では上記設定だけでは不十分だった
(defadvice dired-find-file
  (before kill-dired-buffer activate)
  (setq my-dired-before-buffer (current-buffer)))
(defadvice dired-find-file
  (after kill-dired-buffer-after activate)
  (if (eq major-mode 'dired-mode)
      (kill-buffer my-dired-before-buffer)))

;; dired から関連付けられたソフトで開く
(cond (is-windows
       (defun uenox-dired-winstart ()
         "Type '\\[uenox-dired-winstart]': win-start the current line's file."
         (interactive)
         (if (eq major-mode 'dired-mode)
             (let ((fname (dired-get-filename)))
               (w32-shell-execute "open" fname)
               (message "win-started %s" fname))))
       ;; dired のキー割り当て追加
       (add-hook 'dired-mode-hook
                 (lambda ()
                   ;; 関連付け
                   (define-key dired-mode-map "z" 'uenox-dired-winstart)))))

;; http://cha.la.coocan.jp/doc/Diary2010.html#sec94
;; 自分で改造して関数にした
(cond (is-windows
       (cond (is-meadow
              (defun explorer (&optional dir)
                (interactive)
                (setq dir (expand-file-name (or dir default-directory)))
                (if (or (not (file-exists-p dir))
                        (and (file-exists-p dir)
                             (not (file-directory-p dir))))
                    (message "%s can't open." dir)
                  (setq dir (unix-to-dos-filename dir))
                  (let ((w32-start-process-show-window t))
                    (apply (function start-process)
                           "explorer" nil "explorer.exe" (list (concat "/e,/root," dir)))))))
             ((not is-meadow)
              (defun explorer (&optional dir)
                (interactive)
                (setq dir (expand-file-name (or dir default-directory)))
                (if (or (not (file-exists-p dir))
                        (and (file-exists-p dir)
                             (not (file-directory-p dir))))
                    (message "%s can't open." dir)
                  (let (now-process-name now-command-str now-command-opt-str)
                    (setq now-process-name "*explorer*")
                    (setq now-command-str "explorer.exe")
                    (setq now-command-opt-str (unix-to-dos-filename dir))
                    (start-process now-process-name nil now-command-str now-command-opt-str))))))
       ;; dired から explorer を開く
       (defun dired-exec-explorer ()
         "In dired, execute Explorer"
         (interactive)
         (explorer (dired-current-directory)))
       (add-hook 'dired-mode-hook
                 (lambda ()
                   (local-set-key "E" 'dired-exec-explorer)))))
