package examples.basic;

import js.Browser;
import js.html.Event;
import js.html.MouseEvent;
import vdom.VDom;
import vdom.Node.v;

class Main {
  static function render(count : Int) {
  }

  public static function main() : Void {

    var myString = "Hello";

    var onClick = function(e : MouseEvent) {
      e.preventDefault();
      trace("click");
    };

    // Showing how to setup the virtual node using a fluent-like interface
    var node = v("div")
      .id("test")
      .cl("my-class")
      .cln("my-class-1 my-class-2  my-class-3")
      .clc(true, "my-true-class-1", "my-false-class-1")
      .clc(false, "my-true-class-2", "my-false-class-2")
      .st("text-decoration", "none")
      .stc("display", true, "block")
      .st("height", "500px")
      .st("width", "500px")
      .st("background-color", "whitesmoke")
      .attr("data-test", "123")
      .prop("required", true)
      .on("click", onClick)
      .child(
        v("span").id("my-span").text("Hi")
      )
      .children([
        v("h1").text("H1"),
        v("h2").text("H2")
      ])
      .text("Some text")
      .text("Some more text")
      .child(
        // Showing how to setup the virtual node with an inline config object
        v("div", {
          classes: [ "test-1", "test-2" ],
          attributes: [ "data-test" => "some data" ],
          events: [ "click" => function(e) { trace("clicked"); } ]
        }, Nodes([
          v("h1", Text("something"))
        ]))
      );


    trace(node);

    var root = Browser.document.getElementById("root");

    VDom.append(root, node);
  }
}
