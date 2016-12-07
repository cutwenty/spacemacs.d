(setq auto-mode-alist
  (append
    '(("\\.js\\'" . js2-mode))
    '(("\\.html\\'" . web-mode))
    '(("\\.wxml\\'" . web-mode))
    '(("\\.wxss\\'" . css-mode))
    '(("\\.clj\\'" . clojure-mode))
    auto-mode-alist))

;; 关闭自动保存，自动备份
(setq auto-save-default nil)
(setq make-backup-files nil)

;; 选中修改时删除
(delete-selection-mode t)

;; 递归删除、拷贝文件夹
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

;; 所有dired buffer共享一个buffer
(put 'dired-find-alternate-file 'disabled nil)

;; imenu增强
(add-hook 'js2-mode-hook
  (lambda ()
    (setq imenu-create-index-function 'js2-imenu-make-index)))

;; org配置
(with-eval-after-load 'org
  (setq org-src-fontify-natively t)

  ;; take notes
  (setq org-capture-templates
    '(("t" "TODO" entry (file+headline "~/org-notes/notes.org" "工作安排")
        "* TODO [#B] %?\n %i\n"
        :empty-lines 1)
       ("c" "chrome" entry (file+headline "~/org-notes/notes.org" "quick notes")
         "* TODO [#C] %?\n %(hxhgta/retrieve-chrome-current-tab-url)\n %i\n %U"
         :empty-lines 1))))

(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

(add-hook 'go-mode-hook 'go-eldoc-setup)
