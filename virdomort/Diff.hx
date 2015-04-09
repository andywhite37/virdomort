package virdomort;

class Diff {
  public static function getPatch<TRef>(vold : VNode<TRef>, vnew : VNode<TRef>) : Patch<TRef> {
    var patch = new Patch<TRef>();

    patch.isVText = vold.isVText() && vnew.isVText();
    if (patch.isVText) {
      return getTextPatch(vold, vnew, patch);
    }

    patch.isVElement = vold.isVElement() && vnew.isVElement();
    if (patch.isVElement) {
      return getElementPatch(vold, vnew, patch);
    }

    patch.isPatchable = false;

    return patch;
  }

  public static function getTextPatch<TRef>(vold : VNode<TRef>, vnew : VNode<TRef>, patch : Patch<TRef>) : Patch<TRef> {
    var voldText = vold.toVText().text;
    var vnewText = vnew.toVText().text;
    patch.isPatchable = true;
    patch.hasChanges = voldText != vnewText;
    patch.newText = vnewText;
    return patch;
  }

  public static function getElementPatch<TRef>(vold : VNode<TRef>, vnew : VNode<TRef>, patch : Patch<TRef>) : Patch<TRef> {
    patch.isPatchable = isElementPatchable(vold, vnew);
    if (!patch.isPatchable) {
      return patch;
    }

    getElementAttributesPatch(vold, vnew, patch);
    getElementEventHandlersPatch(vold, vnew, patch);
    getElementChildrenPatch(vold, vnew, patch);

    patch.hasChanges =
      patch.hasAttributeChanges ||
      patch.hasEventHandlerChanges ||
      patch.hasChildrenChanges;

    return patch;
  }

  public static function isElementPatchable<TRef>(vnode1 : VNode<TRef>, vnode2 : VNode<TRef>) : Bool {
    if (vnode1.isVElement() && vnode2.isVElement()) {
      var velement1 = vnode1.toVElement();
      var velement2 = vnode2.toVElement();

      var key1 = velement1.key;
      var key2 = velement2.key;

      if (velement1.key != null && velement2.key != null && velement1.key == velement2.key) {
        return true;
      }

      var tag1 = velement1.tag;
      var tag2 = velement2.tag;
      var ns1 = velement1.namespace;
      var ns2 = velement2.namespace;

      if (tag1 == tag2 && ns1 == ns2) {
        return true;
      }
    }

    return false;
  }

  public static function getElementAttributesPatch<TRef>(vold : VNode<TRef>, vnew : VNode<TRef>, patch : Patch<TRef>) : Patch<TRef> {
    // TODO: diff attributes here

    patch.hasAttributeChanges =
      patch.hasAddedAttributes || patch.hasRemovedAttributes || patch.hasChangedAttributes;

    return patch;
  }

  public static function getElementEventHandlersPatch<TRef>(vold : VNode<TRef>, vnew : VNode<TRef>, patch : Patch<TRef>) : Patch<TRef> {
    // TODO: diff event handlers here

    patch.hasEventHandlerChanges =
      patch.hasAddedEventHandlers || patch.hasRemovedEventHandlers || patch.hasChangedEventHandlers;

    return patch;
    return patch;
  }

  public static function getElementChildrenPatch<TRef>(vold : VNode<TRef>, vnew : VNode<TRef>, patch : Patch<TRef>) : Patch<TRef> {
    // TODO: diff children here

    patch.hasChildrenChanges =
      patch.hasAddedChildren || patch.hasRemovedChildren || patch.hasMovedChildren;

    return patch;
  }
}
