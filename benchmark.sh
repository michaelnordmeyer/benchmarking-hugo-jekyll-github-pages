#/usr/bin/env sh

set -e

for site in hugo gh-pages gh-pages-remote-theme jekyll jekyll-remote-theme; do
  for payload in lorem htmltest; do
    for number in 100 1000 10000 100000; do
      cd ${site}
      echo "==> Running benchmark for ${site} with ${payload} for ${number} times..."
      [[ ${site} = "hugo" ]] && engine="hugo" || engine="jekyll"
      ../generate-posts.sh ${engine} ${payload} ${number}
      if [ ${site} = "hugo" ]; then
        for i in {1..5}; do
          rm -rf public resources && /usr/bin/time -h hugo --quiet
        done
      else
        for i in {1..5}; do
          rm -rf _site .jekyll-cache && /usr/bin/time -h bundle exec jekyll build --quiet
        done
      fi
      cd ..
    done
  done
done
