#!/usr/bin/env bash

if [ ${#} -ne 3 ] ; then
  echo "Usage: ${0} <hugo|jekyll> <lorem|htmltest> <number_of_posts>"
  exit 1
fi

if [ "${1}" == "hugo" ]; then
  posts_dir="content/posts"
  frontmatter_url="url"
elif [ "${1}" == "jekyll" ]; then
  posts_dir="_posts"
  frontmatter_url="permalink"
else
  echo "Unknow engine"
  exit 2
fi

lorem_ipsum=$(cat << EOF
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At imperdiet dui accumsan sit amet nulla facilisi. Maecenas sed enim ut sem viverra aliquet eget. Semper viverra nam libero justo. Pharetra pharetra massa massa ultricies mi quis hendrerit dolor. Sed blandit libero volutpat sed cras ornare arcu dui vivamus. Lectus mauris ultrices eros in cursus. Curabitur vitae nunc sed velit dignissim. In hac habitasse platea dictumst quisque. Orci nulla pellentesque dignissim enim sit amet venenatis urna. Vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra. Malesuada fames ac turpis egestas. Libero nunc consequat interdum varius sit amet mattis vulputate enim. Sed vulputate mi sit amet mauris commodo quis. Non tellus orci ac auctor augue mauris augue neque. Sit amet tellus cras adipiscing enim eu turpis. Id porta nibh venenatis cras. Eu facilisis sed odio morbi quis commodo. Quam nulla porttitor massa id neque.

Enim lobortis scelerisque fermentum dui faucibus in ornare quam viverra. Dapibus ultrices in iaculis nunc sed augue lacus viverra. Mattis aliquam faucibus purus in massa tempor nec. Ornare lectus sit amet est placerat in. Porttitor leo a diam sollicitudin tempor id eu nisl. Id velit ut tortor pretium viverra suspendisse potenti nullam. Suspendisse sed nisi lacus sed. Et malesuada fames ac turpis egestas integer eget aliquet. Et molestie ac feugiat sed. Lorem ipsum dolor sit amet consectetur. Placerat vestibulum lectus mauris ultrices. At erat pellentesque adipiscing commodo elit at imperdiet. Odio euismod lacinia at quis risus sed vulputate. Senectus et netus et malesuada fames ac turpis egestas. Morbi leo urna molestie at elementum eu facilisis. Quisque non tellus orci ac auctor augue mauris augue neque. Enim praesent elementum facilisis leo vel fringilla est ullamcorper.

Eu consequat ac felis donec. Arcu dictum varius duis at consectetur. Feugiat nibh sed pulvinar proin gravida. Vivamus arcu felis bibendum ut tristique et egestas quis ipsum. Ut lectus arcu bibendum at. Proin sed libero enim sed faucibus turpis in eu mi. Imperdiet dui accumsan sit amet nulla. Vel pharetra vel turpis nunc eget. Velit laoreet id donec ultrices tincidunt arcu non sodales neque. Sed enim ut sem viverra aliquet eget sit amet tellus. Bibendum neque egestas congue quisque egestas diam in. Eros donec ac odio tempor orci dapibus ultrices in. Vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Pretium lectus quam id leo in vitae turpis.

Justo donec enim diam vulputate ut pharetra sit amet. Posuere sollicitudin aliquam ultrices sagittis orci a scelerisque. Imperdiet sed euismod nisi porta lorem mollis aliquam. Pharetra diam sit amet nisl. Tellus mauris a diam maecenas sed enim. Blandit cursus risus at ultrices mi tempus imperdiet. Nunc sed velit dignissim sodales ut eu sem integer. Magnis dis parturient montes nascetur ridiculus mus mauris vitae. Vel facilisis volutpat est velit egestas dui. Quisque egestas diam in arcu cursus. At lectus urna duis convallis convallis tellus id interdum. Habitasse platea dictumst quisque sagittis. In fermentum posuere urna nec. Vitae congue eu consequat ac. Ut lectus arcu bibendum at varius vel pharetra vel. Et molestie ac feugiat sed. Dictum varius duis at consectetur lorem donec massa sapien.

Eu mi bibendum neque egestas congue. Semper eget duis at tellus at. Semper eget duis at tellus at. Lacus viverra vitae congue eu consequat. In eu mi bibendum neque egestas congue. Ac auctor augue mauris augue neque gravida in fermentum. Maecenas accumsan lacus vel facilisis volutpat est velit egestas dui. Ultricies lacus sed turpis tincidunt id. Commodo elit at imperdiet dui accumsan sit amet nulla. Urna id volutpat lacus laoreet non. Risus nullam eget felis eget nunc. Posuere ac ut consequat semper viverra nam libero justo.

Ipsum consequat nisl vel pretium lectus quam id leo. Posuere lorem ipsum dolor sit amet consectetur adipiscing elit duis. Nunc aliquet bibendum enim facilisis gravida. Lobortis feugiat vivamus at augue eget arcu dictum varius. Rhoncus dolor purus non enim praesent elementum facilisis leo vel. Diam donec adipiscing tristique risus nec feugiat in. Amet purus gravida quis blandit turpis cursus. Sit amet consectetur adipiscing elit duis. Adipiscing commodo elit at imperdiet dui accumsan sit. Lacus sed viverra tellus in hac habitasse platea dictumst.

Sed blandit libero volutpat sed cras ornare. Lobortis elementum nibh tellus molestie nunc. Ornare massa eget egestas purus viverra accumsan in nisl. Nulla facilisi morbi tempus iaculis urna id volutpat. Velit dignissim sodales ut eu sem integer vitae. Non odio euismod lacinia at quis risus sed vulputate odio. Sit amet mattis vulputate enim nulla aliquet porttitor. Ac tortor vitae purus faucibus ornare. Lacus sed turpis tincidunt id. Egestas pretium aenean pharetra magna ac placerat. Sit amet mattis vulputate enim nulla aliquet porttitor. Ac odio tempor orci dapibus ultrices in. Auctor augue mauris augue neque gravida in. Sit amet purus gravida quis blandit turpis cursus in.

Porttitor rhoncus dolor purus non enim praesent elementum facilisis leo. Eget lorem dolor sed viverra ipsum nunc. Nulla pharetra diam sit amet nisl suscipit adipiscing bibendum est. A condimentum vitae sapien pellentesque habitant morbi tristique senectus. Amet risus nullam eget felis eget nunc lobortis mattis. Enim sit amet venenatis urna. Massa sapien faucibus et molestie ac feugiat. Non sodales neque sodales ut etiam sit. At auctor urna nunc id cursus metus aliquam eleifend. Tincidunt arcu non sodales neque sodales ut. Euismod elementum nisi quis eleifend quam adipiscing vitae. Tellus rutrum tellus pellentesque eu. Sit amet facilisis magna etiam tempor orci eu lobortis. Interdum posuere lorem ipsum dolor sit amet consectetur. Nisi scelerisque eu ultrices vitae. Pretium lectus quam id leo in vitae turpis massa. Felis imperdiet proin fermentum leo vel.
EOF
)

html_test=$(cat << EOF
## HTML5 Tags Supported by Markdown

These are the supported HTML tags, which will be generated from Markdown.

# Heading One
## Heading Two
### Heading Three
#### Heading Four
##### Heading Five
###### Heading Six

### Paragraphs

An ordinary paragraph with some text.

Another paragraph with more text to show, how the paragraph spacing is done. Note: Paragraphs with proper line height are mandatory for a good reading experience. Too little or too large makes a webpage unattractive.

### Lists

#### Unordered Lists (Nested)

- List item one
  - List item one
    - List item one
    - List item two
    - List item three
    - List item four
  - List item two
  - List item three
  - List item four
- List item two
- List item three
- List item four

#### Ordered List (Nested)

1. List item one
   1. List item one
      1. List item one
      2. List item two
      3. List item three
      4. List item four
   2. List item two
   3. List item three
   4. List item four
2. List item two
3. List item three
4. List item four

### Anchor Tag (aka Link)

This is a [link](https://example.com).

### Block-Quote Tag

Single-line block-quote:

> The most complicated skill is to be simple.

Multi-line block-quote with a cite reference:

> That’s been one of my mantras – focus and simplicity. Simple can be harder than complex. You have to work hard to get your thinking clean to make it simple. But it’s worth it in the end because once you get there, you can move mountains. —<cite>Steve Jobs</cite>

### Code Tag

A code tag markups code \`print("Hello World")\` for better separation from the text around it.

### Emphasize Tag

The emphasize tag should *italicize* text.

### Image Tag

The image tag will show the image of \`icon.webp\`, if it exists:

![Image Alt Text](icon.webp "Image Title Text")

### Pre-Formatted Tag

This tag was generated from Markdown's code fencing (\`\`\`) with no specific syntax:

\`\`\`
.header {
  margin: 2em 0;
  font-size: 36px;
  font-weight: bold;
  line-height: 1.5;
}
\`\`\`

### Strong Tag

This tag shows **bold** text.

---

## HTML5 Tags Supported by Github-Flavored Markdown

### Tables (But Without the Caption)

| Character                                                                      | Appearance |
| ------------------------------------------------------------------------------ | ----------:|
| [Donald Duck](https://en.wikipedia.org/wiki/Donald_Duck)                       |       1934 |
| [Huey, Dewey, and Louie](https://en.wikipedia.org/wiki/Huey,_Dewey,_and_Louie) |       1937 |
| [Scrooge McDuck](https://en.wikipedia.org/wiki/Scrooge_McDuck)                 |       1947 |

### Delete Tag

This tag will let you ~~strikeout~~ text.

### Footnotes

Footnotes[^1] are not tags and therefore don’t belong to the HTML standard.

---

[^1]: You can go back to the place, where the \`footnote\` was made.
EOF
)

if [ "${2}" == "lorem" ]; then
  body=${lorem_ipsum}
elif [ "${2}" == "htmltest" ]; then
  body=${html_test}
else
  echo "Unknow post format"
  exit 3
fi

rm -rf ${posts_dir}
mkdir -p ${posts_dir}

echo "Generating ${3} posts for ${1}..."

for ((index=1; index<="${3}"; index++)); do
  if [ $(expr ${index} % 100) -eq 0 ]; then
    printf "."
  fi
  cat >> ${posts_dir}/2023-01-01-${index}.md << EOF
---
title: ${index} - ${1} Test
date: 2023-01-01 00:00:00 +0000
${frontmatter_url}: /${index}
---
${body}
EOF
done

printf "\nFinished generating %s posts for %s\n" "${3}" "${1}"
