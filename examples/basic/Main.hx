package examples.basic;

import js.html.Event;
import js.html.MouseEvent;
import vdom.VProps;
import vdom.VScript.h;

class Main {
  static function render(count : Int) {
  }

  public static function myHandler(s : String) {
    trace(s);
  }

  public static function main() : Void {

    var myString = "Hello";

    var vNode = h("div.my-class", {
      required: true,
      //onclick: myHandler.bind("test"),
      style: {
        display: "none"
      },
      "data-test": 123
    });
  }
}
