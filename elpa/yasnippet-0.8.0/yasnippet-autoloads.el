;;; yasnippet-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (yas-global-mode yas-minor-mode) "yasnippet" "c:/Users/gabes/AppData/Roaming/.emacs.d/elpa/yasnippet-0.8.0/yasnippet.el"
;;;;;;  "aed9d3f0f5f19f76bf8d0f6b048296b0")
;;; Generated autoloads from c:/Users/gabes/AppData/Roaming/.emacs.d/elpa/yasnippet-0.8.0/yasnippet.el

(autoload 'yas-minor-mode "yasnippet" "\
Toggle YASnippet mode.

When YASnippet mode is enabled, the `yas-trigger-key' key expands
snippets of code depending on the major mode.

With no argument, this command toggles the mode.
positive prefix argument turns on the mode.
Negative prefix argument turns off the mode.

You can customize the key through `yas-trigger-key'.

Key bindings:
\\{yas-minor-mode-map}

\(fn &optional ARG)" t nil)

(defvar yas-global-mode nil "\
Non-nil if Yas-Global mode is enabled.
See the command `yas-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `yas-global-mode'.")

(custom-autoload 'yas-global-mode "yasnippet" nil)

(autoload 'yas-global-mode "yasnippet" "\
Toggle Yas minor mode in all buffers.
With prefix ARG, enable Yas-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Yas minor mode is enabled in all buffers where
`yas-minor-mode-on' would do it.
See `yas-minor-mode' for more information on Yas minor mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("c:/Users/gabes/AppData/Roaming/.emacs.d/elpa/yasnippet-0.8.0/dropdown-list.el"
;;;;;;  "c:/Users/gabes/AppData/Roaming/.emacs.d/elpa/yasnippet-0.8.0/yasnippet-pkg.el"
;;;;;;  "c:/Users/gabes/AppData/Roaming/.emacs.d/elpa/yasnippet-0.8.0/yasnippet.el")
;;;;;;  (21483 28051 106000 0))

;;;***

(provide 'yasnippet-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; yasnippet-autoloads.el ends here
