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
    var myString = "Hello";

    var onClick = function(e : MouseEvent) {
      e.preventDefault();
      trace("click");
    };

    var vnode = createElement("div")
      .addClass("test-class test-class-1 test-class-2")
      .addClassIf(true, "class-true-1")
      .addClassIf(false, "class-true-2", "class-false-2")
      .addChildren([
        createText("Some text"),
        createElement("span").addStyle("color", "blue").addChild("My span text"),
        createElement("br"),
        createElement("span").addStyleIf("background-color", true, "#ddd").addChild("My span 2 text"),
        createElement("br"),
        "Hello, world!",
        createElement("hr"),
        createElement("button").addEvent("click", onClick).addChild("Click me")
      ]);

    trace(vnode);

    var root = Browser.document.getElementById("root");
    var node = vnode.reify();
    root.appendChild(node);
  }
}
