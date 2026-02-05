# ``matplotlib_accessible``

This is some experiments of trying to get alt text from Jupyter
notebooks into sphinx-generated HTML.

There are 2 different build systems here, but both use the
same notebooks.

* `jupyter-book` : this uses Jupyter-book 1.x (not 2!) to convert
  the notebooks into HTML.

  In the `jupyter-book/` directory, use the script
  `build_and_process.sh` to generate the HTML.  It will
  then be in `content/_build/html/`.

* `sphinx` : this uses Sphinx along with `npsphinx` to convert
  the notebooks into HTML.

  In the `sphinx/` directory, do `make html` to build generate
  the HTML.  It will then be in `build/html/`

Both of these methods will use the (hacky) script `parse_alt.py` for one of the notebooks
to turn a comment in a cell into alt text.  E.g., a cell of the form:

```python
fig, ax = plt.subplots()
ax.plot(x, np.sin(x))
# alt-text: a sample figure of a sine
```

When the script encounters this, it will remove the comment from the
HTML and add the text to the `<img ... />` HTML tag as alt-text.

This is the method that seems to work the best, and it works with both
Jupyter-book and Sphinx.
