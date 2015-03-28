package virdomort;

class VElement<TRef> {
  public var tag : String;
  public var key : Null<String>;
  public var namespace : Null<String>;
  public var attributes : Map<String, AttributeValue>;
  public var events : Map<String, EventHandler>;
  public var children : Array<VNode<TRef>>;
  public var ref : Null<TRef>;

  public function new(tag, ?key, ?namespace, ?attributes, ?events, ?children) {
    this.tag = tag;
    this.key = key;
    this.namespace = namespace;
    this.attributes = attributes != null ? attributes : new Map();
    this.events = events != null ? events : new Map();
    this.children = children != null ? children : [];
  }
}
