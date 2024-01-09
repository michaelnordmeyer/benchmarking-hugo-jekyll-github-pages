#/usr/bin/env sh

set -e

for site in hugo gh-pages jekyll; do
  for payload in lorem htmltest; do
    for number in 100 1000 10000 100000; do
      cd ${site}
      echo && echo  "==> Running benchmark for ${site} with ${payload} for ${number} times..."
      [[ ${site} = "hugo" ]] && engine="hugo" || engine="jekyll"
      ../generate-posts.sh ${engine} ${payload} ${number}
      if [ ${site} = "hugo" ]; then
        for i in {1..5}; do
          rm -rf public resources && /usr/bin/time -h hugo --quiet
        done
        rm -rf public resources content
      else
        for i in {1..5}; do
          rm -rf _site && /usr/bin/time -h bundle exec jekyll build --quiet
        done
        rm -rf _site .jekyll-cache _posts about.md
      fi
      cd ..
    done
  done
done
