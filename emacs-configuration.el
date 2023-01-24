(setq echo-keystrokes 0.01)

(load-theme 'monokai)

(require 'windmove)
(require 'bind-key)
(bind-key "C-x <left>" 'windmove-left)
(bind-key "C-x <right>" 'windmove-right)
(bind-key "C-x <down>" 'windmove-down)
(bind-key "C-x <up>" 'windmove-up)

(with-eval-after-load "dired"
  (define-key dired-mode-map (kbd "<mouse-2>") #'dired-mouse-find-file)
  (define-key dired-mode-map (kbd "<RET>") #'dired-find-file))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq compilation-scroll-output t)
(setq ement-save-sessions t)

