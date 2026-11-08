;; -*- lexical-binding: t; -*-


(setq display-line-numbers-width 2)
;; 一次性给行号栏宽度
(setq display-line-numbers-width-start t)
(set-face-attribute 'fringe nil :background 'unspecified)

(set-face-attribute 'line-number nil
                       :foreground "#93a9c9"    ; 比原来亮一档
                       :background 'unspecified) ; 不再自造底色
(set-face-attribute 'line-number-current-line nil
                       :foreground "#e8eef8"    ; 当前行接近白，一眼能找到
                       :background 'unspecified
                       :weight 'bold)



(setq display-time-format "%H:%M")
(setq display-time-default-load-average nil)
(display-time-mode 1)

(provide 'my-ui)

