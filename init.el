;; -*- lexical-binding: t; -*-


;;-防止emacs 污染配置
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;;-包管理
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(require 'use-package)
(setq use-package-always-ensure t)


;;- 引用文件
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;- emacs原生部分的配置
(require 'my-core)
;;- 插件配置
(require 'my-packages)


;;- ui配置
(require 'my-ui)
;;- 快捷键绑定要到最后
(require 'my-keymap)




