;; ----------------------------------------------------------------------------
;;    MELPA Repository Setup (>= Emacs 24)
;; ----------------------------------------------------------------------------
;; https://melpa.org/#/getting-started
(require 'package)
(setq package-enable-at-startup nil)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;; ----------------------------------------------------------------------------
;;     use-package Setup
;; ----------------------------------------------------------------------------
(eval-when-compile
  (add-to-list 'load-path "~/.emacs.d/elpa"))

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

;; -----------------------------------------------------------------------------
;;    orginit.org org-babel Setup
;; -----------------------------------------------------------------------------
(org-babel-load-file (expand-file-name "~/.emacs.d/orginit.org"))

;; -----------------------------------------------------------------------------
;;     custom-set-variable/face Setup
;; -----------------------------------------------------------------------------
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
