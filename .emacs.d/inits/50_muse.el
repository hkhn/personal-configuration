;; -*- coding:utf-8 -*-
;- 2012/09/08
;* Muse
;; http://www.miyaken.org/muse/QuickStart.jp.html
;; http://purplemoon.org/muse.html
(when (locate-library "muse-mode")
  (require 'muse-mode)
  (add-hook 'muse-mode-hook
            (lambda ()
              (setq user-full-name "Your Name")))

  (require 'muse-html)
  (setq muse-html-encoding-default 'utf-8)
  (setq muse-html-footer "
<!-- Page published by Emacs Muse ends here -->
  <hr />
  <div class=\"footer\">
    <p>Author: <lisp>(user-full-name)</lisp><br />
       Last modified: <lisp>(format-time-string \"%04Y/%02m/%02d %T\")</lisp>
    </p>
  </div>
  </body>
</html>\n"
        )

  (require 'muse-latex)
  (require 'muse-texinfo)
  (require 'muse-docbook)
  ;; use dvipdfmx instead of pdflatex
  (setq muse-latex-pdf-program "sh -c 'platex $1 && dvipdfmx ${1/.tex/.dvi} && rm ${1/.tex/.dvi}' -v")
  ;; date format in English
  (setq muse-publish-date-format (let ((system-time-locale "C")) (format-time-string "%B %e, %Y")))

  (require 'muse-project)
  (require 'muse-wiki)
  (setq muse-project-alist
        '(("wiki"
           ("~/muse/wiki" :default "index")
           (:base "html" :path "~/muse/wiki/html")
           ;; (:base "pdf" :path "~/muse/wiki/pdf")
           )
          ("diary"
           ("~/muse/diary" :default "index")
           (:base "html" :path "~/muse/diary/html")
           ;; (:base "pdf" :path "~/muse/diary/pdf")
           )))

  (global-set-key "\C-c\C-w" 'muse-project-find-file)
  (add-hook 'muse-mode-hook
            (lambda ()
              ;; どうせ \C-t は使わないのでタイムスタンプの挿入に使う
              (local-set-key "\C-t" 'insert-timestamp)))
  )
