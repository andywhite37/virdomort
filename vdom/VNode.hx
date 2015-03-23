package vdom;

class VNode {
  var tag(default, null) : String;
  var props(default, null) : VProps;
  var child(default, null) : VChild;
  var key(default, null): String;
  var namespace(default, null) : String;

  public function new(tag : String, ?props : VProps, ?child : VChild, ?key : String, ?namespace : String) {
    this.tag = tag;
    this.props = props != null ? props : {};
    this.child = child != null ? child : VChild.None;
    this.key = key;
    this.namespace = namespace;
  }
}
