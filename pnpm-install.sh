#!/bin/sh

for dir in images/final images/start morecomponents/final morecomponents/start statemanagement/final statemanagement/start sveltekit-demo/start sveltekit-demo/final; do
  pushd $dir; pnpm install; popd
done
