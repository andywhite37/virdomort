package virdomort;

class VElement<TRef> {
  public var tag : String;
  public var key : Null<String>;
  public var namespace : Null<String>;
  public var attributes : Map<String, Value>;
  public var events : Map<String, EventHandler>;
  public var children : Array<VNode<TRef>>;
  public var ref : Null<TRef>;

  public function new(?tag, ?key, ?namespace, ?attributes, ?events, ?children) {
    this.tag = tag != null ? tag : "div";
    this.key = key;
    this.namespace = namespace;
    this.attributes = attributes != null ? attributes : new Map();
    this.events = events != null ? events : new Map();
    this.children = children != null ? children : [];
  }

  public function t(tag : String) {
    this.tag = tag;
    return this;
  }

  public function k(key : String) {
    this.key = key;
    return this;
  }

  public function ns(namespace : String) {
    this.namespace = namespace;
    return this;
  }

  public function attr(name : String, value : Value) {
    this.attributes.set(name, value);
    return this;
  }

  public function on(name : String, eventHandler : EventHandler) {
    this.events.set(name, eventHandler);
    return this;
  }

  public function c(child : VNode<TRef>) : VElement<TRef> {
    this.children.push(child);
    return this;
  }

  public function cs(children : Array<VNode<TRef>>) : VElement<TRef> {
    this.children = this.children.concat(children);
    return this;
  }
}
