;; -*- lexical-binding: t; -*-

;; 关掉启动欢迎页。首帧直接就是 *scratch*，没有 scratch -> splash 的切换，所以不闪
(setq inhibit-startup-screen t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(load-theme 'deeper-blue t)
(setq-default header-line-format '("   " (:eval (buffer-name))))

(set-face-attribute 'header-line nil
                    :background "#2F3873"
                    :foreground "#a8b3c7"
                    :box '(:line-width (1 . 2) :color "#2F3873"))
