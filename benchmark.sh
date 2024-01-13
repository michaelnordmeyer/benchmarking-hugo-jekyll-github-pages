#/usr/bin/env sh

set -e

if [ -z ${1+x} ]; then
  echo "Usage: $(basename ${0}) <number-of-iterations>"
  exit 1
fi

for site in hugo jekyll gh-pages; do
  for payload in lorem htmltest; do
    for number in 100 1000 10000 100000; do
      cd ${site}
      echo; echo  "==> Running benchmark for ${site} with ${number} x ${payload} for ${1} times..."
      [[ ${site} = "hugo" ]] && engine="hugo" || engine="jekyll"
      ../generate-posts.sh ${engine} ${payload} ${number}
      if [ ${site} = "hugo" ]; then
        hugo version
        for i in $(seq ${1}); do
          # Needs GNU time. On macOS/Homebrew it's gtime, on Linux just /usr/bin/time
          rm -rf public resources && gtime -f '%E' hugo --quiet
        done
        rm -rf public resources content
      else
        ruby -v
        rm -f Gemfile.lock && bundle --no-color 1> /dev/null
        for i in $(seq ${1}); do
          # Needs GNU time. On macOS/Homebrew it's gtime, on Linux just /usr/bin/time
          rm -rf _site && gtime -f '%E' bundle exec jekyll build --quiet
        done
        rm -rf _site .jekyll-cache _posts about.md
      fi
      cd ..
    done
  done
done
