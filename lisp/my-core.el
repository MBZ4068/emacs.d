;; -*- lexical-binding: t; -*-


;;- 相对行号
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;;- 这些不用行号
(dolist (hook '(term-mode-hook shell-mode-hook eshell-mode-hook
			        eww-mode-hook))
  (add-hook hook (lambda () (display-line-numbers-mode 0))))

;;- 缩进
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)


;;- 原生补全
(setq icomplete-max-delay-chars 0)
(icomplete-vertical-mode t)
(setq completion-auto-help nil)
;;- 一开始就补全
(setq icomplete-show-matches-on-no-input t)

;;- 原生括号编辑
(electric-pair-mode 1)

;;- 快捷键提示
(which-key-mode 1)

;;- lsp
(use-package eglot
  :ensure nil
  :hook ((python-mode python-ts-mode
             c-mode c-ts-mode c++-mode c++-ts-mode
             sh-mode bash-ts-mode
             lua-mode lua-ts-mode) . eglot-ensure)
  :config
  (setq eglot-autoshutdown t
		eglot-sync-connect nil))



(provide 'my-core)
