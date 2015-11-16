# Iconathon *Light*

Iconathon Light is an icon task runner that turns a directory of svg icons into an icon font.

_NOTE: Iconathon Light only works with OSX.


## Set Up

First, you’ll need to…

1. `brew install imagemagick` (version => `6.9.0-3`)
2. `brew install graphicsmagick` (version => `1.3.20`)
3. `brew install Caskroom/cask/xquartz`
4. `brew install LibRSVG` (version => `2.36.3_1`)
6. `npm install`

Once you’ve got all the packages, run…

- `./tools/build`

This will run the gulp script that watches the '/src/icons' directory and renders the icon font in the '/build/fonts' directory.


## Tips for Drawing

- If you’re adding a third-party logo, the drawing has already been done for you!
  Don’t redraw or modify third-party logos in any way, unless you need to make it
  monochrome. Use the same icon for all the weights for third-party icons.

- Using border radius is great, but sometimes the icon font doesn’t recognize
  them and you get hard edges. To get around this, you can join the
  shapes and flatten them. Sketch will draw the appropriate handles and bezier
  curves. The downside is that this is destructive, it’s harder to align things
  afterward, and means you have to redraw stuff later if you want to change it.
  Border radius seems to work with simpler shapes like rectangles, so test it
  before flattening.

- Before you do the flattening, though, it’s nice to keep the “source” off to
  the side. If you need to come back and redraw, it’s nice to have the original
  paths.

- Don’t use borders on vectors, especially not inside/outside borders which aren’t
  supported in SVG.

- Make sure none of the paths go outside of the artboard. If so, the
  glyph in the icon font will get misaligned. Draw inside the lines.

- All paths should be black (#000000).
