;; -*- lexical-binding: t; -*-

(defvar my-conf (make-sparse-keymap))
(keymap-set global-map "C-c c" (cons "配置文件" my-conf))
(keymap-set my-conf "i"
	    '("init.el" . (lambda () (interactive)(find-file "~/.emacs.d/init.el"))))
(keymap-set my-conf "c"
	    '("基础配置" .
	      (lambda ()
		(interactive)
		(find-file "~/.emacs.d/lisp/my-core.el"))))
(keymap-set my-conf "k" '("按键配置" . (lambda ()
					 (interactive)
					 (find-file "~/.emacs.d/lisp/my-keymap.el"))))
(keymap-set my-conf "RET" '("lisp目录" . (lambda ()
					   (interactive)
					   (find-file "~/.emacs.d/lisp/"))))
(keymap-set my-conf "p" '("插件配置" . (lambda ()
					   (interactive)
					   (find-file "~/.emacs.d/lisp/my-packages.el"))))
(keymap-set my-conf "u" '("ui配置" . (lambda ()
					   (interactive)
					   (find-file "~/.emacs.d/lisp/my-ui.el"))))

;;- 将 gt的两个绑定键添加 中文解释
(which-key-add-key-based-replacements "C-c t" "翻译")
(which-key-add-key-based-replacements "C-c s" "朗读")
;; -- 词法定义域注释
(which-key-add-key-based-replacements "C-c l" "代码片段")
(keymap-set emacs-lisp-mode-map "C-c l c"
	    '("添加词法定义域" . (lambda () (interactive) (elisp-enable-lexical-binding))))
;;- minibuffer 补全滚动
(with-eval-after-load 'icomplete
  (keymap-set icomplete-vertical-mode-minibuffer-map "C-j" #'icomplete-forward-completions)
  (keymap-set icomplete-vertical-mode-minibuffer-map "C-k" #'icomplete-backward-completions))

;;- backtab（Shift-TAB）：代码/文本里反缩进，补全弹窗里选上一个候选
(defun my-dedent-line-or-region (&optional n)
  "把当前行或选区向左缩进 N 个 tab 宽度（默认 1 个）。"
  (interactive "p")
  (let* ((n (or n 1))
	 (beg (if (use-region-p) (region-beginning) (line-beginning-position)))
	 (end (if (use-region-p) (region-end) (line-end-position))))
    (indent-rigidly beg end (- (* n tab-width)))))

;; 用 mode map 而不是 global-map，避免在 minibuffer 里误触
(keymap-set prog-mode-map "<backtab>" #'my-dedent-line-or-region)
(keymap-set text-mode-map "<backtab>" #'my-dedent-line-or-region)

(with-eval-after-load 'corfu
  (keymap-set corfu-map "<backtab>" #'corfu-previous))


(provide 'my-keymap)
