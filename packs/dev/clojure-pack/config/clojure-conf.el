;;; clojure-conf.el --- Clojure Config

;;; Commentary:

;;; Code:

(live-add-pack-lib "clojure-mode")

(use-package clojure-mode
  :mode ("\\.clj\\'" "\\.cljs\\'" "\\.cljc\\'" "\\.clje\\'" "\\.joke\\'" "\\.bb\\'")
  :defines clojure-mode-syntax-table

  :hook ((clojure-mode . paredit-mode)
         (clojure-mode . subword-mode)
         (clojure-mode . rainbow-delimiters-mode)
         (clojure-mode . flyspell-prog-mode)
         (clojure-mode . company-mode))

  :custom
  (clojure-toplevel-inside-comment-form t "Allow coloring of (comment) form at the top level")
  (clojure-verify-major-mode nil "Disable extension verification cause it causes stack overflow")

  :bind (:map clojure-mode-map
         ("C-c l l" . align-cljjet)
         ("M-t" . live-transpose-words-with-hyphens)
         ("C-c C-z" . nil)
         ("C-h" . help-command)
         ;; better twice because I often forget
         ("C-t C-s" . clojure-toggle-keyword-string)
         ("C-t C-k" . clojure-toggle-keyword-string)
         ;; kaocha-runner.el
         ("C-c k t" . kaocha-runner-run-test-at-point)
         ("C-c k r" . kaocha-runner-run-tests)
         ("C-c k a" . kaocha-runner-run-all-tests)
         ("C-c k w" . kaocha-runner-show-warnings)
         ("C-c k h" . kaocha-runner-hide-windows))

  :config
  (require 'flycheck-clj-kondo)

  ;; Treat hyphens as a word character when transposing words
  (defvar clojure-mode-with-hyphens-as-word-sep-syntax-table
    (let ((st (make-syntax-table clojure-mode-syntax-table)))
      (modify-syntax-entry ?- "w" st)
      st))

  (defun live-transpose-words-with-hyphens (arg)
    "Treat hyphens as a word character when transposing words"
    (interactive "*p")
    (with-syntax-table clojure-mode-with-hyphens-as-word-sep-syntax-table
     (transpose-words arg)))

  (define-clojure-indent
    (fold 'defun)
    (pfold 'defun)
    (pdoseq 1)
    (slice 'defun)
    (for-all 1)
    (describe 'defun)
    (testing 'defun)
    (given 'defun)
    (using 'defun)
    (with 'defun)
    (it 'defun)
    (do-it 'defun)
    (go-loop 'defun)
    (defprotocol 'defun)
    (defrecord 'defun)
    (deftype 'defun)
    (deftype 'defun)
    (defroutes 'defun)
    (defroutes 'defun)
    (GET 2)
    (POST 2)
    (PUT 2)
    (DELETE 2)
    (HEAD 2)
    (ANY 2)
    (context 2)
    (async 'defun)
    (eval-str 'defun)
    (deftask 'defun)
    (start 'defun)
    (stop 'defun)
    (read-eval-call-test 'defun)
    (alet 'defun)
    (mlet 'defun)
    (fact 'defun)                  ;; midje
    (eval-in 'defun)               ;; classlojure
    (trace-forms (lambda (_ _) 0)) ;; re-frame macros
    (capture-output 'defun)        ;; lambdacd
    (alias 'defun)                 ;; lambdacd
    (in-parallel 'defun)           ;; lambdacd
    (either 'defun)                ;; lambdacd
    (fdef 'defun)
    (html5 'defun)                 ;; hiccup
    (is-resolved 1)                ;; unbroken-promises
    (is-rejected 1)                ;; unbroken-promises
    (->files 1)
    (stub 1)                       ;; shrubbery
    (mock 1)                       ;; shrubbery
    (spy 1)                        ;; shrubbery
    (when-joined '(2 :form :form (0))) ;; cohesic
    (defhandler 'defun)                ;; cohesic
    (exception '(1 :form))             ;; cohesic
    (defmeasurement 1)                 ;; cohesic
    ))

;;; clojure-conf.el ends here
