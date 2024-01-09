#!/usr/bin/env bash

set -e

if [ ${#} -ne 3 ] ; then
  echo "Usage: ${0} <hugo|jekyll> <lorem|htmltest> <number_of_posts>"
  exit 1
fi

if [ "${1}" == "hugo" ]; then
  posts_dir="content/posts"
  pages_dir="content/"
  frontmatter_url="url"
  slash="/"
  summary="description"
elif [ "${1}" == "jekyll" ]; then
  posts_dir="_posts"
  pages_dir=""
  frontmatter_url="permalink"
  slash=""
  summary="excerpt"
else
  echo "Unknow engine"
  exit 2
fi

lorem_ipsum=$(cat ../lorem-ipsum.txt)
html_test=$(cat ../html5-tags-supported-by-markdown.html)

if [ "${2}" == "lorem" ]; then
  body=${lorem_ipsum}
elif [ "${2}" == "htmltest" ]; then
  body=${html_test}
else
  echo "Unknow post format"
  exit 3
fi

rm -rf ${pages_dir}about.md
rm -rf ${posts_dir}
mkdir -p ${posts_dir}

echo "Generating ${3} ${2} posts for $(basename ${PWD}) (${1})..."

for ((index=1; index<="${3}"; index++)); do
  if [ $(expr ${index} % 100) -eq 0 ]; then
    printf "."
  fi
  cat >> ${posts_dir}/2023-01-01-${index}.md << EOF
---
title: Test ${index}
date: 2023-01-01 00:00:00 +0000
${frontmatter_url}: /${index}${slash}
${summary}: Test ${index}
categories: ["Test Category"]
tags: ["Test Tag"]
---
${body}
EOF
done

cat >> ${pages_dir}about.md << EOF
---
title: About
date: 2023-01-01 00:00:00 +0000
${frontmatter_url}: /about${slash}
---
${body}
EOF

printf "\nFinished generating %s %s posts for %s\n" "${3}" "${2}" "$(basename ${PWD}) (${1})"
