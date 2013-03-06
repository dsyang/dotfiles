;; emacs initialization file for dsyang.
;; Snippets stolen from emacs prelude


;; because I like running emacs in server mode
(server-start)
;; disables annoying system bell
(setq ring-bell-function 'ignore)
;; necessary for some packages to work
(require 'cl)

;; disable loading of "default.el" at startup
(setq inhibit-default-init t)

;; Lose the UI
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(menu-bar-mode -1)
;; get the good package list
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


;; Set the default size when working in window mode
(add-to-list 'default-frame-alist '(left . 0))
(add-to-list 'default-frame-alist '(top . 0))
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 155))

;; Set the default font
(set-face-attribute 'default nil :height 140)

;; turn on font-lock mode (syntax highlighting)
(global-font-lock-mode t)
;; enable visual feedback on selections
(setq transient-mark-mode t)
;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; meaningful names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; saveplace remembers your location in a file when saving files
(setq save-place-file (concat user-emacs-directory "saveplace"))
;; activate it for all buffers
(setq-default save-place t)
(require 'saveplace)

;; no tabs only spaces
;;(set indent-tabs-mode nil)
;;set tab with to 2 for all buffers
(setq-default tab-width 2)
;;show column number on status bar
(setq-default column-number-mode t)
;;set default column length to 80
(setq-default fill-column 80)

;; show trailing whitespace
(setq-default show-trailing-whitespace t)
;; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; always end a file with a newline
(setq require-final-newline t)

;; highlight the current line
(global-hl-line-mode +1)
(set-face-background 'hl-line "dark cyan")

;; show line numbers on the left margin
(setq linum-format "%4d| ")
;; use linum-mode all the time
(global-linum-mode)

;; adds vertical line at the 80 character mark
(setq fci-rule-color "brightred")
(add-hook 'prog-mode-hook 'fci-mode)

;; clojure-mode paredit
(add-hook 'clojure-mode-hook 'paredit-mode)

(ido-mode t)
;; cool features in minibuffer
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-default-file-method 'selected-window)

;; colors different levels of parentheses
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; text expansion snippets
(require 'yasnippet)
(yas--initialize)
(yas/load-directory "~/.emacs.d/elpa/yasnippet-20130218.2229/snippets")

(add-hook 'js2-mode-hook 'my-jshtml-hook)

(defun my-jshtml-hook ()
  (interactive)
  (setq intent-tabs-mode nil)
)

;; scala mode stuff
(require 'scala-mode2)
(add-hook 'scala-mode-hook '(lambda ()
                              (setq scala-indent:indent-value-expression t
                                    scala-indent:align-parameters t
                                    scala-indent:align-forms t
                                    )
                              )
)
;; start ensime
(add-to-list 'load-path "~/.emacs.d/ensime_2.10.0-0.9.8.8/elisp")
(require 'ensime)
;;start ensime when scala mode starts
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; set latex open program
;; setup path to find texbin
(setenv "PATH"
        (concat
         "/usr/texbin" ":"

         (getenv "PATH")))

(setq TeX-output-view-style
      (quote
       (("^pdf$" "." "open %o"))))
(setq TeX-PDF-mode t)

;; Haskell mode indentation
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; undo-tree makes your changes a tree
(require 'undo-tree)
(global-undo-tree-mode)

;; load the theme
(load-theme 'zenburn t)


;;;;;;;;;;;;;;;;;;;;;;
;; custom key-bindings
;;;;;;;;;;;;;;;;;;;;;;

(global-set-key "\C-x\C-u" 'unto-tree-visualize)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key "\C-x\C-a" 'align-regexp)

;; Invoke M-x without the Alt key
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; toggle flyspell mode
(define-key global-map "\C-xf" 'flyspell-mode)

;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; moving to different positions
(global-set-key (kbd "C-x SPC") 'my-store-current-position)
(global-set-key (kbd "C-c SPC") 'my-jump-current-position)
(global-set-key (kbd "M-SPC") 'goto-line)

;; moving accross windows
(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)
(winner-mode 1)
;; winner mode bindings
;; C-c <left> undo window config change
;; C-c <right> redo window config change
;; C-x r w a store window config in a register 'a'
;; C-x r j a, restore window config in register 'a'


;;;;;;;;;;;;;;;;;;;;;;;;;
;; Self-defined functions
;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-store-current-position ()
  "Stores the current position in the file at ?9"
  (interactive)
  (point-to-register ?9)
)

(defun my-jump-current-position ()
  "Goes to the current position set in ?9"
  (interactive)
  (jump-to-register ?9)
)

(defun my-enable-arrow-keys ()
  (interactive)
  (set-face-foreground 'modeline "firebrick")
  (global-set-key (kbd "<up>") (kbd "C-p"))
  (global-set-key (kbd "<down>") (kbd "C-n"))
  (global-set-key (kbd "<left>") (kbd "C-b"))
  (global-set-key (kbd "<right>") (kbd "C-f"))
)

(defun my-disable-arrow-keys ()
  (interactive)
  (global-set-key
	 (kbd "<up>")
	 (lambda ()
		 (interactive)
		 (message "Arrow key navigation is disabled. Use C-p instead.")))
  (global-set-key
	 (kbd "<down>")
	 (lambda ()
		 (interactive)
		 (message "Arrow key navigation is disabled. Use C-n instead.")))
  (global-set-key
	 (kbd "<left>")
	 (lambda ()
		 (interactive)
		 (message "Arrow key navigation is disabled. Use C-b instead.")))
  (global-set-key
	 (kbd "<right>")
	 (lambda ()
		 (interactive)
		 (message "Arrow key navigation is disabled. Use C-f instead.")))
  (set-face-foreground 'modeline "default")
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "27470eddcaeb3507eca2760710cc7c43f1b53854372592a3afa008268bcf7a75" default)))
 '(fci-rule-color "red")
 '(indent-tabs-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
