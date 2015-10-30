package examples.basic;

import js.Browser;
import js.html.MouseEvent;
import vmort.dom.VDom.*;
using vmort.dom.VElements;
using vmort.dom.VNodes;

class Main {
  static function render(count : Int) {
  }

  public static function main() : Void {
    var rootElement = Browser.document.getElementById("root");

    var vnode1 = el("div")
      .cls("test-class test-class-1 test-class-2")
      .clsif(true, "class-true-1")
      .clsif(false, "class-true-2", "class-false-2")
      .append([
        text("Some text"),
        el("span").css("color", "blue").child("My span text"),
        el("br"),
        el("span").cssif(true, "background-color", "#ddd").child(el("input")),
        el("br"),
        "Hello, world!",
        el("hr"),
        el("button").on("click", onClick).child("Click me")
      ]);

    trace(vnode1);

    var node1 = vnode1.reify();

    var vnode2 = el("div")
      .append([
        "My text content",
        el("span")
          .append([
            el("input")
          ])
      ]);

    var node2 = vnode2.reify();

    rootElement.appendChild(node1);
    rootElement.appendChild(node2);
  }

  static function onClick(e : MouseEvent) {
    trace("click");
  }
}
