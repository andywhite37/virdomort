package vdom;

import js.html.Element;
import haxe.Json;

typedef Classes = Array<String>;
typedef StyleMap = Map<String, String>;
typedef AttributeMap = Map<String, String>;
typedef PropertyMap = Map<String, Dynamic>;
typedef EventHandler = Dynamic -> Void;
typedef EventHandlerMap = Map<String, EventHandler>;
typedef Children = Array<Child>;

typedef NodeData = {
  // Virtual Node properties
  ?tag : String,
  ?id : String,
  ?key : String,
  ?namespace : String,
  ?classes : Classes,
  ?styles : StyleMap,
  ?attributes : AttributeMap,
  ?properties : PropertyMap, // This is Dynamic, because DOM element properties are not constrained to specific types
  ?events : EventHandlerMap, // This is Dynamic, because event handlers have different types of arguments (Haxe itself does this too)
  ?children : Children,

  // The real root DOM Element associated with this virtual Node.  (Set after the Node is rendered)
  ?rootElement : Element
};

class Node {
  public var data(default, null) : NodeData;

  // TODO: could allow a selector rather than just a tag name

  /**
   * Factory function (shortcut) for creating a virtual Node
   */
  public static function v(?tag : String, ?data : NodeData, ?child : Child) : Node {
    return new Node(tag, data, child);
  }

  /**
   * Constructor for a virtual Node.  See also the static `v` factory function.
   */
  public function new(?tag : String, ?data : NodeData, ?child: Child) {
    if (data == null)
      data = {};

    this.data = data;

    if (tag != null)
      this.data.tag = tag;

    if (this.data.tag == null)
      this.data.tag = "div";

    if (this.data.classes == null)
      this.data.classes = new Classes();

    if (this.data.styles == null)
      this.data.styles = new StyleMap();

    if (this.data.attributes == null)
      this.data.attributes = new AttributeMap();

    if (this.data.properties == null)
      this.data.properties = new PropertyMap();

    if (this.data.events == null)
      this.data.events = new EventHandlerMap();

    if (this.data.children == null)
      this.data.children = new Children();

    if (child != null)
      this.data.children.push(child);
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
   * Adds a single class string to this virtual Node.  This does not split the string on whitespace.
   * Use `cln` to add mutliple classes from a single string.
   */
  public function cl(cl : String) : Node {
    data.classes.push(cl);
    return this;
  }

  /**
   * Adds an Array of class strings to this virtual Node.
   */
  public function cls(classes : Array<String>) : Node {
    data.classes = data.classes.concat(classes);
    return this;
  }

  /**
   * Adds multiple classes from a single string to this virtual Node (split on whitespace).
   */
  public function cln(className : String) : Node {
    return cls(~/[ \t]+/g.split(className));
  }

  /**
   * Adds a class to this virtual node based on a conditional.
   *
   * If the conditional is true, the ifTrue class value is added, otherwise the ifFalse value is added.
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
   *
   * If the conditional is true, the ifTrue style value is used, otherwise the ifFalse value is used.
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
   * Adds mutliple attributes to this virtual Node.
   */
  public function attrs(attributes : AttributeMap) : Node {
    for (key in attributes.keys()) {
      data.attributes.set(key, attributes.get(key));
    }
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
  public function on(name : String, listener : EventHandler) {
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
