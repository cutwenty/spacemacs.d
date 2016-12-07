;; 格式化代码
(global-set-key (kbd "C-c /") 'indent-region-or-buffer)

;; occur-mode默认取词
(global-set-key (kbd "M-s o") 'occur-dwim)

(global-set-key (kbd "C-c j") 'ace-jump-mode)
(global-set-key (kbd "C-c C-j") 'ace-jump-line-mode)
