# mkdocs-material

If you need to be able to build the latest version of [`mkdocs`](https://github.com/mkdocs/mkdocs),
and [`mkdocs-material-insiders`](https://github.com/squidfunk/mkdocs-material-insiders)
(if you have access to the repo) with Nix, this flake may help you! This also
packages some of `mkdocs`'s more popular plugins alongside the aforementioned
packages.

This flake allows you to at least be able to `mkdocs serve` or `mkdocs build`
`mkdocs`'s actual documentation. However, these have to be done imperatively in
some cases (i.e put `mkdocs-material-insiders` in a dev shell, and running the
aforementioned commands) such as when using the `social` plugin that the insiders
build docs has, for example, as it needs to download some Google fonts during
the build process.

This, however, does not contain the derivation for `mkdocs-material`. Although
it wouldn't be difficult to do, at all, since I reckon all of the stuff it may
need have already been packaged.

## Example

You can find an example on how this can be used in the [GNAWEX](https://github.com/gnawex/gnawex/blob/main/flake.nix)
project.

## Thanks

I took a look at some PRs in nixpkgs that attempted to update these packages,
and adapted it to my use case. So without those contributions, I would most
likely struggled to figure out how to package Python projects since this is
my first go at it.
