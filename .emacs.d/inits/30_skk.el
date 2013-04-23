;; -*- coding:utf-8 -*-
;- 2007/09/30
;* SKK 辞書を使うために
;; http://www.bookshelf.jp/soft/meadow_21.html#SEC192
;; 変換時，改行でも確定
(setq skk-egg-like-newline t)

;; メッセージは日本語で
(setq skk-japanese-message-and-error t)

;;"「"を入力したら"」"も自動で挿入
(setq skk-auto-insert-paren t)

;;漢字登録のミスをチェックする
(setq skk-check-okurigana-on-touroku t)

;; 句読点は , . を使う
(setq skk-kuten-touten-alist
  '(
    (jp . ("。" . "、" ))
    (en . ("．" . "，"))
    ))
;; jp にすると「。、」を使います
(setq-default skk-kutouten-type 'en)

;; @で挿入する日付表示を半角に
(setq skk-number-style nil)

;; 変換候補をツールチップに表示
(setq skk-show-tooltip t)

;; 変換候補をインラインに表示
(setq skk-show-inline t)

;; isearch時にSKKをオフ
(setq skk-isearch-start-mode 'latin)

;; ．と。を動的に決定
(add-hook 'skk-mode-hook
          (lambda ()
            (save-excursion
              (goto-char 0)
              (make-local-variable 'skk-kutouten-type)
              (if (re-search-forward "．" 10000 t)
                  (setq skk-kutouten-type 'en)
                (setq skk-kutouten-type 'jp)))))

;; 10 分放置すると個人辞書が自動的に保存される設定
;; 自動保存設定：ここから
(defvar skk-auto-save-jisyo-interval 600)
(defun skk-auto-save-jisyo ()
  (skk-save-jisyo)
  ;; skk-bayesian.el を使っていなければ以下の 2 行はコメントアウト
  ;; (skk-bayesian-save-history)
  ;; (skk-bayesian-corpus-save)
  )
(run-with-idle-timer skk-auto-save-jisyo-interval
                     skk-auto-save-jisyo-interval
                     'skk-auto-save-jisyo)
;; (cancel-function-timers 'skk-auto-save-jisyo)
;; 自動保存設定：ここまで

