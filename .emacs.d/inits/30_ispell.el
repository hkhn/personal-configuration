;; -*- coding:utf-8 -*-
;- 2008/01/23

;* スペルチェックをする
;; ispell がうまく動かないので、とりあえず aspell を使う
(setq-default ispell-program-name "aspell")
;* スペル補完用
;; M-x ispell-complete-word
(setq ispell-grep-command "grep")
(setq ispell-alternate-dictionary "~/local/share/dict/words")
(cond ((and is-windows (not is-meadow))
       ;; Unix 形式のパスが対応外なので，DOS 形式に変換
       ;; 実際には grep 次第 (grep の対応形式に依存)
       ;; 例えば Cygwin 付属の grep なら必要ないと思われる
       ;; (実行してみてエラーが出るかどうかをチェックすべき？)
       (setq ispell-alternate-dictionary (unix-to-dos-filename (expand-file-name ispell-alternate-dictionary)))))
;* 日本語を無視
(eval-after-load "ispell"
  '(setq ispell-skip-region-alist (cons '("[^\000-\377]")
                                        ispell-skip-region-alist)))
;* 英単語補完を <C-.> で可能にする
(global-set-key (kbd "C-.") 'ispell-complete-word)
