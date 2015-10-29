package vmort.dom;

import js.Browser;
import js.Error;
import js.html.Element;
import js.html.Node;
import js.html.Text;
import vmort.ValOrFunc;
import vmort.VNode;
import vmort.VElement;
import vmort.VText;
using vmort.dom.Elements;
using vmort.dom.VElements;
using vmort.dom.VNodes;

class VDom {
  public static function createElement(
    ?tag : ValOrFunc<String>,
    ?key : ValOrFunc<String>,
    ?namespace : ValOrFunc<String>,
    ?attributes : ValOrFunc<Map<String, Value>>,
    ?events : ValOrFunc<Map<String, Array<EventHandler>>>,
    ?children : ValOrFunc<Array<VNode<Node>>>) : VElement<Node> {
    return new VElement<Node>(tag.getValue(), key.getValue(), namespace.getValue(), attributes.getValue(), events.getValue(), children.getValue());
  }

  public static function createText(text : ValOrFunc<String>) : VText<Node> {
    return new VText<Node>(text.getValue());
  }

  public static function updateNode(vnodeOld : VNode<Node>, vnodeNew : VNode<Node>) : Void {
    var patch = Diff.getPatch(vnodeOld, vnodeNew);

    if (!patch.isPatchable) {
      // Can't patch the node, so just replace it with vnodeNew
      replaceNode(vnodeOld, vnodeNew);
    }

    if (!patch.hasChanges) {
      // Nothing to do, just copy the ref over
      vnodeNew.setRef(vnodeOld.getRef());
      return;
    }

    if (patch.isVText) {
      updateText(vnodeOld, vnodeNew, patch);
      return;
    }

    if (patch.isVElement) {
      updateElement(vnodeOld, vnodeNew, patch);
      return;
    }

    // TODO: not sure if we can get here
    replaceNode(vnodeOld, vnodeNew);
  }

  static function updateText(vnodeOld : VNode<Node>, vnodeNew : VNode<Node>, patch : Patch<Node>) : Void {
    var textOld : Text = cast vnodeOld.toVText().ref;
    var textNew : Text = cast textOld.cloneNode(true);
    textNew.nodeValue = patch.changedText;
    vnodeNew.setRef(textNew);
  }

  static function updateElement(vnodeOld : VNode<Node>, vnodeNew : VNode<Node>, patch : Patch<Node>) : Void {
    var elementOld : Element = cast vnodeOld.getRef();
    var elementNew : Element = cast elementOld.cloneNode(true);
    updateAttributes(vnodeOld, vnodeNew, elementNew, patch);
    updateEvents(vnodeOld, vnodeNew, elementNew, patch);
    updateChildren(vnodeOld, vnodeNew, elementNew, patch);
    vnodeNew.setRef(vnodeOld.getRef());
  }

  static function updateAttributes(vnodeOld : VNode<Node>, vnodeNew : VNode<Node>, element : Element, patch : Patch<Node>) : Void {
    if (!patch.hasAttributeDiffs()) {
      return;
    }

    if (patch.hasAddedAttributes()) {
      var added = patch.addedAttributes;
      for (key in added) {
        element.addAttribute(key, added[key]);
      }
    }

    if (patch.hasRemovedAttributes()) {
      var removed = patch.removedAttributes;
      for (key in removed) {
        element.removeAttribute(key);
      }
    }

    if (patch.hasChangedAttributes()) {
      var changed = patch.changedAttributes;
      for (key in changed) {
        element.setAttribute(key, changed[key]);
      }
    }
  }

  static function updateEvents(vnodeOld : VNode<Node>, vnodeNew : VNode<Node>, element : Element, patch : Patch<Node>) : Void {
    if (!patch.hasEventDiffs()) {
      return;
    }

    if (patch.hasAddedEvents()) {
      for (key in patch.addedEvents.keys()) {
        element.addEvent('on$key', patch.addedEvents[key]);
      }
    }

    if (patch.hasRemovedEvents()) {
      for (key in patch.removedEvents) {
        element.removeEvent('on$key');
      }
    }

    if (patch.hasChangedEvents()) {
      for (key in patch.changedEvents.keys()) {
        element.addEvent('on$key', patch.changedEvents[key]);
      }
    }
  }

  static function updateChildren(vnodeOld : VNode<Node>, vnodeNew : VNode<Node>, element : Element, patch : Patch<Node>) : Void {
    if (!patch.hasChildrenDiffs()) {
      return;
    }

    if (patch.hasAddedChildren()) {
      var added = patch.addedChildren;
      for (vchild in added) {
      }
    }

    if (patch.hasRemovedChildren()) {
    }

    if (patch.hasMovedChildren()) {
    }
  }

  static function replaceNode(vnodeOld : VNode<Node>, vnodeNew : VNode<Node>) : Void {
    var nodeOld = vnodeOld.getRef();
    var nodeNew = vnodeNew.reify();
    var nodeOldParent = nodeOld.parentNode;
    nodeOldParent.removeChild(nodeOld);
    nodeOldParent.appendChild(nodeNew);
  }
}
