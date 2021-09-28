;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Paolo Fagni"
      user-mail-address "paolo.fagni@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
        ;; (setq doom-theme 'doom-nord-light)
        (setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(after! org
  (setq org-directory "~/org/")

  (setq org-pretty-entities t
        org-hide-emphasis-markers t
        org-startup-indented t
        org-startup-with-inline-images t
        org-return-follows-link t))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;(defvar bootstrap-version)
;;(let ((bootstrap-file
;;       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
;;      (bootstrap-version 5))
;;  (unless (file-exists-p bootstrap-file)
;;    (with-current-buffer
;;        (url-retrieve-synchronously
;;         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
;;         'silent 'inhibit-cookies)
;;      (goto-char (point-max))
;;      (eval-print-last-sexp)))
;;  (load bootstrap-file nil 'nomessage))
;;
;;(use-package realgud-xdebug
;;  :straight (realgud-xdebug :fetcher "github"
;;                            :repo "https://github.com/realgud/realgud-xdebug.git"
;;                            :files ("realgud-xdebug.el"
;;                                    ("xdebug" "xdebug/*.el")))
;; :config (setq realgud:xdebug-command-name
;;                "~/Downloads/dbgpClient"))

;; Enable auto saving and backups
(setq auto-save-default t
      make-backup-files t)

;; Do not ask for quit confirmation
(setq confirm-kill-emacs nil)

;; Sets the directory in which projectile searches for projects
(setq projectile-project-search-path '("~/work/"))

;; org-roam capture templates
(setq org-roam-capture-templates '(("d" "default" plain "%?"
                                    :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                                                       "#+title: ${title}\n")
                                    :unnarrowed t)))
;; org-roam dailies templates
(setq org-roam-dailies-capture-templates '(("d" "default" entry "* [%<%Y-%m-%d %H:%M>] %?"
                                            :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))))

;; mu4a and mail config
(setq
        message-send-mail-function 'smtpmail-send-it
        smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-default-smtp-server "smtp.gmail.com"
        smtpmail-smtp-service 587
        smtpmail-stream-type  'starttls)

(setq mu4e-compose-format-flowed t)
(setq mu4e-compose-signature "Paolo")

;; This is set to 't' to avoid mail syncing issues when using mbsync
(setq mu4e-change-filenames-when-moving t)

;; Refresh mail using isync every 8 minutes
(after! mu4e
(setq mu4e-update-interval 480)
(setq mu4e-get-mail-command "mbsync -a")
(setq mu4e-maildir "~/Mail-gmail")
)
