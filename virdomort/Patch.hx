package virdomort;

@:allow(Diff)
class Patch<TRef> {
  public var isPatchable : Bool = false;
  public var hasChanges : Bool = false;

  // VText
  public var isVText : Bool = false;
  public var newText : String = null;

  // VElement
  public var isVElement : Bool = false;

  public var hasAttributeChanges: Bool = false;
  public var hasAddedAttributes : Bool = false;
  public var addedAttributes : Map<String, Value> = new Map();
  public var hasRemovedAttributes : Bool = false;
  public var removedAttributes : Map<String, Value> = new Map();
  public var hasChangedAttributes : Bool = false;
  public var changedAttributes : Map<String, Value> = new Map();

  public var hasEventHandlerChanges: Bool = false;
  public var hasAddedEventHandlers : Bool = false;
  public var addedEventHandlers : Map<String, EventHandler> = new Map();
  public var hasRemovedEventHandlers : Bool = false;
  public var removedEventHandlers : Map<String, EventHandler> = new Map();
  public var hasChangedEventHandlers : Bool = false;
  public var changedEventHandlers : Map<String, EventHandler> = new Map();

  public var hasChildrenChanges : Bool = false;
  public var hasAddedChildren : Bool = false;
  public var addedChildren : Array<VNode<TRef>> = new Array();
  public var hasRemovedChildren : Bool = false;
  public var removedChildren : Array<VNode<TRef>> = new Array();
  public var hasMovedChildren : Bool = false;
  public var movedChildren : Array<{ vnode : VNode<TRef>, offset : Int }> = new Array();

  public function new() {
  }
}
