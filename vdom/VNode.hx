package vdom;

class VNode {
  var tag(default, null) : String;
  var props(default, null) : Dynamic
  var children(default, null) : Array<VNode>;
  var key(default, null): String;
  var namespace(default, null) : String;

  public function new(tag : String, ?props : Dynamic, ?children : Array<VNode>, ?key : String, ?namespace : String) {
    this.tag = tag;
    this.properties = properties != null ? properties : {};
    this.children = children != null ? children : [];
    this.key = key;
    this.namespace = namespace;
  }
}
