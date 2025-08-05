# My Personal Website
## Local Run
```
docker run --rm -v "$PWD:/srv/jekyll:Z" -p 4000:4000 -it jekyll/jekyll jekyll server --watch --force-polling
```