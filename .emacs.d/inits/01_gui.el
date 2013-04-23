;; -*- coding:utf-8 -*-
;- 2008/11/21
;; キャレット位置がマウスカーソルに近づくと，自動的にマウスカーソルが逃げる
;; キャレット位置が遠ざかると，元の位置に戻ってくる
(if window-system
    (mouse-avoidance-mode 'exile))
