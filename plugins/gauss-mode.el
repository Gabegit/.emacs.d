;; gauss-mode.el - major mode for editing Gauss programs with GNU Emacs
;;
;; This major mode for GNU Emacs provides support for editing Gauss
;; source files.  It automatically indents for block structures, line
;; continuations (e.g., ...), and comments.  The usual paren matching
;; support is included.  
;;
;; In addition to automatic indentation when typing "do while" blocks,
;; "if" blocks, "proc" 's, etc., TAB indents an existing or new line to 
;; the correct level and META-; sets up a comment line.  META-return starts
;; a newline at column one, ignoring the automatic indentation.
;; To properly indent an existing region in a *.prg file, use the command
;; M-x indent-region.
;;
;;
;;
;;
;;
;;
;;
;;
;;
;;
;; To enter gauss-mode automatically when editing .prg files, put 
;; something like this in your .emacs file.
;;
;;   (autoload 'gauss-mode "gauss-mode" "Enter Gauss-mode." t)
;;   (setq auto-mode-alist (cons '("\\.prg$" . gauss-mode) auto-mode-alist))
;;   (setq gauss-mode-hook '(lambda () (setq fill-column 74)))
;;
;; Enjoy.
;;
;; THIS FILE IS A COMPLETE HACK by Steve Berry (March 1994).  It is modified from
;; octave-mode.el, which is modified from matlab-mode.el.
;; Warning: I am no lisp programmer.
;;
;; Octave-mode.el was modified by John W. Eaton (jwe@che.utexas.edu) from
;; the file matlab-mode.el which is:
;;
;; Copyright (C) 1991 Matthew R. Wette.
;; Everyone is granted permission to copy, modify and redistribute this
;; file provided:
;;   1. All copies contain this copyright notice.
;;   2. All modified copies shall carry a prominant notice stating who
;;      made the last modification and the date of such modification.
;;   3. No charge is made for this software or works derived from it.
;;      This clause shall not be construed as constraining other software
;;      distributed on the same medium as this software, nor is a
;;      distribution fee considered a charge.
;;
;;
;; Constants used in all Gauss-mode buffers.
(defconst gauss-indent-level 2
  "*The indentation in Gauss-mode.")

(defconst gauss-comment-column 40
  "*The goal comment column in Gauss-mode buffers.")


;; Syntax Table
(defvar gauss-mode-syntax-table nil
  "Syntax table used in Gauss-mode buffers.")

(if gauss-mode-syntax-table
    ()
  (setq gauss-mode-syntax-table (make-syntax-table))
  (modify-syntax-entry ?\\ "." gauss-mode-syntax-table)
  (modify-syntax-entry ?/ "." gauss-mode-syntax-table)
  (modify-syntax-entry ?* "." gauss-mode-syntax-table)
  (modify-syntax-entry ?+ "." gauss-mode-syntax-table)
  (modify-syntax-entry ?- "." gauss-mode-syntax-table)
  (modify-syntax-entry ?= "." gauss-mode-syntax-table)
  (modify-syntax-entry ?< "." gauss-mode-syntax-table)
  (modify-syntax-entry ?> "." gauss-mode-syntax-table)
  (modify-syntax-entry ?& "." gauss-mode-syntax-table)
  (modify-syntax-entry ?| "." gauss-mode-syntax-table)
  (modify-syntax-entry ?\' "\"" gauss-mode-syntax-table)
  (modify-syntax-entry ?@ "<" gauss-mode-syntax-table)
  (modify-syntax-entry ?% "<" gauss-mode-syntax-table)
  (modify-syntax-entry ?\n ">" gauss-mode-syntax-table)
  (set-syntax-table gauss-mode-syntax-table))


;; Abbrev Table
(defvar gauss-mode-abbrev-table nil
  "Abbrev table used in Gauss-mode buffers.")

(define-abbrev-table 'gauss-mode-abbrev-table ())


;; Mode Map
(defvar gauss-mode-map ()
  "Keymap used in gauss-mode.")

(if gauss-mode-map
    ()
  (setq gauss-mode-map (make-sparse-keymap))
  (define-key gauss-mode-map "\r" 'gauss-return)
  (define-key gauss-mode-map "\t" 'gauss-indent-line)
  (define-key gauss-mode-map "\M-;" 'gauss-comment)
  (define-key gauss-mode-map "\C-ct" 'gauss-line-type)
  (define-key gauss-mode-map "\C-ci" 'gauss-indent-type)
  (define-key gauss-mode-map "\M-\r" 'newline))


;; Gauss Mode
(defun gauss-mode ()
  "Major mode for editing Gauss source files.  Version 1.0, 23 Feb 1993.
Will run gauss-mode-hook if it is non-nil.  Auto-fill-mode seems to work.
Filling does not work (yet).
Special Key Bindings:
\\{gauss-mode-map}
Variables:
  gauss-indent-level                   Level to indent blocks.
  gauss-comment-column                 Goal column for on-line comments.
  fill-column                           Column used in auto-fill (default=70).
Commands:
  gauss-mode                           Enter Gauss major mode.
  gauss-return                         Handle return with indenting.
  gauss-indent-line                    Indent line for structure.
  gauss-comment                        Add comment to current line.
  gauss-comment-indent                 Compute indent for comment.
  gauss-line-type                      Tell current line type (for debugging).
  gauss-indent-type                    Tell last indent type (for debugging).
To add automatic support put something like the following in your .emacs file:
  \(autoload 'gauss-mode \"gauss-mode\" \"Enter Gauss-mode.\" t\)
  \(setq auto-mode-alist \(cons '\(\"\\\\.m[201z$\" . gauss-mode\) \
auto-mode-alist\)\)
  \(setq gauss-mode-hook '\(lambda \(\) \(setq fill-column 74\)\)\)"
  (interactive)
  (kill-all-local-variables)
  (use-local-map gauss-mode-map)
  (setq major-mode 'gauss-mode)
  (setq mode-name "Gauss")
  (setq local-abbrev-table gauss-mode-abbrev-table)
  (set-syntax-table gauss-mode-syntax-table)
  (make-local-variable 'paragraph-start)
  (setq paragraph-start (concat "^$\\|" page-delimiter))
  (make-local-variable 'paragraph-separate)
  (setq paragraph-separate paragraph-start)
  (make-local-variable 'paragraph-ignore-fill-prefix)
  (setq paragraph-ignore-fill-prefix t)
  (make-local-variable 'indent-line-function)
  (setq indent-line-function 'gauss-indent-line)
  (make-local-variable 'comment-start-skip)
  (setq comment-start-skip "[%@][ \t]*")
  (make-local-variable 'comment-column)
  (setq comment-column 'gauss-comment-column)
  (make-local-variable 'comment-indent-hook)
  (setq comment-indent-hook 'gauss-comment-indent)
  (make-local-variable 'fill-column)
  (setq fill-column default-fill-column)
  (run-hooks 'gauss-mode-hook))


(defun gauss-return ()
  "Handle carriage return in Gauss-mode."
  (interactive)
  (if (gauss-block-end-line)
      (gauss-indent-line))
  (newline)
  (gauss-indent-line))

(defun gauss-comment ()
  "Add a comment to the following line, or format if one already exists."
  (interactive)
  (cond
   ((gauss-empty-line)
    (gauss-indent-line)
    (insert "@   @") 
    (backward-char) (backward-char) (backward-char) )
   ((gauss-comment-line))
   (t
    (end-of-line)
    (re-search-backward "[^ \t^]" 0 t)
    (forward-char)
    (delete-horizontal-space)
    (if (< (current-column) gauss-comment-column)
        (indent-to gauss-comment-column)
      (insert " "))
    (insert "@   @") 
     (backward-char) (backward-char) (backward-char) )))

(defun gauss-comment-indent ()
  "Indent a comment line in Gauss-mode."
  (gauss-calc-indent))

(defun gauss-indent-line ()
  "Indent a line in Gauss-mode."
  (interactive)
  (save-excursion
    (beginning-of-line)
    (delete-horizontal-space)
    (indent-to (gauss-calc-indent)))
  (skip-chars-forward " \t"))

(defun gauss-line-type ()
  "Display type of current line.  Used in debugging."
  (interactive)
  (cond
   ((gauss-empty-line)
    (message "gauss-line-type: empty-line"))
   ((gauss-comment-line)
    (message "gauss-line-type: comment-line"))
   ((gauss-continuation-line)
    (message "gauss-line-type: continuation-line"))
   ((gauss-block-beg-end-line)
    (message "gauss-line-type: block-beg-end-line"))
   ((gauss-block-beg-line)
    (message "gauss-line-type: block-beg-line"))
   ((gauss-block-end-line)
    (message "gauss-line-type: block-end-line"))
   (t
    (message "gauss-line-type: other"))))

(defun gauss-indent-type ()
  "Display type of current or previous nonempty line.  Used in debugging."
  (interactive)
  (message (concat "gauss-ident-type: " gauss-last-indent-type)))

(defun gauss-fill-region (from to &optional justify-flag)
  "Fill the region of comments.
Prefix arg (non-nil third arg, if called from program)
means justify as well."
  (interactive "r\nP")
  (messages "gauss-fill-region not implemented yet."))

(defvar gauss-last-indent-type "unknown"
  "String to tell line type.")

(defun gauss-calc-indent ()
  "Return the appropriate indentation for this line as an int."
  (let ((indent 0))
    (save-excursion
      (forward-line -1)                 ; compute indent based on previous
      (if (gauss-empty-line)               ;   non-empty line
          (re-search-backward "[^ \t\n]" 0 t))
      (cond
       ((gauss-empty-line) 
        (setq gauss-last-indent-type "empty"))
       ((gauss-comment-line) 
        (setq gauss-last-indent-type "comment"))
       ((gauss-continuation-line)
        (setq gauss-last-indent-type "continuation")
        (setq indent (* 2 gauss-indent-level)))
       ((gauss-block-beg-end-line)
        (setq gauss-last-indent-type "block begin-end"))
       ((gauss-block-beg-line)
        (setq gauss-last-indent-type "block begin")
        (setq indent gauss-indent-level))
       ((gauss-unbal-matexp-line)
        (setq gauss-last-indent-type "unbalanced-matrix-expression")
        (setq indent (gauss-calc-matexp-indent)))
       (t
        (setq gauss-last-indent-type "other")))
      (setq indent (+ indent (current-indentation)))
      (if (= 0 (forward-line -1))
          (if (gauss-continuation-line)
              (setq indent (- indent (* 2 gauss-indent-level))))))
    (if (gauss-block-end-line) (setq indent (- indent gauss-indent-level)))
    (if (< indent 0) (setq indent 0))
    indent))


(defun gauss-empty-line ()
  "Returns t if current line is empty."
  (save-excursion
    (beginning-of-line)
    (looking-at "^[ \t]*$")))

(defun gauss-comment-line ()
  "Returns t if current line is an Gauss comment line."
  (save-excursion
    (beginning-of-line)
    (skip-chars-forward " \t")
    (looking-at "[%@]")))

(defun gauss-continuation-line ()
  "Returns t if current line ends in ... and optional comment."
  (save-excursion
    (beginning-of-line)
    (re-search-forward "\\.\\.\\.+[ \t]*\\(%.*\\)?$" (gauss-eoln-point) t)))

(defun gauss-eoln-point ()
  "Returns point for end-of-line in Gauss-mode."
  (save-excursion
    (end-of-line)
    (point)))

(defun gauss-block-beg-line ()
  "Returns t if line contains beginning of Gauss block."
  (save-excursion
    (beginning-of-line)
    (looking-at (concat "\\([^%@\n]*[ \t]\\)?" gauss-block-beg-kw))))

(defconst gauss-block-beg-kw "\\(while\\|until\\|if\\|else\\|elseif\\|proc \\)"
  "Regular expression for keywords which begin blocks in Gauss-mode.")

(defun gauss-block-end-line ()
  "Returns t if line contains end of Gauss block."
  (save-excursion
    (beginning-of-line)
    (looking-at (concat "\\([^%@\n]*[ \t]\\)?" gauss-block-end-kw))))

(defconst gauss-block-end-kw "\\(endo\\|endif\\|endp\\|else\\|elseif\\)"
  "Regular expression for keywords which end blocks.")

(defun gauss-block-beg-end-line ()
  "Returns t if line contains matching block begin-end in Gauss-mode."
  (save-excursion
    (beginning-of-line)
    (looking-at (concat
                 "\\([^%@\n]*[ \t]\\)?" gauss-block-beg-kw 
                 "." "\\([^%@\n]*[ \t]\\)?" gauss-block-end-kw))))

(defun gauss-unbal-matexp-line ()
  (if (= (gauss-calc-matexp-indent) 0)
    ()
    t))

(defun gauss-calc-matexp-indent ()
  (let ((indent 0))
    (save-excursion
      (beginning-of-line)
      (while (< (point) (gauss-eoln-point))
	(cond
	 ((looking-at "\\[")
	  (setq indent (+ indent gauss-indent-level)))
	 ((looking-at "\\]")
	  (setq indent (- indent gauss-indent-level))))
	(forward-char)))
    (* 2 indent)))

(defun gauss-comment-on-line ()
  "Returns t if current line contains a comment."
  (save-excursion
    (beginning-of-line)
    (looking-at "[^\n]*[%@]")))

(defun gauss-in-comment ()
  "Returns t if point is in a comment."
  (save-excursion
    (and (/= (point) (point-max)) (forward-char))
    (search-backward "[%@]" (save-excursion (beginning-of-line) (point)) t)))

(provide 'gauss-mode)

;; --- last line of gauss-mode.el --- 

