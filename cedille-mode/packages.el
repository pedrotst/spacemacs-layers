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

(defconst cedille-mode-packages
  '((cedille-mode :location local))
)

(defun cedille-mode/init-cedille-mode ()
  (use-package cedille-mode
	       :mode "\\*.ced\\'"
  ))

(defun cedille-mode/pre-init-cedille-mode ()
  (use-package cedille-mode)
  (progn
    (setq cedille-path "/Users/pedroabreu/gitprojects/cedille")
    (add-to-list 'load-path cedille-path)
    )
  )

;;; packages.el ends here
