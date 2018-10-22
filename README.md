# Clojure Live

This is a Clojure-only fork of
[Emacs Live](https://github.com/overtone/emacs-live).  It tries to keep things
up-to-date as much as possible (especially the `clojure-pack` and `cider`,
which is the one I use the most) without breaking Emacs. I also avoid
committing here the `packs/stable` folder so every time you make a change to
`packs/dev` be sure you execute: `packs/update-live-packs`.


### Original Emacs Live Disclaimer

An opinionated set of defaults for getting started with a specific focus
on live coding with [Overtone](http://overtone.github.io) and
[Quil](http://github.com/quil/quil). However, it's not just a one trick
pony. It also happens to be:

* a jolly good generic Clojure hacking config
* a nice structured approach to organising your Emacs config
* modular in that functionality is organised by discrete _packs_
* a decent starting point for live coding in general
* a goldmine of config snippets to plunder and add to your own config

So, wherever you are in the multiverse, Emacs Live is ready to join you
in battle against the evil friction of poor text editor workflows.

    "Power of the horse, full force!"
                 The Space Stallions.

### Requires Emacs 24.3

It is only compatible with Emacs 24.3 and above but haven't been tested on it
thoroughly.

### Getting Started

The only way to install is to follow these steps:

1. Move aside `~/.emacs`, `~/.emacs.el` or `~/.emacs.d` if they
   currently exist.
2. Download the zip bundle (or clone the repository with git) and move
   and rename to `~/.emacs.d`
3. Launch Emacs version 24+
4. Live code your hat off!

### Clojure Hacking

You will probably need to install one of the following, depending on your code
base:

 * [Leiningen](https://github.com/technomancy/leiningen)
 * [Clojure Deps CLI](https://clojure.org/guides/deps_and_cli)

Clojure Live comes with Cider installed, check their doc because it is really
good:

  * [Cider](http://docs.cider.mx/en/latest/)

### Screenshots

<img src="https://github.com/downloads/overtone/live-coding-emacs/live-coding-config-in-use.png" alt="Screenshot 1" title="Live Coding Config Screenshot 1" />

<img src="https://github.com/downloads/overtone/live-coding-emacs/live-coding-config-in-use-2.png" alt="Screenshot 2" title="Live Coding Config Screenshot 2" />

### Video

Here's a video showing the config in use:
[Quick Intro to Live Programming with Overtone](http://vimeo.com/22798433)


## Live Packs

Emacs Live is powered by a number of special packs. Packs are
directories which are used to store isolated sets of functionality and
configuration. These may be symlinks or git submodules depending on how
you choose to store and manage your dot emacs.

### Pack Structure

Each pack consists of three components: the `init.el`, `config` dir and
`lib` dir. The `init.el` file is loaded first and it is here that you
can run arbitrary elisp. However, it is recommended that you organise
your pack by placing library code in the lib dir and individual config
files in the config dir. Emacs Live provides helper fns to make it easy
for you to load config files and for you to add lib dirs to your load
path. See the section on helper fns below.

### Shipped Packs

Emacs live ships with a few packs:

#### Foundation

A set of defaults to create a clutter free, friendly and more dynamic
Emacs foundation. Also adds fuzzy matching autocomplete functionality
for most of the Emacs minibuffer actions - such as finding files, calling
functions and switching buffers.

#### Colour

Colour highlighting includes cyberpunkd and gandalf Sam Aaron approved themes
plus zenburn-emacs. Use `color-theme-YOURCHOICE` to switch between
them. Currently cyberpunk has seen more love - patch requests accepted for
appropriate improvements to Gandalf.

#### Clojure

A set of goodies to get you hacking Clojure like a pro.

* Clojure Mode (with fancy `(λ [a] (+ a 5))` and `ƒ(+ % 5)` prettifications)
* cider (for communicating with nREPL servers)
* Auto completion (configured to work with nREPL for inline auto
  completion of documentation)
* Tailor-made colour theme
* Fancy highlighting of sexps on eval
* Rainbow parens and delimiters (to allow you to easily navigate a sea
  of parens)

#### Lang

A number of extra language modes for your joy. Languages include:

* Markdown
* Yaml
* Ruby
* SuperCollider
* JavaScript
* Extempore
* GLSL Shaders

#### Power

A boost of fantastic functionality for your live-coding
fingertips. Highlights include:

* The amazing undo-tree (live-code with confidence!)
* Textmate-like snippets
* Refheap mode for pasting snippets to refheap.com
* Github Gist support
* Quick jump mode for accessing previous locations
* Ace jump mode for jumping directly to any symbol on the screen with 2
  or three keystrokes.

### Loading Packs

By default, Emacs live will load the packs in the following order:

1. `foundation-pack`
2. `colour-pack`
3. `lang-pack`
4. `power-pack`
5. `git-pack`
6. `org-pack`
7. `clojure-pack`
8. `bindings-pack`

However, you may create a `~/.emacs-live.el` file to override this
behaviour. Simply set the var live-packs to a list of symbols
representing the packs you'd like to load up (the order will be
honoured). For example to only load the foundation and colour packs:

    (live-use-packs '(stable/foundation-pack stable/colour-pack))

If just you wish to load your own packs after the default packs then
simply use `live-add-packs`:

    (live-add-packs '(~/.live-packs/yourname-pack))

Packs are expected to reside in `~/.emacs.d/packs/` unless you specify
them with absolute paths in which case the absolute path with be
honoured.

### Creating your own Packs

Emacs Live provides a couple of useful helper fns which you can use
within your own live packs:

* `live-pack-lib-dir` this returns the path of the lib dir for the
  current pack
* `live-load-config-file` loads a config file located in the config dir
  of the current pack

It is recommended that you place your own personal packs in an external
directory. See the `user/template-pack`'s README for more information.

## Mailing List

I'm very happy to hear any feedback regarding this config. The idea is
for you to use it to get started and give you a platform to start
editing it and turning it into something personal.

Please make any comments on the Emacs Live mailing list:

http://groups.google.com/group/emacs-live
