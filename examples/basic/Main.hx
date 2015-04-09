package examples.basic;

import js.Browser;
import js.html.MouseEvent;
import virdomort.dom.VDom.*;
using virdomort.dom.VDom;

class Main {
  static function render(count : Int) {
  }

  public static function main() : Void {
    var myString = "Hello";

    var onClick = function(e : MouseEvent) {
      e.preventDefault();
      trace("click");
    };

    var vnode = ve("div")
      .cl("test-class")
      .cln("test-class-1 test-class-2")
      .clc(true, "class-true-1", "class-false-1")
      .clc(false, "class-true-2", "class-false-2")
      .cs([
        ve("span").st("color", "blue").c("My Span"),
        ve("br"),
        ve("span").stc("background-color", true, "#ddd").c("My Span 2"),
        ve("br"),
        "Hello, world!",
        ve("hr"),
        ve("button").on("click", onClick).c("Click me")
      ]);

    trace(vnode);

    var root = Browser.document.getElementById("root");

    var node = VDom.createNode(vnode);

    root.appendChild(node);
  }
}
