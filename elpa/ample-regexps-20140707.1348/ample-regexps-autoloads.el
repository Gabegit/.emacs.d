;;; ample-regexps-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (arx-or arx-and define-arx) "ample-regexps" "c:/Users/gabes/AppData/Roaming/.emacs.d/elpa/ample-regexps-20140707.1348/ample-regexps.el"
;;;;;;  "67713d053c0fc23f971b86aa9da844de")
;;; Generated autoloads from c:/Users/gabes/AppData/Roaming/.emacs.d/elpa/ample-regexps-20140707.1348/ample-regexps.el

(autoload 'define-arx "ample-regexps" "\
Generate a custom rx-like macro under name MACRO.

See `rx' for how the generated macro can be invoked.

FORM-DEFS is a list of custom s-exp definitions to create whose
elements have the form (SYM DEF), where DEF is one of
the following:

- \"LITERAL\" -- create a matcher to match a string literally

- (regexp \"LITERAL\") -- create a match given a regexp

- SYMBOL -- create an alias for a symbol either defined earlier
  on the list or provided by `rx'

- (SUBFORM ...) -- create an alias for an application of s-exp
  subform either defined earlier on the list or provided by `rx'

- (:func #'FORM-FUNC ...) -- create an s-exp definition

The most interesting here is the last variant.  When a
corresponding rx form will be encountered, FORM-FUNC will be
called with all elements of that form as arguments (with the
first one being the form symbol itself).  FORM-FUNC must then
return a valid s-exp or a properly grouped plain regexp.

Another keywords that are recognized in the plist are:
- :min-args -- minimum number of arguments for that form (default nil)
- :max-args -- minimum number of arguments for that form (default nil)
- :predicate -- if given, all rx form arguments must satisfy it

\(fn MACRO FORM-DEFS)" nil t)

(autoload 'arx-and "ample-regexps" "\
Generate an expression to match a sequence of FORMS.

\(fn FORMS)" nil nil)

(autoload 'arx-or "ample-regexps" "\
Generate an expression to match one of FORMS.

\(fn FORMS)" nil nil)

;;;***

;;;### (autoloads nil nil ("c:/Users/gabes/AppData/Roaming/.emacs.d/elpa/ample-regexps-20140707.1348/ample-regexps-pkg.el"
;;;;;;  "c:/Users/gabes/AppData/Roaming/.emacs.d/elpa/ample-regexps-20140707.1348/ample-regexps.el")
;;;;;;  (21483 34616 730000 0))

;;;***

(provide 'ample-regexps-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ample-regexps-autoloads.el ends here
