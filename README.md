# Benchmarking Hugo vs. Jekyll vs. Github Pages

This repository has several Hugo, Jekyll, and Github Pages blogs with all having the same minimal theme. The Jekyll and Github Pages blogs have both local and remote theme variants. The purpose is to benchmark build times.

Note: Content for benchmarking is missing from this repository except for an about page.

I started this very basic benchmark to get an idea of how much faster [Hugo](https://gohugo.io/) builds could be, because my local [Jekyll](https://jekyllrb.com/) setup with a remote theme took several seconds to build with a remote [Minima theme](https://github.com/jekyll/minima), and building my site on [Github Pages](https://pages.github.com/) took a minute.

While I realized that a remote theme will always be fetched while building, and depending on the internet connection a local theme can save some time, I wanted to find out what else there is.

## Methodology

I deliberately chose a very simple theme called <q>[Etch](https://github.com/LukasJoswiak/etch)</q> for this test, to make sure, that differences in theme implementations are minimized and have no performance impact. As this theme is only available for Hugo, I [ported it to Jekyll](https://github.com/michaelnordmeyer/jekyll-theme-etch). The local variants are included in this repo.

Benchmarking should be done with `time` to include the launch time of the engines, and not just relying on the reported build times. The average of ten runs seems right.

## Hugo

[Hugo supports asset minification](https://gohugo.io/hugo-pipes/minification/), which the [Etch theme uses](https://github.com/LukasJoswiak/etch/blob/master/layouts/partials/head.html#L12-L28). I patched this out manually, because Jekyll doesn't support minification without third-party plugins. The CSS is included statically and Etch's dark mode was removed.

## Jekyll

The Github Pages plugin includes a bunch of other plugins, but they are not enabled in `_config.yml`.

The only additional plugins are `jekyll-feed` 0.15.1 for Github Pages and 0.17 for Jekyll, `jekyll-redirect-from` 0.16.0, and `jekyll-sitemap` 1.4.0. `jekyll-feed` and `jekyll-sitemap`, because Hugo has feeds and sitemaps enabled by default, and `jekyll-redirect-from`, because my data set has redirects in front matter for Jekyll, which I included in Hugo as well. And it's likely people will have redirects after running a blog for a couple of years.

The theme files where included in the blog itself to avoid any remote theme fetching. Etch's dark mode is not implemented, and SASS is not used as the theme doesn't use it for Hugo.

## Results

Some results for my blog's content benchmarked on a MacBook Pro M1 Max can be found [here](https://michaelnordmeyer.com/benchmarking-hugo-vs-jekyll-vs-github-pages-in-2023), but you can and should use your own blog's content for a better comparison.
