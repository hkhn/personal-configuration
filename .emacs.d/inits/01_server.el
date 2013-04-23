;; -*- coding:utf-8 -*-
;- 2007/09/30
;* Windows の送るで Meadow を使用する
(cond (is-meadow
       (load-safe "gnuserv")
       (gnuserv-start)
       ;; 新しく起動する場合にも同じフレームを使う
       (setq gnuserv-frame (selected-frame))))

;- 2011/07/24
;* server mode
(when (locate-library "server")
  (require 'server)
  (if (fboundp 'server-running-p)
      (unless (server-running-p)
        (server-start))))
