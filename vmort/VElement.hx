package vmort;

using vmort.util.Arrays;

class VElement<TRef> {
  public static var DEFAULT_TAG(default, never) : String = "div";
  public static var DEFAULT_KEY(default, never) : String = null;
  public static var DEFAULT_NAMESPACE(default, never) : String = null;
  public static var KEY_ATTRIBUTE_NAME(default, never) = "key";
  public static var NAMESPACE_ATTRIBUTE_NAMES(default, never) = ["ns", "namespace"];

  public var tag(default, null) : String;
  public var key(default, null) : Null<String>;
  public var namespace(default, null) : Null<String>;
  public var attributes(default, null) : Map<String, Value>;
  public var events(default, null) : Map<String, EventHandler>;
  public var children(default, null) : Array<VNode<TRef>>;
  public var ref(default, null) : Null<TRef>;

  public function new(?tag, ?attributes, ?events, ?children) {
    this.tag = DEFAULT_TAG;
    this.key = DEFAULT_KEY;
    this.namespace = DEFAULT_NAMESPACE;
    this.attributes = new Map();
    this.events = new Map();
    this.children = [];
    this.ref = null;
    if (tag != null) setTag(tag);
    if (attributes != null) addAttributes(attributes);
    if (events != null) addEvents(events);
    if (children != null) addChildren(children);
  }

  public function setTag(tag : String) : VElement<TRef> {
    this.tag = tag;
    return this;
  }

  public function setKey(key : String) : VElement<TRef> {
    this.key = key;
    return this;
  }

  public function setNamespace(namespace : String) : VElement<TRef> {
    this.namespace = namespace;
    return this;
  }

  public function addAttribute(name : String, value : Value) : VElement<TRef> {
    return if (name == KEY_ATTRIBUTE_NAME) {
      setKey(value.toString());
    } else if (NAMESPACE_ATTRIBUTE_NAMES.contains(name)) {
      setNamespace(value.toString());
    } else {
      this.attributes.set(name, value);
      this;
    }
  }
  public function attr(name, value) return addAttribute(name, value);

  public function addAttributes(attributes : Map<String, Value>) : VElement<TRef> {
    for (name in attributes.keys()) {
      addAttribute(name, attributes[name]);
    }
    return this;
  }
  public function attrs(attributes) return addAttributes(attributes);

  public function addEvent(name : String, eventHandler : EventHandler) : VElement<TRef> {
    this.events.set(name, eventHandler);
    return this;
  }
  public function on(name, eventHandler) return addEvent(name, eventHandler);

  public function addEvents(events : Map<String, EventHandler>) {
    for (name in events.keys()) {
      addEvent(name, events[name]);
    }
    return this;
  }

  public function addChild(child : VNode<TRef>) : VElement<TRef>{
    this.children.push(child);
    return this;
  }
  public function child(child) return addChild(child);

  public function addChildren(children : Array<VNode<TRef>>) : VElement<TRef> {
    for (child in children) {
      addChild(child);
    }
    return this;
  }
  public function append(children) return addChildren(children);

  public function setRef(ref : TRef) : VElement<TRef> {
    this.ref = ref;
    return this;
  }
}
