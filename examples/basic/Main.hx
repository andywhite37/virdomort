package examples.basic;

import js.Browser;
import js.html.Event;
import js.html.MouseEvent;
import vdom.VNode.v;

class Main {
  static function render(count : Int) {
  }

  public static function main() : Void {

    var myString = "Hello";

    var vnode = v("div")
      .id("test")
      .cl("my-class")
      .cln("my-class-1 my-class-2  my-class-3")
      .clc(true, "my-true-class-1", "my-false-class-1")
      .clc(false, "my-true-class-2", "my-false-class-2")
      .st("text-decoration", "none")
      .stc("display", true, "none")
      .on("click", function(e) {
        e.preventDefault();
      })
      .toObject();

    trace(vnode);

    var el = Browser.document.createElement(vnode.tag);

    el.className = vnode.classes.setToArray().join(" ");

    /*
    for (style in vnode.styles) {
      Reflect.setField(el.style, style.name, style.value);
    }
    */
  }
}
