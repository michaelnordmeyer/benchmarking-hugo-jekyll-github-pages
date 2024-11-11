#!/usr/bin/env bash

set -e

if [ ${#} -ne 3 ] ; then
  echo "Usage: ${0} <hugo|jekyll|zola> <lorem|htmltest> <number_of_posts>"
  exit 1
fi

if [ "${1}" == "hugo" ]; then
  file_prefix=""
  posts_section="/posts"
  posts_dir="content${posts_section}"
  pages_dir="content/"
  frontmatter_delimiter="---"
  frontmatter_key_delimiter=":"
  frontmatter_url="url"
  maybe_slash="/"
  summary="description"
  taxonomy=$(cat << EOL
categories${frontmatter_key_delimiter} ["Test Category"]
tags${frontmatter_key_delimiter} ["Test Tag"]
EOL
)
elif [ "${1}" == "jekyll" ]; then
  file_prefix="2024-01-02-"
  posts_dir="_posts"
  pages_dir=""
  frontmatter_delimiter="---"
  frontmatter_key_delimiter=":"
  frontmatter_url="permalink"
  maybe_slash=""
  summary="excerpt"
  taxonomy=$(cat << EOL
categories${frontmatter_key_delimiter} ["Test Category"]
tags${frontmatter_key_delimiter} ["Test Tag"]
EOL
)
elif [ "${1}" == "zola" ]; then
  file_prefix=""
  posts_section="/posts"
  posts_dir="content${posts_section}"
  pages_dir="content/"
  frontmatter_delimiter="+++"
  frontmatter_key_delimiter=" ="
  frontmatter_url="path"
  maybe_slash="/"
  summary="description"
  taxonomy=$(cat << EOL
[taxonomies]
categories${frontmatter_key_delimiter} ["Test Category"]
tags${frontmatter_key_delimiter} ["Test Tag"]
EOL
)
else
  echo "Unknow engine"
  exit 2
fi

if [ "${2}" == "lorem" ]; then
  body=$(cat ../lorem-ipsum.md)
elif [ "${2}" == "htmltest" ]; then
  body=$(cat ../html5-tags-supported-by-markdown.md)
else
  echo "Unknow post format"
  exit 3
fi

rm -rf ${pages_dir}about.md
rm -rf ${posts_dir}
mkdir -p ${posts_dir}

echo "==> Generating ${3} ${2} posts for ${1} site '$(basename "${PWD}")'..."

post_date="2024-01-02T12:00:00Z"

for ((index=1; index<="${3}"; index++)); do
  if [ $(expr ${index} % 100) -eq 0 ]; then
    printf "."
  fi
  cat > ${posts_dir}/${file_prefix}${index}.md << EOF
${frontmatter_delimiter}
title${frontmatter_key_delimiter} "Test ${index}"
date${frontmatter_key_delimiter} ${post_date}
${frontmatter_url}${frontmatter_key_delimiter} "/${index}${maybe_slash}"
${summary}${frontmatter_key_delimiter} "Test ${index}"
${taxonomy}
${frontmatter_delimiter}
${body}
EOF
done

cat > ${pages_dir}about.md << EOF
${frontmatter_delimiter}
title${frontmatter_key_delimiter} "About"
${frontmatter_delimiter}
${body}
EOF

echo; echo "==> Finished generating ${3} ${2} posts for ${1} site '$(basename "${PWD}")'"
