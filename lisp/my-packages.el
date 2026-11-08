;; -*- lexical-binding: t; -*-

;;- 赞美 evil
(use-package evil
  :ensure t
  :init
  (evil-mode 1))

;;- evil逃生按键
(use-package evil-escape
  :after evil
  :ensure t
  :init
  (evil-escape-mode 1)
  :custom
  (evil-escape-key-sequence "jk")
  (evil-escape-delay 0.15))
	
;;;- 我自己包装的 tts：直接调用 gt 的 gt-speech，用系统自带 TTS
(defvar my-tts-engine nil)
(defun my-speak ()
  (interactive)
  (require 'gt)
  (gt-speech (or my-tts-engine (setq my-tts-engine (gt-bing-engine)))
             (if (use-region-p)
                 (buffer-substring-no-properties (region-beginning) (region-end))
               (thing-at-point 'word t)) 'en))

;;- gt 一个翻译框架（:bind 自带延迟加载，不需要 :after）
(use-package gt
  :ensure t
  :config
  (setq gt-langs '(en zh))
  (setq gt-default-translator (gt-translator
			       :engines (gt-youdao-dict-engine)
			       :taker (gt-taker :langs '(en zh)
						:text 'word
						:prompt nil)
			       :render (gt-render)))
  :bind
  ("C-c t" . gt-translate)
  ("C-c s" . my-speak))

;;- 补全框架
(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0)
  (corfu-auto-prefix 1)
  (corfu-cycle t)
  (corfu-preselect 'valid)

  :init
  ;;取消这个evil的案件 用来补全框中向上移动
  (keymap-unset evil-insert-state-map "C-k")
  (global-corfu-mode)
  :bind
  (:map corfu-map
	("C-j" . corfu-next)
	("C-k" . corfu-previous)))

;;-模糊补全
(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic))
  (setq orderless-matching-styles
       '(orderless-flex orderless-initialism orderless-literal)))
;;-Magit git插件
(use-package magit
  :config
  (setq magit-display-buffer-function
        #'magit-display-buffer-same-window-except-diff-v1)
  :bind
  ("C-x g" . magit-status))

;;- Magit 界面中文化（见 lisp/my-magit-zh.el；M-x my-magit-zh-disable 可关掉）
(require 'my-magit-zh)
(my-magit-zh-enable)

(provide 'my-packages)
