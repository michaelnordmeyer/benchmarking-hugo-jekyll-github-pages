#!/usr/bin/env sh

set -e

if [ -z ${1+x} ] || [ -z ${2+x} ]; then
  echo "Usage: $(basename "${0}") <number-of-iterations> <rbenv-ruby-version>"
  exit 1
fi

echo "==> Running benchmark for Ruby ${2} via rbenv"

global_ruby_version=$(rbenv global)
trap cleanup 1 2 3 6

cleanup() {
  echo "==> Setting global Ruby version back to ${global_ruby_version}"
  rbenv global ${global_ruby_version}
  rbenv global
  cd "${dir}"
  exit
}

echo "==> Global Ruby version: ${global_ruby_version}"
echo "==> Benchmark Ruby version: ${2}"

dir="${PWD}"
cd .. && \
  ./build-custom.sh ${2} && \
  cd "${dir}"

rbenv global ${2}

./benchmark.sh ${1}

cleanup
