#/usr/bin/env sh

set -e

rm -rf hugo/public hugo/resources hugo/content

for site in gh-pages gh-pages-remote-theme jekyll jekyll-remote-theme; do
  rm -rf ${site}/_site ${site}/.jekyll-cache ${site}/_posts ${site}/about.md
done
