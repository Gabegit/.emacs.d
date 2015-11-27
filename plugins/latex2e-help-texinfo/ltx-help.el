;;; ltx-help.el --- Lookup latex commands in info pages.

;; Author: Peter Galbraith <rhogee@bathybius.meteo.mcgill.ca> or <galbrth@ac.dal.ca>
;;	Christian Lynbech <lynbech@daimi.aau.dk>
;;	Martin Sjolin <marsj@ida.liu.se>
;;	Boris Goldowsky <boris@cs.rochester.edu> 
;; Maintainer: Torsten Martinsen <bullestock@dk-online.dk>
;; Updated: 12 June 2008
;; Keywords: help, latex, info


;;; Commentary:

;; Use the function latex-help to look up a latex command or
;; environment in the latex online manual.  If point is at such a
;; command, this will be the default.

;; Installation:
;;
;; Add the following piece of code to your .emacs
;;
;;  (define-key help-map "\C-l" 'latex-help)
;;
;; to bind latex-help to C-h C-l. To load latex-help when loading AUC-TeX or
;; some other LaTeX/TeX mode and bind the it to C-C i key, add the the following
;; to you .emacs:
;;
;; (add-hook 'Latex-mode-hook 
;;           (function (lambda ()
;;		          (define-key LaTeX-mode-map "\C-ci" 'latex-help))))
;;
;; or if you do not have add-hook (a very nice package):
;;
;; (setq Latex-mode-hook 
;;	(function (lambda ()
;;		    (define-key LaTeX-mode-map "\C-ci" 'latex-help))))
;;
;;

;; The info document that this code works with is at
;; http://ctan.org/get/info/latex2e-help-texinfo.

;;; Change Log:

;;Mar  4, 1994 <lynbech@daimi.aau.dk>:
;;    Changed to my personal preferences.  I have changed the function
;;    names.  I have changed it to take a parameter, rather than just
;;    taking the current word. I am also basing it on the index rather
;;    than the node names.
;;
;;Mar 10, 1994 <marsj@ida.liu.se>:
;;    Added definition of current-word if not present.
;;    Made default value pick up a leading \ if apropriate
;;
;;Mar 11, 1994 <lynbech@daimi.aau.dk>:
;;    Changed the name of current-word into latex-help-guess. This
;;    eliminates the need for the embedded defun.
;;    Also made describe-latex work more like describe-function in its
;;    way of using default values. Now you must press return at an
;;    empty prompt to get the listed default (if any).
;;
;;Mar 10, 1994 <marsj@ida.liu.se>:
;;    Rewrote part of the describe-latex command to use the prefix
;;    argument, changed latex-help-get-cmd-obarray to return the
;;    the new array and test if it is empty or not. Add information
;;    concerning where to find the latex.texi file and emacs 18 info.el
;;  
;;Mar 28, 1994 <boris@cs.rochester.edu>:
;;    * rewrote describe-latex's command-reading code; it did not
;;      default correctly on my system.
;;    * Added latex-help-hist, for completion history.
;;    * Modified it to use show-temp-buffer, if defined, so that it will
;;      display the help buffer in accord with user preferences.
;;    * Renamed describe-latex to latex-help, for consistency with other names.
;;    * Removed unneeded (interactive) specs for latex-help-guess and
;;      latex-help-get-cmd-obarray. 
;;    * Added autoload cookies.
;;    * Doc fix.
;;
;;Mar 29, 1994 <marsj@ida.liu.se>:
;;    * made it working under epoch/emacs-18 by calling
;;	completion-read without the last argument.
;;    * made prompting similar to emacs help
;;    * moved add-hook and define keys to installation section, since
;;	the settings conflict with my own keybindings. Also, the key
;;	binding should be chosen by the end user.
;;
;; Wed Mar 30 08:45:50 1994	LYNBECH
;;	* Changed file layout to conform to FSF's standards
;;	* Tweaked latex-help-guess to include any leading backslashes
;;	* Inversed the meaning of the prefix argument. Now default is
;;        to switch buffers. Also added new variable `latex-help-split-window'
;;        to allow window splitting always.
;;      * Minor doc fixes
;;
;; Wed Apr  6 08:34:08 1994	LYNBECH
;;	* fixed latex-help-guess to be more faithful to the lexical rules
;;        of  TeX. The result is not especially elegant.
;;
;;Apr 16, 1994 <abraham@iesd.auc.dk>:
;;    Changed the name to `ltx-help.el'.
;;
;; Sat Apr  1 1995  Torsten Martinsen  (torsten@kom.auc.dk)
;;    Changed obarray to an alist where the car of each cons cell is the
;;    command name, and the cdr is the Info node describing that
;;    command. This implementation has the following advantages:
;;     - we don't need to have a lot of small redundant Info nodes; instead,
;;       we can use the Texinfo function index mechanism.
;;     - the alist is dynamically sized, so this version will work regardless
;;       of how many LaTeX commands the Info file contains.
;;    Added info on LaTeX2e Info file.
;;
;; Mon Apr 15 1996  Torsten Martinsen (bullestock@dk-online.dk)
;;    Changed node 'List of Commands' to 'Command Index' as suggested by 
;;    Ralf Fassel <ralf@natlab.research.philips.com>.
;;
;; Mon Apr 22 1996  Torsten Martinsen (bullestock@dk-online.dk)
;;    When running under FSF Emacs, use (buffer-substring-no-properties)
;;    instead of (buffer-substring) as suggested by Kurt Hornik
;;    <hornik@ci.tuwien.ac.at>. Also removed Emacs 18 support.
;;
;; Thu Jun 12 2008  Karl Berry (karl@freefriends.org)
;;    Change latex-help-file to "(latex2e)", so our names are consistent.
;;    Doc updates.
;;     
;;; Code:

(require 'info)

(if (string-match "XEmacs\\|Lucid" emacs-version)
 ; XEmacs
 (fset 'ltxh-buffer-substring (symbol-function 'buffer-substring))
 ; FSFmacs
 (fset 'ltxh-buffer-substring (symbol-function 'buffer-substring-no-properties)))

(defvar latex-help-file "(latex2e)")

(defvar latex-help-split-window nil
  "*When this is non-nil, `latex-help' will always pop up the info
buffer, rather than just switch to it.")

(defvar latex-help-hist nil
  "History for latex command help")

(defconst latex-help-cmd-alist nil
  "Alist of the commands in the index of the latex info manual,
used for validation and completion.")

;;;###autoload
(defun latex-help (cmd split)
  "Try to find info entry about LaTeX entity CMD.
CMD may be either a command or an environment.
If CMD is not a string, this function will prompt for it, eventually
with completion. If SPLIT (prefix arg.) is non-nil, latex-help will
pop up the Info buffer, rather than just switch to it. See also
variable `latex-help-split-window'."
  (interactive 
   (list
    (let* ((cw (latex-help-guess))
	   (cww (concat "\\" cw))
	   (cmd-alist (latex-help-get-cmd-alist))
	   (guess (cond ((try-completion cw cmd-alist)  cw)
			((try-completion cww cmd-alist) cww)
			(t nil)))
	   (val (completing-read (if guess 
				     (format "Describe LaTeX command (default %s): " guess)
				   "Describe LaTeX command: ")
				 cmd-alist nil t nil
				 'latex-help-hist)))
      (cdr (assoc (if (equal val "")
		      guess
		    val) cmd-alist)))
    current-prefix-arg))
  (if (not (or split latex-help-split-window))
      (Info-goto-node (concat latex-help-file cmd))
    (save-excursion
      (let ((pop-up-windows t)
	    (buffer (current-buffer)))
	(pop-to-buffer nil)
	(Info-goto-node (concat latex-help-file cmd))
	(if (fboundp 'show-temp-buffer)
	    (show-temp-buffer (current-buffer) t)
	  (pop-to-buffer buffer))))))
    
(defun latex-help-guess ()
  "Return the word point is on as a string, if it's between two
word-constituent characters. If not, but it immediately follows one,
move back first.  Otherwise, if point precedes a word constituent,
move forward first.  Otherwise, move backwards until a word constituent
is found and get that word; if you reach a newline first, move forward
instead.

This function has been tweaked to deal better with latex commands.

Return the LaTeX command point is on as a string.
"
  ;; cl: I am not claiming this to be neither elegant nor fast.
  (save-excursion
    (let ((oldpoint (point)) (start (point)) (end (point))
	  (wc "A-Za-z") (nwc "^A-Za-z"))

      (cond
       ((looking-at "\\\\[^A-Za-z]")
	(setq start (point)
	      end (+ 2 (point))))
       
       ((looking-at "\\\\[A-Za-z]+")
	(setq start (match-beginning 0)
	      end (match-end 0)))

       (t
	(skip-chars-backward wc)
	(skip-chars-backward "\\\\" (1- (point)))
	(setq start (point))

	(goto-char oldpoint)

	(skip-chars-forward "\\\\" (1+ (point)))
	(skip-chars-forward wc)
	(setq end (point))

	(if (and (eq start oldpoint) (eq end oldpoint))
	    (progn
	      (skip-chars-backward nwc
				   (save-excursion (beginning-of-line) (point)))
	      (if (eq (preceding-char) ?\n)
		  (progn
		    (skip-chars-forward nwc)
		    (setq start (point))
		    (skip-chars-forward "\\\\" (1+ (point)))
		    (skip-chars-forward wc)
		    (setq end (point)))
		(setq end (point))
		(skip-chars-backward wc)
		(skip-chars-backward "\\\\" (1- (point)))
		(setq start (point)))))
	)
       )
      (ltxh-buffer-substring start end)))
  )

(defun latex-help-get-cmd-alist ()
  "Scoop up the commands in the index of the latex info manual.
The values are saved in `latex-help-cmd-alist' for speed."
  ;; mm, does it contain any cached entries
  (if (not (assoc "\\begin" latex-help-cmd-alist))
      (save-window-excursion
	(setq latex-help-cmd-alist nil)
	(Info-goto-node (concat latex-help-file "Command Index"))
	(if (search-forward "::" nil t)
	    (progn
	      (end-of-buffer)
	      (while (re-search-backward "^\\* \\(.+\\)::$" nil t)
		(setq key (ltxh-buffer-substring (match-beginning 1) (match-end 1)))
		(setq latex-help-cmd-alist 
		      (cons (cons key key) latex-help-cmd-alist))))
	  (end-of-buffer)
	  (while (re-search-backward "^\\* \\(.+\\): *\\(.+\\)\\.$" nil t)
	    (setq key (ltxh-buffer-substring (match-beginning 1) (match-end 1)))
	    (setq value (ltxh-buffer-substring (match-beginning 2) (match-end 2)))
	    (setq latex-help-cmd-alist 
		  (cons (cons key value) latex-help-cmd-alist))))
	))
  ;; and return the alist.
  latex-help-cmd-alist
  )

(provide 'ltx-help)

;;; ltx-help.el ends here
