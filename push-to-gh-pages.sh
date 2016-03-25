mkdir build
elm make src/Main.elm --output build/index.html
git checkout gh-pages
cp build/* .
git add .
git commit -m 'update gh-pages'
git push origin gh-pages
