package vdom;

class VNode {
  var selector(default, null) : String;
  var properties(default, null) : {};
  var children(default, null) : Array<VNode>;
  var key(default, null): String;
  var namespace(default, null) : String;

  public function new(selector : String, ?properties : {}, ?children : Array<VNode>, ?key : String, ?namespace : String) {
    this.selector = selector;
    this.properties = properties != null ? properties : {};
    this.children = children != null ? children : [];
    this.key = key;
    this.namespace = namespace;
  }
}
