;; Rust
(require 'rust-mode)
(add-to-list 'auto-mode-alist '("\\.rs$" . rust-mode))

;; VS
(add-to-list 'auto-mode-alist '("\\.vcxproj$" . xml-mode))

;; HAML
(require 'haml-mode)


;; CMake
(require 'cmake-mode)
(add-to-list 'auto-mode-alist '("CMakelists\\.txt" . cmake-mode))


;; nxml
(add-to-list 'load-path "~/.emacs.d/libs/nxml-mode")
(require 'nxml-mode)

;; Scheme
(require 'cluck)

;; Org
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


;; SVN
(require 'psvn)
(add-hook 'svn-log-edit-mode-hook 'turn-on-auto-fill)


;; Text
(toggle-text-mode-auto-fill)


;; C
(defun patrick-c-settings ()
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq c-basic-offset 4))
(add-hook 'c-mode-hook 'patrick-c-settings)

(defun patrick-py-settings ()
  (setq indent-tabs-mode nil)
  (setq tab-width 2))
(add-hook 'python-mode-hook 'patrick-py-settings)

;; Python
(add-to-list 'auto-mode-alist '("\\.g$" . python-mode))
(add-to-list 'auto-mode-alist '("\\.sp$" . python-mode))
(add-to-list 'auto-mode-alist '("\\.al$" . python-mode))
(add-to-list 'auto-mode-alist '("\\.scons$" . python-mode))
(add-to-list 'auto-mode-alist '("wscript$" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(autoload 'python-mode "python-mode" "Python editing mode" t)

;; Ruby
(defun pjf/rb-settings ()
  (setq indent-tabs-mode nil)
  (setq tab-width 4))
(add-hook 'ruby-mode-hook 'pjf/rb-settings)

(autoload 'ruby-mode "ruby-mode" "Ruby editing mode." t)
(add-to-list 'auto-mode-alist '("\\.rb$"     . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$"  . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.t$"      . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.re$"     . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.struct$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.xrs$"    . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.pmacs$"    . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" 
  "Set local key defs dor inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))


;; YAML
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; Markdown
(autoload 'markdown-mode "markdown-mode" 
  "Major mode for editing files in Markdown." t)
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
