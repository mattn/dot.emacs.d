(leaf eglot
  :ensure t
  :require t
  :config
  (add-hook 'python-mode-hook 'eglot-ensure)
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'ruby-mode-hook 'eglot-ensure)
  (add-hook 'markdown-mode-hook 'eglot-ensure)
  (add-hook 'go-mode-hook 'eglot-ensure))
(leaf company
  :doc "Modular text completion framework"
  :req "emacs-24.3"
  :tag "matching" "convenience" "abbrev" "emacs>=24.3"
  :url "http://company-mode.github.io/"
  :ensure t
  ;:blackout t
  :leaf-defer nil
  :bind ((company-active-map
          ("M-n" . nil)
          ("M-p" . nil)
          ("C-s" . company-filter-candidates)
          ("C-n" . company-select-next)
          ("C-p" . company-select-previous)
          ("<tab>" . company-indent-or-complete-common)
          ("C-<Tab>" . company-complete-selection))
         (company-search-map
          ("C-n" . company-select-next)
          ("C-p" . company-select-previous)))
  :custom ((company-idle-delay . 0)
           (company-selection-wrap-around . t)
           (company-minimum-prefix-length . 1)
           (company-transformers . '(company-sort-by-occurrence)))
  :global-minor-mode global-company-mode)


(leaf company-lsp
  :url "https://github.com/tigersoldier/company-lsp"
  :commands company-lsp company
  :custom
  (company-lsp-cache-candidates . nil)
  (company-lsp-async . t)
  (company-lsp-enable-recompletion . t)
  (company-lsp-enable-snippet . t)
  :after
  (:all lsp-mode lsp-ui company yasnippet)
  (leaf lsp-treemacs :ensure t)
)

(leaf clang-format
  :ensure t)

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
    `(markdown-mode . ("efm-langserver"))))
