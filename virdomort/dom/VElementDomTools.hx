package virdomort.dom;

import js.html.Node;
using virdomort.VElementTools;

class VElementDomTools {
  public static var classes(default, never) = "classes";
  public static var styles(default, never) = "styles";

  public static function ve(tag, ?key, ?namespace, ?attributes, ?events, ?children) : VNode<Node> {
    return VElement(new VElement<Node>(tag, key, namespace, attributes, events, children));
  }

  /*
  public static function id<TRef>(velement : VElement<TRef>, v : String) : VElement<TRef> {
    velement.attr("id", v);
    return velement;
  }

  public function cl<TRef>(element : Element<TRef>, value : String) : Element<TRef> {
    element.ensureClasses();
    element.attributes.get(classes).
    return this;
  }

  public function cls(classes : Array<String>) : Node {
    data.classes = data.classes.concat(classes);
    return this;
  }

  public function cln(className : String) : Node {
    return cls(~/[ \t]+/g.split(className));
  }

  public function clc(conditional : Bool, ifTrue : String, ?ifFalse : String = "") : Node {
    return cl(conditional ? ifTrue : ifFalse);
  }

  public function st(name, value) : Node {
    data.styles.set(name, value);
    return this;
  }

  public function stc(name : String, conditional : Bool, ifTrue : String, ?ifFalse : String = "") : Node {
    return st(name, conditional ? ifTrue : ifFalse);
  }

  public function attr(name : String, value : String) : Node {
    data.attributes.set(name, value);
    return this;
  }

  public function attrs(attributes : AttributeMap) : Node {
    for (key in attributes.keys()) {
      data.attributes.set(key, attributes.get(key));
    }
    return this;
  }

  public function prop(name : String, value : Dynamic) : Node {
    data.properties.set(name, value);
    return this;
  }

  public function on(name : String, listener : EventHandler) {
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

  static function ensureClasses<TRef>(element : Element<TRef>) {
    if (element.attributes.get(classes) == null) {
      element.attributes.set(classes, new Array<String>());
    }
  }
  */
}
