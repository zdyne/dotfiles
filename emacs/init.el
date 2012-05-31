
(if (eq system-type 'darwin)
    (set-frame-font "Monaco-14")
  (set-frame-font "Consolas-12"))

(if (eq system-type 'darwin)
    (setq ns-pop-up-frames nil))

(show-paren-mode 1)

;; Basic configuration
(menu-bar-mode -1)
(tool-bar-mode -1)
(transient-mark-mode t)
(setq inhibit-splash-screen t)

(setq c-basic-offset 4)
(setq tab-width 4)
(setq indent-tabs-mode nil)
(global-font-lock-mode 1)

;; Save a bunch of "stuff" on exit
(setq desktop-save t)
(desktop-save-mode 1)

(setq desktop-globals-to-save
	  (append '((extended-command-history . 30)
				(file-name-history        . 100)
				(grep-history             . 30)
				(compile-history          . 30)
				(minibuffer-history       . 50)
				(query-replace-history    . 60)
				(read-expression-history  . 60)
				(regexp-history           . 60)
				(regexp-search-ring       . 20)
				(search-ring              . 20)
				(shell-command-history    . 50)
				tags-file-name
				register-alist)))

;; ENV
(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
  (push "/usr/local/bin" exec-path))

;; Backup files
(setq
 backup-directory-alist ' (("." . "~/.emacs.d/saves")))


(defun pjf/force-revert ()
  "Wrapper around (revert-buffer) w/ the noconfirm flag set."
  (interactive)
  (revert-buffer nil t))
(global-set-key [f5] 'pjf/force-revert)

(defun pjf/recursive-byte-compile-dir (dir)
  "Recurses into the specified directory building all .el files."
  (mapcar (lambda (f)
	    (cond
	     ((or (string= f ".") (string= f ".."))
	      (message "Skipping ."))
	     ((string= f "saves")
	      (message "Skipping 'saves' directory"))
	     ((string= (file-name-extension f) "el")
	      (byte-compile-file (concat (file-name-as-directory dir) f)))
	     ((file-directory-p f)
	      (pjf/recursive-byte-compile-dir (concat
					       (file-name-as-directory dir) f)))))
	  (directory-files dir)))

(defun pjf/byte-compile-dotemacs ()
  "Byte compile all of the .el files in my .emacs.d."
  (interactive)
  (pjf/recursive-byte-compile-dir "~/.emacs.d"))

(pjf/byte-compile-dotemacs)


(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-after-kill-buffer-p t)

;; Load path stuff
(add-to-list 'load-path "~/.emacs.d/libs")

;; Much improved buffer interface
(require 'ido)
(ido-mode 'buffer)
(setq ido-enable-flex-matching t)


(require 'midnight)
(setq clean-buffer-list-delay-general 10)


(server-start)

;; Package management
(require 'package)
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

;; Auto-complete
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)


(add-to-list 'load-path "~/.emacs.d")
(load-library "patrick/modes")
(load-library "patrick/frames")
(load-library "patrick/scrollbars")
(load-library "patrick/keys")
(load-library "patrick/buffers")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)

(require 'zenburn)
(zenburn)

(if (eq system-type 'darwin)
    (cd "~")
  (cd "c:/users/patrick/documents"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
