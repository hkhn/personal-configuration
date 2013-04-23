;; -*- coding:utf-8 -*-
;* Java
(add-hook 'java-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
             (setq c-basic-offset 4)
             (when (locate-library "java-mode-indent-annotations")
               (autoload 'java-mode-indent-annotations)
               (java-mode-indent-annotations-setup))
             ))

;; (defun flymake-java-init ()
;;   (let* ((buffer-file (buffer-file-name))
;;          (local-file (file-relative-name
;;                       ;; use java file name itself (hoge_flymake.java causes conflict of file-name with class-name)
;;                       buffer-file
;;                       (file-name-directory buffer-file-name))))
;;     (list "javac" (list "-g" "-encoding" "UTF-8" local-file))))
;; (push '(".+\\.java$" flymake-java-init) flymake-allowed-file-name-masks)
;; (cond (is-unix
;;        (add-hook 'java-mode-hook
;;                  '(lambda ()
;;                     (flymake-mode)))))

;; see: http://www.greenwood.co.jp/~k-aki/diary/diary200902.xhtml
(defun search-file-for-updir(dir filename)
  (let ((filepath (expand-file-name filename dir)))
    (cond
     ((file-exists-p filepath) filepath)
     ((equal (expand-file-name "/") dir) nil)
     (t
      (search-file-for-updir (file-name-directory (directory-file-name dir)) filename)))))
(defun search-build-xml ()
  "Search directory path including build.xml"
  (search-file-for-updir default-directory "build.xml"))

(when (fboundp 'flymake-mode)
  (defun flymake-java-init ()
    (let* ((buildfile (search-build-xml)))
      (message buildfile)
      (list "env" (list "LC_ALL=en" "ant" "-buildfile" (search-build-xml)))))
  (push '(".+\\.java$" flymake-java-init) flymake-allowed-file-name-masks))

;; (add-hook 'java-mode-hook
;;           '(lambda ()
;;              (flymake-mode)))
