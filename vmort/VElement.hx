package vmort;

class VElement<TRef> {
  public var tag(default, null) : String;
  public var key(default, null) : Null<String>;
  public var namespace(default, null) : Null<String>;
  public var attributes(default, null) : Map<String, Value>;
  public var events(default, null) : Map<String, Array<EventHandler>>;
  public var children(default, null) : Array<VNode<TRef>>;
  public var ref(default, null) : Null<TRef>;

  public function new(?tag, ?key, ?namespace, ?attributes, ?events, ?children) {
    this.tag = tag != null ? tag : "div";
    this.key = key;
    this.namespace = namespace;
    this.attributes = attributes != null ? attributes : new Map();
    this.events = events != null ? events : new Map();
    this.children = children != null ? children : [];
  }

  public function setTag(tag : String) : VElement<TRef> {
    this.tag = tag;
    return this;
  }

  public function setKey(key : String) : VElement<TRef> {
    this.key = key;
    return this;
  }

  public function setRef(ref : TRef) : VElement<TRef> {
    this.ref = ref;
    return this;
  }

  public function setNamespace(namespace : String) : VElement<TRef> {
    this.namespace = namespace;
    return this;
  }

  public function addAttribute(name : String, value : Value) : VElement<TRef> {
    this.attributes.set(name, value);
    return this;
  }

  public function addAttributes(map : Map<String, Value>) : VElement<TRef> {
    for (key in map.keys()) {
      addAttribute(key, map[key]);
    }
    return this;
  }

  public function addEvent(name : String, eventHandler : EventHandler) : VElement<TRef> {
    if (!this.events.exists(name)) {
      this.events.set(name, []);
    }
    this.events.get(name).push(eventHandler);
    return this;
  }

  public function addChild(child : VNode<TRef>) : VElement<TRef>{
    this.children.push(child);
    return this;
  }

  public function addChildren(children : Array<VNode<TRef>>) : VElement<TRef> {
    for (child in children) {
      addChild(child);
    }
    return this;
  }
}
