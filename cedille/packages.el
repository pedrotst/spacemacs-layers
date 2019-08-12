;;; packages.el --- cedille layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Pedro Da Costa Abreu Junior  <pedroabreu@pal-nat186-100-104.itap.purdue.edu>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `cedille-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `cedille/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `cedille/pre-init-PACKAGE' and/or
;;   `cedille/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst cedille-packages
  '((cedille-mode :location local))
)

(defun cedille/init-cedille-mode ()
  (use-package cedille-mode
    :init
    (progn
      (require 'cedille-mode)
      (spacemacs/set-leader-keys-for-major-mode 'cedille-mode
        "w" 'cedille-start-navigation
        "f" 'cedille-mode-select-next
        "F" 'cedille-mode-select-next-alt
        "b" 'cedille-mode-select-previous
        "B" 'cedille-mode-select-previous-alt
        "p" 'cedille-mode-select-parent
        "n" 'cedille-mode-select-first-child
        "H" 'cedille-mode-interactive-highlight
        "g" 'se-mode-clear-selected
        "q" 'cedille-mode-quit
        "Q" 'cedille-mode-quit-keep-mark
        "M-s" 'cedille-mode-quit
        "C-g" 'cedille-mode-quit
        "e" 'cedille-mode-select-last
        "a" 'cedille-mode-select-first
        "i" (make-cedille-mode-buffer (cedille-mode-inspect-buffer) lambda cedille-mode-inspect nil t)
        "I" (make-cedille-mode-buffer (cedille-mode-inspect-buffer) lambda cedille-mode-inspect t t)
        "j" 'cedille-mode-jump
        "=" 'cedille-mode-replace-occurrences
        "." (make-cedille-mode-history-navigate t nil)
        "," (make-cedille-mode-history-navigate nil nil)
        "<" (make-cedille-mode-history-navigate nil t)
        ">" (make-cedille-mode-history-navigate t t)
        "r" 'cedille-mode-select-next-error
        "R" 'cedille-mode-select-previous-error
        "t" 'cedille-mode-select-first-error-in-file
        "T" 'cedille-mode-select-last-error-in-file
        "c" (make-cedille-mode-buffer (cedille-mode-context-buffer) lambda cedille-context-view-mode nil t)
        "C" (make-cedille-mode-buffer (cedille-mode-context-buffer) lambda cedille-context-view-mode t t)
        "s" (make-cedille-mode-buffer (cedille-mode-summary-buffer) cedille-mode-summary cedille-summary-view-mode nil nil)
        "S" (make-cedille-mode-buffer (cedille-mode-summary-buffer) cedille-mode-summary cedille-summary-view-mode t nil)
        "#" 'cedille-mode-highlight-occurrences
        "m" (make-cedille-mode-buffer (cedille-mode-meta-vars-buffer) lambda cedille-meta-vars-mode nil t)
        "M" (make-cedille-mode-buffer (cedille-mode-meta-vars-buffer) lambda cedille-meta-vars-mode t t)
        "K" 'cedille-mode-restart-backend
        "h" (make-cedille-mode-info-display-page nil)
        "E" 'cedille-mode-elaborate
        "$" (make-cedille-mode-customize "cedille")
        "1" 'delete-other-windows
        "P" (lambda () (interactive) (message "se-mode-selected: %s" (se-mode-selected)))
        "?" 'cedille-mode-backend-debug
        "x" 'cedille-mode-scratch-toggle
        "X" (lambda () (interactive) (cedille-mode-scratch-toggle t))
        "+" (make-cedille-mode-resize-current-window 1)
        "-" (make-cedille-mode-resize-current-window -1)
        "=" 'cedille-mode-unlock-current-window-size
        "C-x 2" 'cedille-mode-split-window
        "M-c" 'cedille-mode-scratch-copy-span
        "C-h 1" 'cedille-mode-highlight-default
        "C-h 2" 'cedille-mode-highlight-language-level
        "C-h 3" 'cedille-mode-highlight-checking-mode
        ; Interactive commands
        "C-i h" 'cedille-mode-head-normalize
        "C-i n" 'cedille-mode-normalize
        "C-i u" 'cedille-mode-single-reduction
        "C-i e" 'cedille-mode-erase
        "C-i b" 'cedille-mode-br
        "C-i B" 'cedille-mode-br-node
        "C-i t" 'cedille-mode-br-type
        "C-i r" 'cedille-mode-inspect-clear
        "C-i R" 'cedille-mode-inspect-clear-all
        ))
  ))

;;; packages.el ends here
