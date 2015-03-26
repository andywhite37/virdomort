package vdom;

import js.html.Element;
import haxe.Json;
import haxe.ds.StringMap;

typedef NodeData = {
  // Virtual Node properties
  ?tag : String,
  ?id : String,
  ?key : String,
  ?namespace : String,
  ?classes : Array<String>,
  ?styles : Map<String, String>,
  ?attributes : Map<String, String>,
  ?properties : Map<String, Dynamic>, // This is Dynamic, because DOM element properties are not constrained to specific types
  ?events : Map<String, Dynamic -> Void>, // This is Dynamic, because event handlers have different types of arguments (Haxe itself does this too)
  ?children : Array<Children>,

  // The real root DOM Element associated with this virtual Node.  (Set after the Node is rendered)
  ?rootElement : Element
};

class Node {
  public var data(default, null) : NodeData;

  // TODO: could allow a selector rather than just a tag name

  /**
   * Factory function (shortcut) for creating a virtual Node
   */
  public static function v(?tag : String, ?data : NodeData, ?children : Children) : Node {
    return new Node(tag, data, children);
  }

  /**
   * Constructor for a virtual Node.  See also the static `v` factory function.
   */
  public function new(?tag : String, ?data : NodeData, ?children : Children) {
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
      this.data.children = new Array<Children>();

    if (children != null)
      this.data.children.push(children);
  }

  // TODO: maybe move these fluent methods to a separate class
  // with static extension methods like "using vdom.NodeFluent;"

  /**
   * Sets the tag name on this virtual Node
   */
  public function tag(tag : String) : Node {
    data.tag = tag;
    return this;
  }

  /**
   * Sets the id on this virtual Node
   */
  public function id(id : String) : Node {
    data.id = id;
    return this;
  }

  /**
   * Sets the key on this virtual Node
   */
  public function key(key : String) : Node {
    data.key = key;
    return this;
  }

  /**
   * Sets the namespace on this virtual Node
   */
  public function ns(namespace : String) : Node {
    data.namespace = namespace;
    return this;
  }

  /**
   * Adds a single class string to this virtual Node
   */
  public function cl(cl : String) : Node {
    data.classes.push(cl);
    return this;
  }

  /**
   * Adds an Array of class strings to this virtual Node
   */
  public function cls(classes : Array<String>) : Node {
    data.classes = data.classes.concat(classes);
    return this;
  }

  /**
   * Adds multiple classes to this virtual Node (splits on whitespace)
   */
  public function cln(className : String) : Node {
    return cls(~/[ \t]+/g.split(className));
  }

  /**
   * Adds a class to this virtual node based on a conditional
   */
  public function clc(conditional : Bool, ifTrue : String, ?ifFalse : String = "") : Node {
    return cl(conditional ? ifTrue : ifFalse);
  }

  /**
   * Adds a single style to this virtual Node
   */
  public function st(name, value) : Node {
    data.styles.set(name, value);
    return this;
  }

  /**
   * Adds a single style to a virtual Node based on a conditional
   */
  public function stc(name : String, conditional : Bool, ifTrue : String, ?ifFalse : String = "") : Node {
    return st(name, conditional ? ifTrue : ifFalse);
  }

  /**
   * Adds an attribute to this virtual Node
   */
  public function attr(name : String, value : String) : Node {
    data.attributes.set(name, value);
    return this;
  }

  /**
   * Adds a properity to this virtual Node
   */
  public function prop(name : String, value : Dynamic) : Node {
    data.properties.set(name, value);
    return this;
  }

  /**
   * Adds an event binding to this virtual Node
   */
  public function on(name : String, listener : Dynamic -> Void) {
    data.events.set(name, listener);
    return this;
  }

  /**
   * Adds a child virtual Node to this virtual Node
   */
  public function child(node : Node) {
    data.children.push(Node(node));
    return this;
  }

  /**
   * Adds children virtual Nodes to this virtual Node
   */
  public function children(nodes : Array<Node>) {
    data.children.push(Nodes(nodes));
    return this;
  }

  /**
   * Adds a text node child to this virtual Node
   */
  public function text(text : String) {
    data.children.push(Text(text));
    return this;
  }
}
