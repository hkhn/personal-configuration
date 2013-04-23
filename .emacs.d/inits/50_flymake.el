;; -*- coding:utf-8 -*-
;- 2009/08/25
;* use flymake-mode
;; http://d.hatena.ne.jp/suztomo/20080905/1220633281
;; http://d.hatena.ne.jp/sun-basix/20080705/1215278204
;; http://d.hatena.ne.jp/syou6162/20081011/1223671733
(when (locate-library "flymake")
  (require 'flymake)

  ;; display syntax error in the minibuffer (no X)
  (defun flymake-display-err-minibuf ()
    "Displays the error/warning for the current line in the minibuffer"
    (interactive)
    (let* ((line-no             (flymake-current-line-no))
           (line-err-info-list  (nth 0 (flymake-find-err-info flymake-err-info line-no)))
           (count               (length line-err-info-list))
           )
      (while (> count 0)
        (when line-err-info-list
          (let* ((file       (flymake-ler-file (nth (1- count) line-err-info-list)))
                 (full-file  (flymake-ler-full-file (nth (1- count) line-err-info-list)))
                 (text (flymake-ler-text (nth (1- count) line-err-info-list)))
                 (line       (flymake-ler-line (nth (1- count) line-err-info-list))))
            (message "[%s] %s" line text)
            )
          )
        (setq count (1- count)))))
  (global-set-key "\C-cd" 'flymake-display-err-minibuf)

;;   ;; https://gist.github.com/292827
;;   ;; flymake 現在行のエラーをpopup.elのツールチップで表示する
;;   (defun flymake-display-err-menu-for-current-line ()
;;     (interactive)
;;     (let* ((line-no (flymake-current-line-no))
;;            (line-err-info-list
;;             (nth 0 (flymake-find-err-info flymake-err-info line-no))))
;;       (when line-err-info-list
;;         (let* ((count (length line-err-info-list))
;;                (menu-item-text nil))
;;           (while (> count 0)
;;             (setq menu-item-text
;;                   (flymake-ler-text (nth (1- count) line-err-info-list)))
;;             (let* ((file
;;                     (flymake-ler-file (nth (1- count) line-err-info-list)))
;;                    (line
;;                     (flymake-ler-line (nth (1- count) line-err-info-list))))
;;               (if file
;;                   (setq menu-item-text
;;                         (concat menu-item-text " - " file "(" (format "%d" line) ")"))))
;;             (setq count (1- count))
;;             (if (> count 0)
;;                 (setq menu-item-text (concat menu-item-text "\n"))))
;;           (popup-tip menu-item-text)))))

  ;; change color
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(flymake-errline ((t (:background "dark red"))))
   '(flymake-warnline ((t (:background "gray20"))))))
