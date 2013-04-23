;; -*- coding:utf-8 -*-
;- 2009/08/30
;; フォント

;; true type font
(cond (is-windows
       (setq w32-use-w32-font-dialog nil)
       (setq scalable-fonts-allowed t)
       (setq w32-enable-synthesized-fonts t)))

(cond ((and is-windows is-meadow)
       ;; Meadow

       ;; フォント追加
       ;;;;;;;;;;;;;
       ;; < フォントの求め方 >
       ;; *scratch* で (w32-query-get-logfont) と記述し，
       ;; その行末にカーソルを移動して C-j を実行
       ;;;;;;;;;;;;;
       ;; メイリオ-Consolas
       (w32-add-font
        "Meiryo-Consolas"
        '((spec
           ((:char-spec ascii :height any)
            strict
            (w32-logfont "Consolas" 0 -17 400 0 nil nil nil 0 1 3 0))
           ((:char-spec ascii :height any :weight bold)
            strict
            (w32-logfont "Consolas" 0 -17 700 0 nil nil nil 0 1 3 0))
           ((:char-spec ascii :height any :slant italic)
            strict
            (w32-logfont "Consolas" 0 -17 400 0 t nil nil 0 1 3 0))
           ((:char-spec ascii :height any :weight bold :slant italic)
            strict
            (w32-logfont "Consolas" 0 -17 700 0 t nil nil 0 1 3 0))
           ((:char-spec japanese-jisx0208 :height any)
            strict
            (w32-logfont "Meiryo" 0 -15 400 0 nil nil nil 128 1 3 49)
            ((spacing . 1)))
           ((:char-spec japanese-jisx0208 :height any :slant italic)
            strict
            (w32-logfont "Meiryo" 0 -15 400 0 t nil nil 128 1 3 49)
            ((spacing . 1)))
           ((:char-spec japanese-jisx0208 :height any :weight bold)
            strict
            (w32-logfont "Meiryo" 0 -15 700 0 nil nil nil 128 1 3 49)
            ((spacing . 1)))
           ((:char-spec japanese-jisx0208 :height any :weight bold :slant italic)
            strict
            (w32-logfont "Meiryo" 0 -15 700 0 t nil nil 128 1 3 49)
            ((spacing . 1)))
           ((:char-spec katakana-jisx0201 :height any)
            strict
            (w32-logfont "Meiryo" 0 -15 400 0 nil nil nil 128 1 3 49)
            ((spacing . 1)))
           ((:char-spec katakana-jisx0201 :height any :slant italic)
            strict
            (w32-logfont "Meiryo" 0 -15 400 0 t nil nil 128 1 3 49)
            ((spacing . 1)))
           ((:char-spec katakana-jisx0201 :height any :weight bold)
            strict
            (w32-logfont "Meiryo" 0 -15 700 0 nil nil nil 128 1 3 49)
            ((spacing . 1)))
           ((:char-spec katakana-jisx0201 :height any :weight bold :slant italic)
            strict
            (w32-logfont "Meiryo" 0 -15 700 0 t nil nil 128 1 3 49)
            ((spacing . 1)))
           )))
       (set-face-attribute 'variable-pitch nil :font "Meiryo-Consolas")

       ;; MSゴシック-Consolas
       (w32-add-font
        "MSGothic-Consolas"
        '((spec
           ((:char-spec ascii :height any)
            strict
            (w32-logfont "Consolas" 0 -17 400 0 nil nil nil 0 1 3 0))
           ((:char-spec ascii :height any :weight bold)
            strict
            (w32-logfont "Consolas" 0 -17 700 0 nil nil nil 0 1 3 0))
           ((:char-spec ascii :height any :slant italic)
            strict
            (w32-logfont "Consolas" 0 -17 400 0 t nil nil 0 1 3 0))
           ((:char-spec ascii :height any :weight bold :slant italic)
            strict
            (w32-logfont "Consolas" 0 -17 700 0 t nil nil 0 1 3 0))
           ((:char-spec japanese-jisx0208 :height any)
            strict
            (w32-logfont "MS ゴシック" 0 -15 400 0 nil nil nil 128 1 3 49)
            ((spacing . 1)))
           ((:char-spec japanese-jisx0208 :height any :slant italic)
            strict
            (w32-logfont "MS ゴシック" 0 -15 400 0 t nil nil 128 1 3 49)
            ((spacing . 1)))
           ((:char-spec japanese-jisx0208 :height any :weight bold)
            strict
            (w32-logfont "MS ゴシック" 0 -15 700 0 nil nil nil 128 1 3 49)
            ((spacing . 1)))
           ((:char-spec japanese-jisx0208 :height any :weight bold :slant italic)
            strict
            (w32-logfont "MS ゴシック" 0 -15 700 0 t nil nil 128 1 3 49)
            ((spacing . 1))))))
       (set-face-attribute 'variable-pitch nil :font "MSGothic-Consolas")

       ;; デフォルトフレームの設定
       (setq default-frame-alist
             (append '(
                       (foreground-color . "white")
                       (background-color . "black")
                       ;; 横幅の文字数
                       (width . 80)
                       ;; 縦幅の行数 (モードライン含む)
                       (height . 34)
                       (font . "Meiryo-Consolas")
;                       (font . "MSGothic-Consolas")
                       (alpha . 80)
                       )
                     default-frame-alist)))

      ((and is-windows (not is-meadow))
       ;; GNU Emacs

       ;; fontset を作る
       ;;; 作った fontset は M-x list-fontset RET で確認可能

       ;; roman font (fontset-13)
       ;; medium-r-normal
       (create-fontset-from-fontset-spec
        "-*-fixed-medium-r-normal--13-*-*-*-*-*-fontset-13,
        ascii:-*-Consolas-medium-r-normal--15-*-iso8859-1,
        japanese-jisx0208:-misc-メイリオ-medium-r-normal--13-*-jisx0208*,
        katakana-jisx0201:-misc-メイリオ-medium-r-normal--13-*-jisx0201*")
       ;; roman font (fontset-15)
       ;; medium-r-normal
       (create-fontset-from-fontset-spec
        "-*-fixed-medium-r-normal--15-*-*-*-*-*-fontset-15,
        ascii:-*-Consolas-medium-r-normal--17-*-iso8859-1,
        japanese-jisx0208:-*-メイリオ-medium-r-normal--15-*-jisx0208*,
        katakana-jisx0201:-*-メイリオ-medium-r-normal--15-*-jisx0201*")

;;        ;; http://ntemacsjp.sourceforge.jp/matsuan/FontSettingJp.html
;;        (create-fontset-from-ascii-font
;;         "-outline-Consolas-normal-r-normal-normal-15-*-*-*-*-*-iso8859-1"
;;         nil "myfont")
;;        (set-fontset-font "fontset-myfont"
;;                          'japanese-jisx0208
;;                          '("メイリオ" . "jisx0208-sjis"))
;;        (set-fontset-font "fontset-myfont"
;;                          'katakana-jisx0201
;;                          '("メイリオ" . "jisx0201-katakana"))
;;        (set-fontset-font "fontset-myfont"
;;                          'chinese-gb2312
;;                          '("Arial Unicode MS*" . "gb2312"))
;;        (set-fontset-font "fontset-myfont"
;;                          'chinese-big5-1
;;                          '("Arial Unicode MS*" . "big5"))
;;        (set-fontset-font "fontset-myfont"
;;                          'mule-unicode-0100-24ff
;;                          '("Arial Unicode MS*" . "iso10646-1"))

       ;; デフォルトフレームの設定
       (setq default-frame-alist
             (append '(
                       (foreground-color . "white")
                       (background-color . "black")
                       (mouse-color . "white")
                       (cursor-color . "white")
;                       (cursor-type . box)
                       ;; 横幅の文字数
                       (width . 80)

                       ;; フォントとウィンドウ高さ
;                       (font . "MS Gothic 10")

;                       (height . 34) ;; fontset-13 の場合には丁度良い
;                       (font . "fontset-13")

                       (height . 30) ;; fontset-15 の場合には丁度良い
                       (font . "fontset-15")

;                       (font . "fontset-myfont")

                       ;; スクロールバー
;                       (vertical-scroll-bars . left)
                       ;; 行間
                       (line-spacing . 0)
                       (alpha . 80)
                       )
                     default-frame-alist))

       ;; GNU Emacs の方では IME が使えないので無視する
       (global-set-key [M-kanji] 'ignore))

      ((and window-system is-mac)
       ;; Mac
       ;; http://d.hatena.ne.jp/kazu-yamamoto/20090122/1232589385
       ;; http://sakito.jp/emacs/emacs23.html
       (setq fixed-width-use-QuickDraw-for-ascii t)
       (setq mac-allow-anti-aliasing t)
       (if (= emacs-major-version 22)
           (require 'carbon-font))
       ;;(setq my-font "-*-*-medium-r-normal--14-*-*-*-*-*-fontset-hiramaru")
       ;;(set-default-font my-font)
       ;;(add-to-list 'default-frame-alist `(font . ,my-font))
       (when (= emacs-major-version 23)
         (set-face-attribute 'default nil
                             :family "monaco"
                             :height 140)
         (set-fontset-font
          (frame-parameter nil 'font)
          'japanese-jisx0208
          ;;'("Hiragino Kaku Gothic Pro" . "iso10646-1")
          ;;'("Osaka" . "iso10646-1")
          (font-spec :family "Osaka" :size 12)
          )
         (set-fontset-font
          (frame-parameter nil 'font)
          'japanese-jisx0212
          ;;'("Hiragino Kaku Gothic Pro" . "iso10646-1")
          ;;'("Osaka" . "iso10646-1")
          (font-spec :family "Osaka" :size 12)
          )
         (set-fontset-font
          (frame-parameter nil 'font)
          'mule-unicode-0100-24ff
          '("monaco" . "iso10646-1"))

         ;; (create-fontset-from-ascii-font "Menlo-14:weight=normal:slant=normal" nil "menloosaka")
         ;; (set-fontset-font
         ;;  "fontset-menloosaka"
         ;;  ;;(frame-parameter nil 'font)
         ;;  'unicode
         ;;  (font-spec :family "Osaka" :size 16)
         ;;  nil
         ;;  'append)

         (setq face-font-rescale-alist
               '(("^-apple-hiragino.*" . 1.2)
                 (".*osaka-bold.*" . 1.2)
                 (".*osaka-medium.*" . 1.2)
                 (".*courier-bold-.*-mac-roman" . 1.0)
                 (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
                 (".*monaco-bold-.*-mac-roman" . 0.9)
                 ("-cdac$" . 1.3))))




       (setq default-frame-alist
             (append '(
                       (foreground-color . "white")
                       (background-color . "black")
                       (width . 80)
                       (height . 40)
                       (line-spacing . 0)
                       (alpha . 80)
                       )
                     default-frame-alist)))

      ((and window-system is-unix)
       ;; Unix
       (setq default-frame-alist
             (append '(
                       (foreground-color . "white")
                       (background-color . "black")
                       (width . 80)
                       (height . 40)
                       (line-spacing . 0)
                       (alpha . 80)
                       )
                     default-frame-alist))))

;; 初期フレームにデフォルトフレームを使う
(setq initial-frame-alist default-frame-alist)
