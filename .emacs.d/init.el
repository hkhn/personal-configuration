;; -*- coding:utf-8 -*-

(defvar is-unix
  (or (equal system-type 'gnu/linux)
      (equal system-type 'usg-unix-v)))
(defvar is-windows
  (and (null is-unix)
       (or (equal system-type 'windows-nt)
           (equal system-type 'ms-dos))))
(defvar is-mac
  (equal system-type 'darwin))
(defvar is-meadow (featurep 'meadow))
(defvar is-xemacs (featurep 'xemacs))
(defvar is-xemacs-no-mule
  (and is-xemacs (not (featurep 'mule))))
(defvar is-meadow1
  (and is-meadow
       (null is-xemacs)
       (equal emacs-major-version 20)))
(defvar is-meadow2
  (and is-meadow
       (null is-xemacs)
       (equal emacs-major-version 21)))
(defvar is-meadow3
  (and is-meadow
       (null is-xemacs)
       (equal emacs-major-version 22)))
(cond ((not is-meadow)
       (defun unix-to-dos-filename (filename)
         (concat (mapcar '(lambda (x) (if (= x ?/) ?\\ x)) (string-to-list filename))))
       (defun dos-to-unix-filename (filename)
         (concat (mapcar '(lambda (x) (if (= x ?\\) ?/ x)) (string-to-list filename))))))

;* load-path
(let* ((dir (expand-file-name "~/.emacs.d/site-lisp"))
       (default-directory dir))
  (when (file-exists-p dir)
    (setq load-path (cons dir load-path))
    (load "subdirs.el")))

;* package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
;; recommended packages
;;; auto-complete
;;; color-theme
;;; yasnippet
;;; js2-mode

;* change backup file directory
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
            backup-directory-alist))
;* backup several versions
(setq version-control t)
(setq kept-new-versions 5)
(setq kept-old-versions 5)
;* delete older versions without confirmation
(setq delete-old-versions t)
;* create backup files for version controled files
(setq vc-make-backup-files t)

;* do not display startup message
(setq inhibit-startup-message t)

;; hide menu bar
(menu-bar-mode 0)
;; hide tool bar
(tool-bar-mode 0)
;; hide scroll bar
(set-scroll-bar-mode nil)

;* color marked region
(setq transient-mark-mode t)
;* emphasize parenthetical region
(show-paren-mode t)
;* display line-number
(line-number-mode t)
;* display column-number
(column-number-mode t)

;* do not wrap line
;(setq-default truncate-lines t)

;; indicate meaningless empty lines
(setq-default indicate-empty-lines t)

;; display time
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(setq display-time-string-forms
      '((if display-time-day-and-date
            (format "%s/%s/%s " year month day)
          "")
        (format "%s:%s%s"
                (if display-time-24hr-format 24-hours 12-hours)
                minutes
                (if display-time-24hr-format "" am-pm))))
(display-time-mode t)

;* for Japanese
(set-language-environment "Japanese")

;; ;* use HOME as the default current directory
;; (cd "~/")

(if window-system
    (mouse-avoidance-mode 'exile))

;* server mode
(when (locate-library "server")
  (require 'server)
  (if (fboundp 'server-running-p)
      (unless (server-running-p)
        (server-start))))

;* close all buffers
;; http://epian-wiki.appspot.com/wiki/Memo/20100327033507/Emacs:全てのバッファを閉じる(close-all-buffers)
(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
;* revert all file buffers
;; http://hisashim.org/2009/09/21/my-revert-all-file-buffers.html
(defun revert-all-file-buffers ()
  "Revert all visited buffers."
  (interactive)
  (dolist (buf (buffer-list))
    (if (not (buffer-file-name buf))
        (message (concat (buffer-name buf) " skipped."))
      (save-excursion
        (set-buffer buf)
        (cond ((string-match "Emacs" (emacs-version))
               (revert-buffer t t))
              ((string-match "xyzzy" (emacs-version))
               (revert-buffer))
              (else (error (emacs-version))))
        (message (concat (buffer-name buf) " reverted."))))))
;* replace white lines
(defun replace-white-lines ()
  "Replace lines of only spaces with empty lines."
  (interactive)
  (replace-regexp "^[ \t]+$" ""))
;* toggle fullscreen
(defun toggle-fullscreen ()
  (interactive)
  (if (frame-parameter nil 'fullscreen)
      (set-frame-parameter nil 'fullscreen nil)
    (set-frame-parameter nil 'fullscreen 'fullboth)))
(cond (window-system
       (global-set-key [(meta return)] 'toggle-fullscreen)))
;* insert timestamp
(defun insert-timestamp ()
  (interactive)
  (insert (format-time-string "%Y/%m/%d %H:%M:%S")))

(cond (is-windows
       (set-default-coding-systems 'utf-8)
       (set-keyboard-coding-system 'sjis)
       (set-terminal-coding-system 'sjis)
       (setq file-name-coding-system 'sjis)
       (set-clipboard-coding-system 'sjis-dos)
       (set-w32-system-coding-system 'sjis-dos)
;       (set-buffer-file-coding-system 'utf-8-unix)
       (prefer-coding-system 'utf-8))
      (is-mac
       (set-default-coding-systems 'utf-8-unix)
       (set-terminal-coding-system 'utf-8-unix)
       (set-keyboard-coding-system 'utf-8-unix)
       (set-buffer-file-coding-system 'utf-8-unix))
      (is-unix
       (set-default-coding-systems 'utf-8-unix)
       (set-terminal-coding-system 'utf-8-unix)
;       (setq file-name-coding-system 'utf-8)
;       (set-clipboard-coding-system 'utf-8)
;       (setq coding-system-for-read 'mule-utf-8-unix)
       (prefer-coding-system 'utf-8)
       (set-keyboard-coding-system 'utf-8-unix)
       (set-buffer-file-coding-system 'utf-8-unix)))

;* use space for indent
;; if you want to use [TAB], press "\C-q [TAB]"
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
;; scroll by one line
(setq scroll-conservatively 1)
;* save a script starting "#!" as an executable one
(defun make-file-executable ()
  "Make the file of this buffer executable, when it is a script source."
  (save-restriction
    (widen)
    (if (string= "#!" (buffer-substring-no-properties 1 (min 3 (point-max))))
        (let ((name (buffer-file-name)))
          (or (equal ?. (string-to-char (file-name-nondirectory name)))
              (let ((mode (file-modes name)))
                (set-file-modes name (logior mode (logand (/ mode 4) 73)))
                (message (concat "Wrote " name " (+x)"))))))))
(add-hook 'after-save-hook 'make-file-executable)

;* use \C-h for [BS]
(global-set-key "\C-h" 'delete-backward-char)
;* when used on GUI, \C-z is disabled
(cond (window-system
       (global-unset-key "\C-z")))
;* inhibit recenter-top-bottom
(global-set-key "\C-l" 'recenter)
;* Cocoa Emacs での Meta キーを Command に変更 (デフォルトは Option)
(cond (is-mac
       (setq ns-command-modifier (quote meta))
       (setq ns-alternate-modifier (quote super))))
;* insert timestamp
(define-key global-map [f5]
  '(lambda ()
     (interactive)
     (insert-timestamp)))
;; http://www.namazu.org/~tsuchiya/elisp/
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
  "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;* syntax highlight
(global-font-lock-mode t)
;; color white spaces
;;(defface my-face-r '((t (:background "gray15"))) nil)
(defface my-face-zs '((t (:background "medium aquamarine"))) nil)
(defface my-face-t '((t (:background "gray26"))) nil)
(defface my-face-es '((t (:foreground "SteelBlue" :underline t))) nil)
;;(defvar my-face-r 'my-face-r)
(defvar my-face-zs 'my-face-zs)
(defvar my-face-t 'my-face-t)
(defvar my-face-es 'my-face-es)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(
     ("　" 0 my-face-zs append)
     ("\t" 0 my-face-t append)
     ("[ \t]+$" 0 my-face-es append)
;;     ("[\r]*\n" 0 my-face-r append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(add-hook 'find-file-hooks '(lambda ()
                              (if font-lock-mode
                                  nil
                                (font-lock-mode t))) t)

;* keep highlight in another buffer
(setq highlight-nonselected-windows t)

;* line highlight
;(global-hl-line-mode)
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "blue" :foreground "white"))
    (((class color)
      (background light))
     (:background "ForestGreen"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
;(setq hl-line-face 'underline)

;* dired
(setq ls-lisp-dirs-first t)
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
(defadvice dired-find-file
  (before kill-dired-buffer activate)
  (setq my-dired-before-buffer (current-buffer)))
(defadvice dired-find-file
  (after kill-dired-buffer-after activate)
  (if (eq major-mode 'dired-mode)
      (kill-buffer my-dired-before-buffer)))

;* use color-theme
(when (locate-library "color-theme")
  (require 'color-theme)
  (color-theme-initialize)
  ;;(color-theme-arjen)
  ;;(color-theme-comidia)
  (color-theme-clarity)
  )

(when (locate-library "dired-x")
  (require 'dired-x))
(when (locate-library "wdired")
  (require 'wdired)
  (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode))

(when (locate-library "sorter")
  (add-hook 'dired-load-hook
            (lambda ()
              (autoload 'sorter))))

;; use partial path for the same buffer name
(when (locate-library "uniquify")
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets))

;* display line number on the left side
(when (locate-library "wb-line-number")
  (require 'wb-line-number)
  ; (wb-line-number-toggle)
  (setq wb-line-number-scroll-bar t))

;; ;* yasnippet
;; (when (locate-library "yasnippet")
;;   (require 'yasnippet) ;; not yasnippet-bundle
;;   (yas/initialize)
;;   (yas/load-directory "~/.emacs.d/site-lisp/yasnippet-0.6.1c/snippets"))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(standard-indent 2))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
