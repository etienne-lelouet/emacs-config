(setq echo-keystrokes 0.01)

(load-theme 'monokai)

(require 'windmove)
(require 'bind-key)
(bind-key "C-x <left>" 'windmove-left)
(bind-key "C-x <right>" 'windmove-right)
(bind-key "C-x <down>" 'windmove-down)
(bind-key "C-x <up>" 'windmove-up)
(unbind-key "C-z")
(unbind-key "C-x C-z")
 
(with-eval-after-load "dired"
  (define-key dired-mode-map (kbd "<mouse-2>") #'dired-mouse-find-file)
  (define-key dired-mode-map (kbd "<RET>") #'dired-find-file))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq compilation-scroll-output t)
(setq ement-save-sessions t)
(setq tab-always-indent 'complete)

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

(defun flyspell-on-for-buffer-type ()
  "Enable Flyspell appropriately for the major mode of the current buffer.  Uses `flyspell-prog-mode' for modes derived from `prog-mode', so only strings and comments get checked.  All other buffers get `flyspell-mode' to check all text.  If flyspell is already enabled, does nothing."
  (interactive)
  (if (not (symbol-value flyspell-mode)) ; if not already on
      (progn
	(if (derived-mode-p 'prog-mode)
	    (progn
	      (message "Flyspell on (code)")
	      (flyspell-prog-mode))
	  ;; else
	  (progn
	    (message "Flyspell on (text)")
	    (flyspell-mode 1)))
	;; I tried putting (flyspell-buffer) here but it didn't seem to work
	)))

(defun flyspell-toggle ()
  "Turn Flyspell on if it is off, or off if it is on.  When turning on, it uses `flyspell-on-for-buffer-type' so code-vs-text is handled appropriately."
  (interactive)
  (if (symbol-value flyspell-mode)
      (progn ; flyspell is on, turn it off
	(message "Flyspell off")
	(flyspell-mode -1))
					; else - flyspell is off, turn it on
    (flyspell-on-for-buffer-type)))

(add-hook 'find-file-hook 'flyspell-on-for-buffer-type)
(add-hook 'after-change-major-mode-hook 'flyspell-on-for-buffer-type)

(setq flyspell-issue-message-flag nil)
