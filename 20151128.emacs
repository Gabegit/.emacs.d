(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server (quote ask))
 '(TeX-view-predicate-list nil)
 '(ado-comeback-flag t)
 '(current-language-environment "UTF-8")
 '(custom-safe-themes (quote ("a041a61c0387c57bb65150f002862ebcfe41135a3e3425268de24200b82d6ec9" default)))
 '(flymake-allowed-file-name-masks (quote (("\\.py\\'" flymake-pyflakes-init) ("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'" flymake-simple-make-init) ("\\.xml\\'" flymake-xml-init) ("\\.html?\\'" flymake-xml-init) ("\\.cs\\'" flymake-simple-make-init) ("\\.p[ml]\\'" flymake-perl-init) ("\\.php[345]?\\'" flymake-php-init) ("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup) ("\\.java\\'" flymake-simple-make-java-init flymake-simple-java-cleanup) ("\\.idl\\'" flymake-simple-make-init))))
 '(ido-enable-regexp t)
 '(ido-everywhere nil)
 '(markdown-coding-system (quote utf-8-with-signature))
 '(markdown-command "/usr/local/bin/pandoc -s -c /Users/gabe/.emacs.d/pandoc.css --mathjax --highlight-style espresso")
 '(markdown-command-needs-filename t)
 '(markdown-enable-math nil)
 '(org-emphasis-alist (quote (("*" bold) ("/" italic) ("_" underline) ("=" org-verbatim verbatim) ("~" org-code verbatim) ("+" (:strike-through t)))))
 '(pandoc-binary "pandoc")
 '(preview-scale-function 1.3)
 '(reb-re-syntax (quote string))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(yas/wrap-around-region t))

;(if window-system
 ;    (set-frame-size (selected-frame) 60 24))

(setq default-frame-alist '((height . 45) (width . 80)))

;;setting eng and chinese fonts， 最后一行为设置中英文可用鼠标+ctrl同步缩放
;; Setting English Font
(set-face-attribute
  'default nil :font "Dejavu Sans Mono 15")
;; Chinese Font
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;     (set-fontset-font (frame-parameter nil 'font)
;;                       charset
;;                       (font-spec :family "Microsoft YaHei" :size 16)))
;(setq face-font-rescale-alist '("Microsoft Yahei" . 1.2))
;(setq face-font-rescale-alist '(("Microsoft Yahei" . 1.2) ("WenQuanYi Zen Hei" . 1.2)))
(setq face-font-rescale-alist '(("PingFangSC-Regular" . 1.2) ("WenQuanYi Zen Hei" . 1.2)))



;; highlight the current line; set a custom face, so we can
;; recognize from the normal marking (selection)
;; (defface hl-line '((t (:background "Green")))
;;   "Face to use foR `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)
(global-hl-line-mode t) ; turn it on for all modes by default

(setq-default line-spacing 7)


;; Prevent startup message and switch to empty *scratch*
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;自动插入括号
(show-paren-mode t)
(setq skeleton-pair t)
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;(global-set-key (kbd "<") 'skeleton-pair-insert-maybe)


;; yasnippet
(add-to-list 'load-path
             "~/.emacs.d/elpa/yasnippet-0.8.0")
(require 'yasnippet)
(setq yas/snippet-dirs '("~/.emacs.d/snippets"))



 ;  (yas/load-directory yas/root-directory)
(yas-global-mode 1)

;fixing the conflict between orgmode and yasnippet TAB
(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(add-hook 'org-mode-hook
          (lambda ()
            ;; yasnippet (using the new org-cycle hooks)
            (make-variable-buffer-local 'yas/trigger-key)
            (setq yas/trigger-key [tab])
            (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
            (define-key yas/key
	      map [tab] 'yas/next-field)))

;; fix the tab not work in markdown-mode
;; This goes into my .emacs file
;; (defun markdown-unset-tab ()
;;   "markdown-mode-hook"
;;   (define-key markdown-mode-map (kbd "<tab>") nil))
;; (add-hook 'markdown-mode-hook '(lambda() (markdown-unset-tab)))


;;auctex
;;;;;;;;;LaTex-mode settings;;;;;
(add-hook 'LaTeX-mode-hook (lambda ()
	 ; (TeX-fold-mode 1)
	  (turn-off-auto-fill)              ;;LaTeX模式下，不打开自动折行
	  ;(linum-mode 1)
	  (setq-default Tex-master nil) ; query for master file.
	  (TeX-global-PDF-mode t)
	  (auto-complete-mode 1)
	  (LaTeX-math-mode 1)
	  (visual-line-mode t) ; added in mac
	  (outline-minor-mode 1)            ;;使用 LaTeX mode 的时候打开 outline mode
	  (setq TeX-show-compilation nil)   ;;NOT display compilation windows
	 ; (setq TeX-global-PDF-mode t       ;;PDF mode enable, not plain
	     ; TeX-engine 'latex)  ;;use pdflatex default
	  (setq TeX-engine 'xetex)
	  (setq TeX-clean-confirm nil)
	  (setq TeX-save-query nil)
	  (imenu-add-menubar-index)
	  (setq font-latex-fontify-script t)
	 ; (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
	  ;(setq TeX-electric-escape t)      ;; 按 \ 后光标跳到mini-buffer里面输入命令
	 ; (setq TeX-view-program-list '((("SumatraPDF" "SumatraPDF.exe %o")
					    ; ("Gsview" "gsview32.exe %o"))) ;;重新定义pdf viewer

    ;; sync pdf with skim in mac
    ;; forward search:c-c c-c;back search from skim to tex using shiht-cmd-click

    (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))

    (setq TeX-view-program-list
     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b"))) ; for mactex

                 ; (setq TeX-view-program-selection '((output-pdf "Sumatra PDF")))
                 ; (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
                 ; (setq TeX-command-default "LaTeX")
     (setq TeX-fold-env-spec-list (quote (("[comment]" ("comment")) ("[figure]" ("figure")) ("[table]" ("table"))("[itemize]"("itemize"))("[enumerate]"("enumerate"))("[description]"("description"))("[overpic]"("overpic"))("[tabularx]"("tabularx"))("[code]"("code"))("[shell]"("shell")))))))


(mapc (lambda (mode)
      (add-hook 'LaTeX-mode-hook mode))
      (list 'auto-fill-mode
            'LaTeX-math-mode ))



;;;RefTex;;;;;;;;;;;;;;;;
 (require 'reftex)
 (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
 (setq reftex-plug-into-AUCTeX t)
 (setq reftex-enable-partial-scans t)
 (setq reftex-save-parse-info t)
 (setq reftex-use-multiple-selection-buffers t)
 (setq reftex-toc-split-windows-horizontally t) ;;*toc*buffer在左侧。
 (setq reftex-toc-split-windows-fraction 0.2)  ;;*toc*buffer 使用整个frame的比例。
 (autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
 (autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
 (autoload 'reftex-citation "reftex-cite" "Make citation" nil)
 (autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)

;; added for mactex
;; Use Skim as viewer, enable source <-> PDF sync
;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
;; (add-hook 'LaTeX-mode-hook (lambda ()
;;   (push
;;     '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
;;       :help "Run latexmk on file")
;;     TeX-command-list)))
;; (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background
;; (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
;; (setq TeX-view-program-list
;;      '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))


;; ;; ;;auto-complete
 ;; (add-to-list 'load-path "~/.emacs.d")
;;  (add-to-list 'load-path "~/.emacs.d/plugins/")
;;  (require 'auto-complete)
;;  (require 'auto-complete-config)
;;  (add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/ac-dict")
;;  (ac-config-default)
;(global-auto-complete-mode t)

(defun auto-complete-settings ()
(apply-define-key
   ac-complete-mode-map
   `(("<return>"   nil)
     ("RET"        nil)
     ("M-j"        ac-complete)
     ("<C-return>" ac-complete)
     ("M-n"        ac-next)
     ("M-p"        ac-previous)))

  (setq ac-dwim t)
  (setq ac-candidate-max ac-candidate-menu-height)

  (set-default 'ac-sources
               '(ac-source-semantic
                 ac-source-yasnippet
                 ac-source-abbrev
                 ac-source-words-in-buffer
                 ac-source-words-in-all-buffer
                 ac-source-imenu
                 ac-source-files-in-current-dir
                 ac-source-filename)))

;(global-auto-complete-mode t);;ac-math
 (add-to-list 'load-path "~/.emacs.d/plugins/")
(require 'ac-math)

(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of {{{latex-mode}}}

(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
     (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
               ac-sources)))
(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)

;;flymake: check the syntax of latex file on the fly.

;; (require 'flymake)
;; (defun flymake-get-tex-args (file-name) (list "pdflatex"
;;     (list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))
;; (add-hook 'LaTeX-mode-hook 'flymake-mode)

;;unicad 自动编码识别器
(add-to-list 'load-path "~/.emacs.d/plugins/")
(add-to-list 'load-path "/User/gabe/.emacs.d")
(require 'unicad)


;;recent files
(require 'recentf )
(recentf-mode 1)

(server-start)

;;ido
;(require 'ido)
;(ido-mode 1)

;;config inverse search and foreward search with smamatrapdf
;; inverse search
;(LaTeX-command "latex -synctex=-1")
;;- Set 'Latex\Customize Auctex\Tex command\Tex Output View Style\Line containing the phrase <^pdf$>' to
;;C:\Programme\SumatraPDF\SumatraPDF.exe %o
;;forward search
;; replace '~/emacs-scripts/' by the path where this script file is stored
(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))
(require 'sumatra-forward)
;; (add-hook 'LaTeX-mode-hook (lambda () (local-set-key "\C-x\C-j" 'sumatra-jump-to-line)))
;; (add-hook 'tex-mode-hook (lambda () (local-set-key "\C-x\C-j" 'sumatra-jump-to-line)))


;(require 'sumatra-forward)


;;latex2e.info

(add-to-list 'load-path "~/.emacs.d/plugins/latex2e-help-texinfo/" )
(require 'ltx-help)

;;;; to bind latex-help to C-h C-l.
  (define-key help-map "\C-l" 'latex-help)
;;; ;To load latex-help when loading AUC-TeX or  some other LaTeX/TeX mode and bind the it to C-C i key
 (setq Latex-mode-hook
 	(function (lambda ()
 		    (define-key LaTeX-mode-map "\C-ci" 'latex-help))))

 (defun latex-help-get-cmd-alist () ;corrected version:  "Scoop up the commands in the index of the latex info manual.   The values are saved in `latex-help-cmd-alist' for speed."
    ;; mm, does it contain any cached entries
    (if (not (assoc "\\begin" latex-help-cmd-alist))
        (save-window-excursion
  	(setq latex-help-cmd-alist nil)
  	(Info-goto-node (concat latex-help-file "Command Index"))
          (end-of-buffer)
          (while (re-search-backward "^\\* \\(.+\\): *\\(.+\\)\\." nil t)
            (setq key (ltxh-buffer-substring (match-beginning 1) (match-end 1)))
            (setq value (ltxh-buffer-substring (match-beginning 2) (match-end 2)))
            (setq latex-help-cmd-alist
                  (cons (cons key value) latex-help-cmd-alist))))
      )
    latex-help-cmd-alist
    )

 (require 'info-look)
(info-lookup-add-help
     :mode 'latex-mode
     :regexp ".*"
     :parse-rule "\\\\?[a-zA-Z]+\\|\\\\[^a-zA-Z]"
     :doc-spec '(("(latex2e)Concept Index" )
                 ("(latex2e)Command Index")))

;;info
 ;; (setq Info-default-directory-list
 ;;             (append '("d:/Emacs_vin/info/")
 ;;                     Info-default-directory-list
 ;;                     '("d:/Emacs_vin/info/")))


;;color theme:choose your color-theme theme by issuing M-x color-theme-<TAB> RET
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0/")
  (require 'color-theme)
 ;(eval-after-load "color-theme"
  ; '(progn
   ;   (color-theme-initialize)
  ;  ))
(defun mylightcolor ()
  (interactive)
  (color-theme-install
   '(mylightcolor
      ((background-color . "#f0f0f0")
      (background-mode . light)
      (border-color . "#969696")
      (cursor-color . "#000000")
      (foreground-color . "#000000")
      (mouse-color . "black"))
     (fringe ((t (:background "#969696"))))
     (mode-line ((t (:foreground "#ffffff" :background "#595959"))))
     (region ((t (:background "#abb021"))))
     (font-lock-builtin-face ((t (:foreground "#f820b4"))))
     (font-lock-comment-face ((t (:foreground "#7d827d"))))
     (font-lock-function-name-face ((t (:foreground "#102cc1"))))
     (font-lock-keyword-face ((t (:foreground "#b415c1"))))
     (font-lock-string-face ((t (:foreground "#c77429"))))
     (font-lock-type-face ((t (:foreground"#199915"))))
     (font-lock-variable-name-face ((t (:foreground "#e6a00f"))))
     (minibuffer-prompt ((t (:foreground "#7299ff" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     )))
(provide 'mylightcolor)

(require 'color-theme)
;(require 'MyDarkBlue)
(color-theme-initialize)
(mylightcolor)



;; (defun myDarkBlue ()
;;   (interactive)
;;   (color-theme-install
;;    '(myDarkBlue
;;       ((background-color . "#101e2e")
;;       (background-mode . light)
;;       (border-color . "#1a1a1a")
;;       (cursor-color . "#fce94f")
;;       (foreground-color . "#eeeeec")
;;       (mouse-color . "black"))
;;      (fringe ((t (:background "#1a1a1a"))))
;;      (mode-line ((t (:foreground "#eeeeec" :background "#555753"))))
;;      (region ((t (:background "#0d4519"))))
;;      (font-lock-builtin-face ((t (:foreground "#729fcf"))))
;;      (font-lock-comment-face ((t (:foreground "#888a85"))))
;;      (font-lock-function-name-face ((t (:foreground "#edd400"))))
;;      (font-lock-keyword-face ((t (:foreground "#729fcf"))))
;;      (font-lock-string-face ((t (:foreground "#ad7fa8"))))
;;      (font-lock-type-face ((t (:foreground"#8ae234"))))
;;      (font-lock-variable-name-face ((t (:foreground "#eeeeec"))))
;;      (minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
;;      (font-lock-warning-face ((t (:foreground "Red" :bold t))))
;;      )))
;; (provide 'myDarkBlue)

;; (require 'color-theme)
;; ;(require 'MyDarkBlue)
;; (color-theme-initialize)
;; (myDarkBlue)

;;;my kbd macros
;; compile-current-frame-region_macro
(fset 'compile-current-frame-region_macro
   [?\C-c ?. ?\C-c ?\C-r return])
;;saveas-utf-8_macro
 (fset 'saveas-utf-8_macro
   [?\C-x return ?f ?u ?t ?f tab ?8 ?8 backspace return])
;; compile the region for the subfiles in latex
(fset 'compileregion
   [?\C-x ?h ?\C-c ?\C-r return])
;; insert a tab in makefile command
(fset 'insert-tab-for-makefile
   [?\M-< ?\M-% ?< ?t ?a ?b ?> return tab return ?!])

;; insert space in .Rmd yaml header
(fset 'insert-space-space-yaml
   [?\M-< ?\M-% ?< ?s ?p ?> return ?  ?  return ?!])


;; aspell
;(add-to-list 'exec-path "d:/Program Files/Aspell/bin/")
;  (setq ispell-program-name "aspell")
; (require 'ispell)

;;
  ;; Change cursor color according to mode
    (defvar hcz-set-cursor-color-color "")
    (defvar hcz-set-cursor-color-buffer "")
    (defun hcz-set-cursor-color-according-to-mode ()
      "change cursor color according to some minor modes."
      ;; set-cursor-color is somewhat costly, so we only call it when needed:
      (let ((color
             (if buffer-read-only "white"
               (if overwrite-mode "red"
                 "yellow"))))
        (unless (and
                 (string= color hcz-set-cursor-color-color)
                 (string= (buffer-name) hcz-set-cursor-color-buffer))
          (set-cursor-color (setq hcz-set-cursor-color-color color))
          (setq hcz-set-cursor-color-buffer (buffer-name)))))
    (add-hook 'post-command-hook 'hcz-set-cursor-color-according-to-mode)


;设置中文语言环境
;;(set-language-environment 'Chinese-GB)

;;写文件的编码方式
;;(set-buffer-file-coding-system 'gb2312)
(set-buffer-file-coding-system 'utf-8)

;;新建文件的编码方式
;;(setq default-buffer-file-coding-system 'gb2312)
(setq default-buffer-file-coding-system 'utf-8)

;;终端方式的编码方式
(set-terminal-coding-system 'utf-8)

;;键盘输入的编码方式
;;(set-keyboard-coding-system 'gb2312)

;;读取或写入文件名的编码方式
(setq file-name-coding-system 'utf-8)


;; set the starting default directory
;(cd "F:/SkyDrive/mydocs")

;; pandoc-mode
(add-to-list 'load-path "~/.emacs.d/plugins/pandoc-mode/")
(load "pandoc-mode")

;; markdown-mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd\\'" . markdown-mode))


;;鼠标缩放
;; For Windows
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

;; ;; evernote-mode
;; (setq evernote-username "gabriellgm@gmail.com")
;; (setq enh-enclient-command "D:/Ruby200-x64/bin/enclient.rb")
;; (require 'evernote-mode)
;; (setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8"))





(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;set the default directory
; (setq default-directory "d:/Emacs_vin/myworks/")

;; set the python-mode

(setq py-install-directory "~/.emacs.d/plugins/python-mode/")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)


; use IPython
;(setq-default py-shell-name "ipython")
;(setq-default py-which-bufname "IPython")
;(setq py-force-py-shell-name-p t)
;(require 'ipython)

(when (featurep 'python) (unload-feature 'python t))

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)

; (setq py-load-pymacs-p t)

;(require 'auto-complete-config)
;(ac-config-default)

; try to automagically figure out indentation
(setq py-smart-indentation t)

;To enable code auto-completion:

;(setq py-load-pymacs-p t)

; fix the bug that c-c c-c doesn't work
(defadvice python-send-region (around advice-python-send-region-goto-end)
      "Fix a little bug if the point is not at the prompt when you do
    C-c C-[rc]"
      (let ((oldpoint (with-current-buffer (process-buffer (python-proc)) (point)))
    	(oldinput
    	 (with-current-buffer (process-buffer (python-proc))
    	   (goto-char (point-max))
    	   ;; Do C-c C-u, but without modifying the kill ring:
    	   (let ((pmark (process-mark (get-buffer-process (current-buffer)))))
    	     (when (> (point) (marker-position pmark))
    	       (let ((ret (buffer-substring pmark (point))))
    		 (delete-region pmark (point))
    		 ret))))))
        ad-do-it
        (with-current-buffer (process-buffer (python-proc))
          (when oldinput (insert oldinput))
          (goto-char oldpoint))))
    (ad-enable-advice 'python-send-region 'around 'advice-python-send-region-goto-end)
    (ad-activate 'python-send-region)

;set for emacs for python

;(load-file "~/.emacs.d/plugins/emacs-for-python/epy-init.el")

; set debug on,M-x eval-region
;(setq debug-on-error t)

; set up flake

(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)


(setq default-fill-column 77);默认显示 80列就换行,if not work,auto-fill-mode
(setq auto-fill-mode t)

; copy cut and paste a line easily

(defun xah-cut-line-or-region ()
  "Cut the current line, or current text selection."
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (kill-region (line-beginning-position) (line-beginning-position 2)) ) )

(defun xah-copy-line-or-region ()
  "Copy current line, or current text selection."
  (interactive)
  (if (region-active-p)
      (kill-ring-save (region-beginning) (region-end))
    (kill-ring-save (line-beginning-position) (line-beginning-position 2)) ) )

; set the alt-p as fill-paragraph 段落自动换行(80列)
(global-set-key (kbd "C-x t") 'fill-paragraph);alt+p

; ess auto completion

(setq ess-use-auto-complete t)

;; list packages
;; (when (>= emacs-major-version 24)
;;   (require 'package)
;;   (package-initialize)
;;   (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;   )

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)


; format for R scripts
(add-hook 'ess-mode-hook
          (lambda ()
            (ess-set-style 'C++ 'quiet)
            (setq comment-column 4) ; 把以#开始的行缩进4空格，免得难看
            (show-paren-mode t)     ; 自动加亮跟踪括号
            ess-indent-level 2
            ess-continued-statement-offset 2
            ess-brace-offset 0
            ess-arg-function-offset 4
            ess-expression-offset 2
            ess-else-offset 0
            ess-close-brace-offset 0
))

;smart-operator

;; (add-to-list 'load-path "~/.emacs.d/plugins/smart-operator.el")
;; (require 'smart-operator)
;; (add-hook 'ess-mode-hook 'smart-operator-mode)
;; (add-hook 'inferior-ess-mode-hook 'smart-operator-mode)

; xah's tips
(defun xah-cut-line-or-region ()
  "Cut the current line, or current text selection."
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (kill-region (line-beginning-position) (line-beginning-position 2)) ) )

(defun xah-copy-line-or-region ()
  "Copy current line, or current text selection."
  (interactive)
  (if (region-active-p)
      (kill-ring-save (region-beginning) (region-end))
    (kill-ring-save (line-beginning-position) (line-beginning-position 2)) ) )

(global-set-key (kbd "<f5>") 'xah-cut-line-or-region) ; cut
(global-set-key (kbd "<f6>") 'xah-copy-line-or-region) ; copy
(global-set-key (kbd "<f7>") 'yank) ; paste

;; add on april 16

;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (auto
;;  load 'pymacs-load "pymacs" nil t)
;; (autoload 'pymacs-autoload "pymacs")
;; (eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))

;Add autocomplete rope integration
;; (ac-ropemacs-initialize)
;; (add-hook 'python-mode-hook
;;       (lambda ()
;;     (add-to-list 'ac-sources 'ac-source-ropemacs)))

;; (pymacs-load "ropemacs" "rope-")
;; (sextq ropemacs-enable-autoimport t)

; pyflake
(when (load "flymake" t)
     (defun flymake-pyflakes-init ()
       (let* ((temp-file (flymake-init-create-temp-buffer-copy
                          'flymake-create-temp-inplace))
      (local-file (file-relative-name
               temp-file
               (file-name-directory buffer-file-name))))
         (list "pyflakes" (list local-file))))

     (add-to-list 'flymake-allowed-file-name-masks
          '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)

; Add flymake errors to mini-buffer

(defun my-flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
   (let ((help (get-char-property (point) 'help-echo)))
    (if help (message "%s" help)))))

(add-hook 'post-command-hook 'my-flymake-show-help)


; knitr with ess in Emacs 2014-6-6,if two lines below be put here,it will error,just put them in default.el for vincint emacs.
;; Add support for knit and purl
;M-n r “knit” an Rnw document.
;M-n u “purl” an Rnw document.
;;(add-to-list 'load-path "~/.emacs.d/ess-knitr/")
;;(require 'ess-knitr)


;;polymode for Rmd Rnw etc
;; (setq load-path
;;       (append '("~/.emacs.d/polymode-master/"  "~/.emacs.d/polymode-master/modes/")
;;               load-path))

;; (add-to-list 'load-path "~/.emacs.d/polymode-master/")
;; (add-to-list 'load-path "~/.emacs.d/polymode-master/modes")

;; ;(require 'poly-R)
;(require 'poly-markdown)

;;; MARKDOWN
;(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))

;;; R modes
;; (add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
;; (add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
;; (add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))
;;

(global-set-key "{" '(lambda ()
  (interactive)
  (insert "{")
  (save-excursion (insert "}"))))

;;mmm-mode for rmd in ess
(require 'mmm-mode)   ;;; possibly init with (require 'mmm-auto) instead
(mmm-add-classes
 '((rmarkdown
    :submode r-mode
    :face mmm-declaration-submode-face
    :front "^```[{]r.*[}] *$"
    :back "^``` *$")))
(setq mmm-global-mode 'maybe)
(mmm-add-mode-ext-class 'markdown-mode "\\.rmd\\'" 'rmarkdown)


(defun rmarkdown-to-html ()
  (interactive)
  "Run knitr::knit2html on the current file"
  "https://gist.github.com/kohske/9128031"
  (shell-command
   (format "Rscript -e \"knitr::knit2html ('%s')\""
     (shell-quote-argument (buffer-file-name)))))


;; do this in R process
;; library (rmarkdown); render ("file_name.Rmd")

(defun ess-rmarkdown ()
   "Compile R markdown (.Rmd). Should work for any output type."
   (interactive)
   ; Check if attached R-session
   (condition-case nil
       (ess-get-process)
   (error
    (ess-switch-process)))
   (let* ((rmd-buf (current-buffer)))
     (save-excursion
       (let* ((sprocess (ess-get-process ess-current-process-name))
              (sbuffer (process-buffer sprocess))
              (buf-coding (symbol-name buffer-file-coding-system))
              (R-cmd
          (format "library(rmarkdown); rmarkdown::render(\"%s\")"
          buffer-file-name)))
    (message "Running rmarkdown on %s" buffer-file-name)
         (ess-execute R-cmd 'buffer nil nil)
         (switch-to-buffer rmd-buf)
         (ess-show-buffer (buffer-name sbuffer) nil)))))

;;add a keyboard shortcut. I use M-n s:

(define-key mmm-mode-map "\M-ns" 'ess-rmarkdown)


;; reStructuredText
;;RST
(require 'rst)
;; ;(add-hook 'text-mode-hook 'rst-text-mode-bindings)

(setq auto-mode-alist
(append '(("\\.rst$" . rst-mode)
("\\.rest$" . rst-mode)) auto-mode-alist))

; solve the waiting for remote shell
(setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")


;; ado-mode for stata
(setq load-path (cons "/Users/gabe/.emacs.d/plugins/ado-mode/lisp" load-path))
(require 'ado-mode)

;; setup the default directory
(setq default-directory (concat (getenv "HOME") "/"))

;define pipe signal for dplyr
(global-set-key (kbd "M-\.") " %>% ") ;meta(option in mac)+.

;; matlab-mode
;; (add-to-list 'load-path "/Users/gabe/.emacs.d/elpa/matlab-mode-20141227.1244/")
;;     (load-library "matlab-load")
;;     ;; Enable CEDET feature support for MATLAB code. (Optional)
;;     (matlab-cedet-setup)
;;     (add-hook 'matlab-mode
;;           (lambda ()
;;             (auto-complete-mode 1)
;;             ))
;; autocompletion-clang for c++
(add-to-list 'load-path "~/.emacs.d/plugins/")
(require 'auto-complete-clang)
(global-set-key (kbd "C-`") 'ac-complete-clang)



;; popu
;; (add-to-list 'load-path "~/.emacs.d/elph/popup-20150116.1223/")
;;  (require 'popup)

;; dirty fix for having Auto-complete everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                         (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)

;;visual-regexp

(add-to-list 'load-path "/Users/gabe/.emacs.d/elpa/visual-regexp-20140926.408/") ;; if the files are not already in the load path
(require 'visual-regexp)
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
;; if you use multiple-cursors, this is for you:
(define-key global-map (kbd "C-c m") 'vr/mc-mark)

;org-mode
;(require 'eh-org)

(require 'org)
(require 'org-exp)
(require 'org-latex)

;; org-contrib
;(require 'org-contacts)
;(require 'org-mime)
;(require 'org-bookmark)

(add-to-list 'auto-mode-alist '("\.\(org\|org_archive\)$" . org-mode))
(setq org-log-done t)
(setq org-startup-indented nil)
(setq org-confirm-babel-evaluate nil)
;; org-bable设置
; font-lock in src code blocks
(setq org-src-fontify-natively t)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (ditaa . t)
   (dot . t)
   (emacs-lisp . t)
   (gnuplot . t)
   (haskell . nil)
   (mscgen . t)
   (latex . t)
   (ocaml . nil)
   (perl . t)
   (python . t)
   (ruby . nil)
   (screen . nil)
   (sh . t)
   (sql . nil)
   (sqlite . nil)))
;; latex公式预览
;; (setq org-format-latex-header "\\documentclass{ctexart}
;; \\usepackage[usenames]{color}
;; \\usepackage{amsmath}
;; \\usepackage[mathscr]{eucal}
;; \\pagestyle{empty}             % do not remove
;; \[PACKAGES]
;; \[DEFAULT-PACKAGES]
;; % The settings below are copied from fullpage.sty
;; \\setlength{\\textwidth}{\\paperwidth}
;; \\addtolength{\\textwidth}{-3cm}
;; \\setlength{\\oddsidemargin}{1.5cm}
;; \\addtolength{\\oddsidemargin}{-2.54cm}
;; \\setlength{\\evensidemargin}{\\oddsidemargin}
;; \\setlength{\\textheight}{\\paperheight}
;; \\addtolength{\\textheight}{-\\headheight}
;; \\addtolength{\\textheight}{-\\headsep}
;; \\addtolength{\\textheight}{-\\footskip}
;; \\addtolength{\\textheight}{-3cm}
;; \\setlength{\\topmargin}{1.5cm}
;; \\addtolength{\\topmargin}{-2.54cm}")

;;export
(setq org-export-default-language "zh-CN")

;; html
(setq org-export-html-coding-system 'utf-8)
(setq org-export-html-style-include-default nil)
(setq org-export-html-style-include-scripts nil)

;; org-capture
(setq org-default-notes-file (concat org-directory "/Users/gabe/Dropbox/org/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

; cdlatex with org-mode
;(add-hook ’org-mode-hook ’turn-on-org-cdlatex)

; structured latex class
;; (add-to-list 'org-latex-classes
;;              '("article"
;;                "\\documentclass[UTF8]{ctexart}"
;;                ("\\section{%s}" . "\\section*{%s}")
;;                ("\\subsection{%s}" . "\\subsection*{%s}")
;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; directory
(setq org-directory "~/Dropbox/org")
(unless (file-exists-p org-directory)
    (make-directory org-directory))
(setq my-inbox-org-file (concat org-directory "/notes.org"))
(setq org-default-notes-file my-inbox-org-file)
;(setq org-log-done t)

;; to hide emphasis markers like ** __ ~~
(setq org-hide-emphasis-markers t)
;; to enable ~'xxx~ *"xx* =,xx= to be treated as emphasised expressions
(setcar (nthcdr 2 org-emphasis-regexp-components) " \t\n")


;; indented according to header level
(setq org-startup-indented t)
(setq org-indent-indentation-per-level 1)

; change latex engine for org-mode
(setq org-latex-to-pdf-process '("xelatex -interaction nonstopmode %f"
                                 "xelatex -interaction nonstopmode %f"))

;; ;; auto enable preview for math equations
 (setq org-startup-with-latex-preview t)
;; ;; auto enable image preview
;; (setq org-startup-with-inline-images t)
;; ;; enable highlight for code blocks
(setq org-src-fontify-natively t)
;; ;; default apps to open links
;; (setq org-file-apps '((auto-mode . emacs)
;;                         ("\\.x?html?\\'" . default)
;;                         ("\\.pdf\\'" . "Skim %s")))
;; ;; use ido for better completions
;; ;(setq org-completion-use-ido t)

;;julia-mode
(add-to-list 'load-path "~/.emacs.d/")
(require 'julia-mode)
(setq inferior-julia-program-name "/Users/gabe/julia/usr/bin/julia")

; indent for html
; mark the entire file with C-x h
;execute M-x indent-region
(setq transient-mark-mode t)

;insert pipe operator %>% using shortcut c-%
(defun then_R_operator ()
  "R - %>% operator or 'then' pipe operator"
  (interactive)
  (just-one-space 1)
  (insert "%>%")
 ; (reindent-then-newline-and-indent))
  (newline-and-indent))

(define-key global-map (kbd "C-%") 'then_R_operator)
;(define-key inferior-ess-mode-map (kbd "C-%") 'then_R_operator)

; set mouse wheel scroll slower
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

; markdown preview


;;orgtbl-mode for transfering org table to markdown table
;;  Usage Example:
;;
;; <!--- BEGIN RECEIVE ORGTBL ${1:YOUR_TABLE_NAME} -->
;; <!--- END RECEIVE ORGTBL $1 -->
;;
;; <!---
;; #+ORGTBL: SEND $1 orgtbl-to-gfm
;; | $0 |
;; -->

(defun orgtbl-to-gfm (table params)
  "Convert the Orgtbl mode TABLE to GitHub Flavored Markdown."
  (let* ((alignment (mapconcat (lambda (x) (if x "|--:" "|---"))
                               org-table-last-alignment ""))
         (params2
          (list
           :splice t
	   :hline (concat alignment "|")
           :lstart "| " :lend " |" :sep " | ")))
    (orgtbl-to-generic table (org-combine-plists params2 params))))

; auto copy the selected regions
; in emacs 25, they need change to select-enable-primary and select-enable-clipborad
(setq x-select-enable-primary t)

(setq x-select-enable-clipboard t)
(setq mouse-drag-copy-region t)
