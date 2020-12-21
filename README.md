# github-local-redirect

github.com is too long to type. Run this simple web server on your computer so you can type `gh/vilhelmprytz` into your web browser instead of `github.com/vilhelmprytz`.

## Instructions

Make sure you have the required dependencies installed before continuing.

- Python 3.9
- `pipenv` extension (install with `pip install pipenv`)
- Git

Once you got the dependencies, run this as non-root.

```bash
bash <(curl -s https://raw.githubusercontent.com/vilhelmprytz/github-local-redirect/master/setup.sh)
```

It will install the app for you. Once that's done, add this line to the `/etc/hosts` file. Replace the keyword `gh` with something else if you want something else.

```text
127.0.0.1 gh
```

## Contributors ✨

Created by [Vilhelm Prytz](https://github.com/vilhelmprytz).
