;- 2009/09/26
;; http://www.sodan.org/~knagano/emacs/dotemacs.html
;* 失敗してもエラーにならない関数・マクロ群の定義
(defmacro exec-if-bound (sexplist)
  "関数が存在する時だけ実行する。（car の fboundp を調べるだけ）"
  `(if (fboundp (car ',sexplist))
       ,sexplist))
;; (defmacro defun-add-hook (hookname &rest sexplist)
;;   "add-hook のエイリアス。引数を関数にパックして hook に追加する。"
;;   `(add-hook ,hookname
;;              (function (lambda () ,@sexplist))))
(defun load-safe (loadlib)
  "安全な load。読み込みに失敗してもそこで止まらない。"
  ;; missing-ok で読んでみて、ダメならこっそり message でも出しておく
  (let ((load-status (load loadlib t)))
    (or load-status
        (message (format "[load-safe] failed %s" loadlib)))
    load-status))
(defmacro eval-safe (&rest body)
  "安全な評価。評価に失敗してもそこで止まらない。"
  `(condition-case err
       (progn ,@body)
     (error (message "[eval-safe] %s" err))))
(defun autoload-if-found (function file &optional docstring interactive type)
  "set autoload iff. FILE has found."
  (and (locate-library file)
       (autoload function file docstring interactive type)))

;- 2007/11/16
;- 2009/06/19
;- 2009/08/30
;- 2010/09/25
;* load-path
(let* ((dir (expand-file-name "~/local/share/emacs/site-lisp"))
       (default-directory dir))
  (when (file-exists-p dir)
    (setq load-path (cons dir load-path))
    (load-safe "subdirs.el")))
;; (cond (is-windows
;;        (let* ((dir (expand-file-name "c:/usr/local/share/emacs/site-lisp"))
;;               (default-directory dir))
;;          (setq load-path (cons dir load-path))
;;          (load-safe "subdirs.el"))))

;- 2012/09/20
;* init-loader
(require 'init-loader)
(setq-default init-loader-show-log-after-init nil)
(init-loader-load) ;; ~/.emacs.d/inits

;; ==== inits のナンバリング ====
;; 00_macro: 初期化時に利用する関数定義
;; 01_*: 各種環境
;; 01_util: interactiveの関数定義
;; 10_*: 入力に関わることなど
;; 20_*: 見栄え
;; 30_*: 標準モジュール
;; 50_*: 外部モジュール
;; 60_*: 各種言語
