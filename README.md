# Virdomort

Virtual entity rendering/diffing/patching implementation for Haxe.

## Project goal

Provide an implementation of virtual "DOM" (or other entity) creation,
diffing, and patching for a variety of rendering targets, including the
browser DOM, SVG, Canvas (?), etc.

Basically, rather than drawing to a rendering target directly, the end
user will create virtual entity trees, and the framework will
either render new "real" entities, or diff and patch existing
rendered entities.

## TODO

- [ ] diff/patch algorithm for virtual nodes
- [ ] benchmarking
- [ ] more examples (DOM, SVG, canvas?, pixi.js?, etc.)

## Examples

See: [Basic example](https://github.com/andywhite37/virdomort/blob/master/examples/basic/Main.hx)
