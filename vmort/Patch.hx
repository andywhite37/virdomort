package vmort;

import vmort.VNode.VNodeType;
using vmort.util.Arrays;
using vmort.util.Maps;

@:allow(Diff)
class Patch<TRef> {
  public var isPatchable : Bool = false;
  public var isVText : Bool = false;
  public var isVElement : Bool = false;

  public var changedText : String = null;
  public function hasChangedText() : Bool return changedText != null;

  public var addedAttributes : Map<String, Value> = new Map();
  public var removedAttributes : Map<String, Value> = new Map();
  public var changedAttributes : Map<String, Value> = new Map();
  public function hasAddedAttributes() : Bool return addedAttributes.isFull();
  public function hasRemovedAttributes() : Bool return removedAttributes.isFull();
  public function hasChangedAttributes() : Bool return changedAttributes.isFull();
  public function hasAttributeDiffs() : Bool return hasAddedAttributes() || hasRemovedAttributes() || hasChangedAttributes();

  public var addedEvents : Map<String, EventHandler> = new Map();
  public var removedEvents : Map<String, EventHandler> = new Map();
  public var changedEvents : Map<String, EventHandler> = new Map();
  public function hasAddedEvents() : Bool return addedEvents.isFull();
  public function hasRemovedEvents() : Bool return removedEvents.isFull();
  public function hasChangedEvents() : Bool return changedEvents.isFull();
  public function hasEventDiffs() : Bool return hasAddedEvents() || hasRemovedEvents() || hasChangedEvents();

  public var addedChildren : Array<VNode<TRef>> = new Array();
  public var removedChildren : Array<VNode<TRef>> = new Array();
  public var movedChildren : Array<{ vnode : VNode<TRef>, offset : Int }> = new Array();
  public function hasAddedChildren() : Bool return addedChildren.isFull();
  public function hasRemovedChildren() : Bool return removedChildren.isFull();
  public function hasMovedChildren() : Bool return movedChildren.isFull();
  public function hasChildrenDiffs() : Bool return hasAddedChildren() || hasRemovedChildren() || hasMovedChildren();

  public function hasChanges() : Bool {
    return if (isVText) {
      hasChangedText();
    } else if (isVElement) {
      hasAttributeDiffs() || hasEventDiffs() || hasChildrenDiffs();
    } else {
      false;
    }
  }

  public function new() {
  }
}
