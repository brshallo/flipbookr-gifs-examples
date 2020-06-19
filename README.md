# Gifs of flipbooks

Examples of building gifs of flipbooks using [flipbookr](https://github.com/EvaMaeRey/flipbookr) --> [pagedown](https://github.com/rstudio/pagedown) --> [magick](https://github.com/ropensci/magick) meant to supplement issue on [EvaMaeRey/flipbookr#22](https://github.com/EvaMaeRey/flipbookr/issues/22).

# Context

The `flipbookr` package contains functions for creating gifs of flipbooks via the `flipbookr::code_create_gif_flipbook()` or `flipbookr::chunk_create_gif_flipbook()`. However per conversation on [thread](https://twitter.com/EvaMaeRey/status/1273107587265892353) there was interest in exploring using a `pagedown` rather than `webshot` based approach (that could be more reliable in certain instances).

# Steps

1. Create your flipbook with `flipbookr`
2. Add the following css (can just add it as a code chunk directly into your RMD -- as I do in the examples). For context on why this is necessary, see [EvaMaeRey/flipbookr#21](https://github.com/EvaMaeRey/flipbookr/issues/21)

  ```css
  @media print {
    .has-continuation {
      display: block;
    }
  }
  ```

3. Use the function `flipbook_to_gif()` in "render_flipbook-gif-examples.R" to specify the RMD file of your flipbook and run (will create html, pdf, and gif outputs of your file)

# Examples of `flipbookr` gifs

**First example:**

Inspired by the [Many Models](https://r4ds.had.co.nz/many-models.html) chapter for "R for Data Science," *Grolemund*, *Wickham*.

![](https://github.com/brshallo/flipbookr-gifs-examples/blob/master/example-r4ds.gif?raw=true)

**Second example:**

Pulled from a [prior blog post](https://www.bryanshalloway.com/2020/03/04/riddler-solutions-pedestrian-puzzles/) where I solve a hypothetical city planning riddle.

Here is the *original animation*:

![](https://www.bryanshalloway.com/post/2020-03-04-riddler-solutions-pedestrian-puzzles_files/gif_city_pretty_grids.gif)

And here is a gif of the flipbook of it being built:

![](https://github.com/brshallo/flipbookr-gifs-examples/blob/master/example-riddler-solution.gif)

(Though drop final `gganimate::transition_states()` step here.)

** Third example:**

Comes from `flipbookr`s "minimal-flipbook" starting template:

__ex__

Shows that most types of flipbooking options can render nicely into a gif.

# Other notes

My second flipbook gif example uses some packages that are only available on github...

```r
if (!requireNamespace("animatrixr")) devtools::install_github('brshallo/animatrixr')
if (!requireNamespace("emo")) devtools::install_github('hadley/emo')
if (!requireNamespace("flipbookr")) devtools::install_github('EvaMaeRey/flipbookr')
```