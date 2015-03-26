package vdom;

import js.html.Element;
import haxe.Json;
import haxe.ds.StringMap;

typedef NodeData = {
  ?tag : String,
  ?id : String,
  ?key : String,
  ?namespace : String,
  ?classes : Array<String>,
  ?styles : Map<String, String>,
  ?attributes : Map<String, String>,
  ?properties : Map<String, Dynamic>, // This is Dynamic, because DOM element properties are not constrained to specific types
  ?events : Map<String, Dynamic -> Void>, // This is Dynamic, because event handlers have different types of arguments (Haxe itself does this too)
  ?children : Array<Child>,

  ?rootElement : Element
};

class Node {
  public var data : NodeData;

  // TODO: could allow a selector here rather than just tag
  public static function v(?tag : String, ?data : NodeData, ?children : Child) : Node {
    return new Node(tag, data, children);
  }

  // TODO: could allow a selector here rather than just tag
  public function new(?tag : String, ?data : NodeData, ?children : Child) {
    if (data == null)
      data = {};

    this.data = data;

    if (tag != null)
      this.data.tag = tag;

    if (this.data.tag == null)
      this.data.tag = "div";

    if (this.data.classes == null)
      this.data.classes = new Array<String>();

    if (this.data.styles == null)
      this.data.styles = new Map<String, String>();

    if (this.data.attributes == null)
      this.data.attributes = new Map<String, String>();

    if (this.data.properties == null)
      this.data.properties = new Map<String, Dynamic>();

    if (this.data.events == null)
      this.data.events = new Map<String, Dynamic -> Void>();

    if (this.data.children == null)
      this.data.children = new Array<Child>();

    if (children != null)
      this.data.children.push(children);
  }

  public function tag(tag : String) : Node {
    data.tag = tag;
    return this;
  }

  // Sets the Node id
  public function id(id : String) : Node {
    data.id = id;
    return this;
  }

  public function key(key : String) : Node {
    data.key = key;
    return this;
  }

  public function ns(namespace : String) : Node {
    data.namespace = namespace;
    return this;
  }

  // Add a single class to the Node
  public function cl(cl : String) : Node {
    data.classes.push(cl);
    return this;
  }

  // Adds an Array of classes to the Node
  public function cls(classes : Array<String>) : Node {
    data.classes = data.classes.concat(classes);
    return this;
  }

  // Adds classes with a className string (split on whitespace)
  public function cln(className : String) : Node {
    return cls(~/[ \t]+/g.split(className));
  }

  // Add a class based on a conditional check
  public function clc(conditional : Bool, ifTrue : String, ?ifFalse : String = "") : Node {
    return cl(conditional ? ifTrue : ifFalse);
  }

  // Sets a style on the Node
  public function st(name, value) : Node {
    data.styles.set(name, value);
    return this;
  }

  // Sets a style value based on a conditional check
  public function stc(name : String, conditional : Bool, ifTrue : String, ?ifFalse : String = "") : Node {
    return st(name, conditional ? ifTrue : ifFalse);
  }

  public function attr(name : String, value : String) : Node {
    data.attributes.set(name, value);
    return this;
  }

  public function prop(name : String, value : Dynamic) : Node {
    data.properties.set(name, value);
    return this;
  }

  public function on(name : String, listener : Dynamic -> Void) {
    data.events.set(name, listener);
    return this;
  }

  public function child(node : Node) {
    data.children.push(Node(node));
    return this;
  }

  public function children(nodes : Array<Node>) {
    data.children.push(Nodes(nodes));
    return this;
  }

  public function text(text : String) {
    data.children.push(Text(text));
    return this;
  }
}
