package vmort;

class VElement<TRef> {
  public var tag(default, default) : String;
  public var key(default, default) : Null<String>;
  public var namespace(default, default) : Null<String>;
  public var attributes(default, default) : Map<String, Value>;
  public var events(default, default) : Map<String, EventHandler>;
  public var children(default, default) : Array<VNode<TRef>>;
  public var ref(default, default) : Null<TRef>;

  public function new(?tag, ?key, ?namespace, ?attributes, ?events, ?children) {
    this.tag = tag != null ? tag : "div";
    this.key = key;
    this.namespace = namespace;
    this.attributes = attributes != null ? attributes : new Map();
    this.events = events != null ? events : new Map();
    this.children = children != null ? children : [];
  }

  public function t(tag : String) : VElement<TRef> {
    this.tag = tag;
    return this;
  }

  public function k(key : String) : VElement<TRef> {
    this.key = key;
    return this;
  }

  public function ns(namespace : String) : VElement<TRef> {
    this.namespace = namespace;
    return this;
  }

  public function attr(name : String, value : Value) : VElement<TRef> {
    this.attributes.set(name, value);
    return this;
  }

  public function attrs(map : Map<String, Value>) : VElement<TRef> {
    for (key in map.keys()) {
      this.attributes.set(key, map[key]);
    }
    return this;
  }

  public function on(name : String, eventHandler : EventHandler) : VElement<TRef> {
    this.events.set(name, eventHandler);
    return this;
  }

  public function c(child : VNode<TRef>) : VElement<TRef>{
    this.children.push(child);
    return this;
  }

  public function cs(children : Array<VNode<TRef>>) : VElement<TRef> {
    this.children = this.children.concat(children);
    return this;
  }
}
