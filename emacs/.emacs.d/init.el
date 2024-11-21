;;;package-summary
;; Disable toolbars and menus
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Set a custom theme (e.g., 'wombat')
(load-theme 'wombat t)

;; Increase the font size
(set-face-attribute 'default nil :height 140) ;; 140 = 14pt

;; Make Esc quit prompts
;;(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
	("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t) ;; Automatically install packages if missing


(use-package ivy
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package projectile
  :config
  (projectile-mode +1)
  :bind
  (("C-c f" . projectile-find-file))
  )

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package flycheck
  :init (global-flycheck-mode)
  (add-hook 'js2-mode-hook 'flycheck-mode)
  (add-hook 'rjsx-mode-hook 'flycheck-mode))


(use-package counsel
  :ensure t
  :config
  (counsel-mode 1))


;; Install and configure js2-mode for Javascript
(use-package js2-mode
  :ensure t
  :mode "\\.js\\'" ; Enable js-2 mode for .js files
  :interpreter "node"
  :config(setq js2-basic-offset 2)) ;; Set indentation to 2 spaces

;; Enable and configure rjsx-mode for React
(use-package rjsx-mode
  :ensure t
  :mode "\\.jsx?\\'" ;; Enable rjsx-mode for .js and .jsx files
  :config
  (setq js-indent-level 2))

;; Use LSP
(use-package lsp-mode
  :ensure t
  :hook ((js2-mode . lsp)
	 (rjsx-mode . lsp))
  :commands lsp)

;; LSP-UI for better UI experience
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(evil lsp-ui lsp-mode rjsx-mode projectile js2-mode flycheck doom-modeline counsel company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Set the backup directory to the .emacs.d/backups/ folder
(setq backup-directory-alist `(("." . ,(expand-file-name "backups/" user-emacs-directory))))

;; Set the auto-save directory to the .emacs.d/auto-save/ folder
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "auto-save/" user-emacs-directory) t)))

;; Create the directories if they don't exist
(make-directory (expand-file-name "backups/" user-emacs-directory) t)
(make-directory (expand-file-name "auto-save/" user-emacs-directory) t)

(require 'evil)
(evil-mode 1)
(setq evil-want-integration t)
(setq evil-collection-setup-minibuffer t)
(use-package evil-escape
  :ensure t
  :init
  (setq evil-escape-key-sequence "jj")
  (setq evil-escape-delay 0.2)
  :config
  (evil-escape-mode 1))

(use-package emmet-mode
  :ensure t
  :hook (css-mode . emmet-mode)
  :config
  (setq emmet-expand-jsx-className? t))

(add-hook 'sgml-mode-hook 'emmet-mode) ;; For HTML
(add-hook 'css-mode-hook 'emmet-mode) ;; For CSS


(use-package web-mode
  :ensure t
  :mode ("\\.html?\\'" "\\.css\\'" "\\.js\\'")
  :config
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-quoting t))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
