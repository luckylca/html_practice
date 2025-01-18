
set -e


npm run build


cd dist



git init
git add -A
git commit -m 'deploy'


git push -f git@github.com:<luckylca>/html_practice.git main:gh-pages


cd -