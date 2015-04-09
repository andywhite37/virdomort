package vmort;

class Diff {
  public static function getPatch<TRef>(vold : VNode<TRef>, vnew : VNode<TRef>) : Patch<TRef> {
    var patch = new Patch<TRef>();

    patch.isVText = vold.isVText() && vnew.isVText();
    if (patch.isVText) {
      return fillVTextPatch(vold.toVText(), vnew.toVText(), patch);
    }

    patch.isVElement = vold.isVElement() && vnew.isVElement();
    if (patch.isVElement) {
      return fillVElementPatch(vold.toVElement(), vnew.toVElement(), patch);
    }

    return patch;
  }

  static function fillVTextPatch<TRef>(vold : VText<TRef>, vnew : VText<TRef>, patch : Patch<TRef>) : Patch<TRef> {
    patch.isPatchable = true;
    patch.hasChanges = vold.text != vnew.text;
    patch.changedText = vnew.text;
    return patch;
  }

  static function fillVElementPatch<TRef>(vold : VElement<TRef>, vnew : VElement<TRef>, patch : Patch<TRef>) : Patch<TRef> {
    patch.isPatchable = isVElementPatchable(vold, vnew);

    if (!patch.isPatchable) {
      return patch;
    }

    fillVElementAttributesPatch(vold, vnew, patch);
    fillVElementEventHandlersPatch(vold, vnew, patch);
    fillVElementChildrenPatch(vold, vnew, patch);

    patch.hasChanges =
      patch.hasAttributeChanges ||
      patch.hasEventHandlerChanges ||
      patch.hasChildrenChanges;

    return patch;
  }

  static function isVElementPatchable<TRef>(vold : VElement<TRef>, vnew : VElement<TRef>) : Bool {
    if (vold.key != null && vnew.key != null && vold.key == vnew.key) {
      return true;
    }

    if (vold.tag == vnew.tag && vold.namespace == vnew.namespace) {
      return true;
    }

    return false;
  }

  static function fillVElementAttributesPatch<TRef>(vold : VElement<TRef>, vnew : VElement<TRef>, patch : Patch<TRef>) : Patch<TRef> {
    // TODO: diff attributes here
    //for (oldKey in vold.

    patch.hasAttributeChanges =
      patch.hasAddedAttributes || patch.hasRemovedAttributes || patch.hasChangedAttributes;

    return patch;
  }

  static function fillVElementEventHandlersPatch<TRef>(vold : VElement<TRef>, vnew : VElement<TRef>, patch : Patch<TRef>) : Patch<TRef> {
    // TODO: diff event handlers here

    patch.hasEventHandlerChanges =
      patch.hasAddedEventHandlers || patch.hasRemovedEventHandlers || patch.hasChangedEventHandlers;

    return patch;
  }

  static function fillVElementChildrenPatch<TRef>(vold : VElement<TRef>, vnew : VElement<TRef>, patch : Patch<TRef>) : Patch<TRef> {
    // TODO: diff children here

    patch.hasChildrenChanges =
      patch.hasAddedChildren || patch.hasRemovedChildren || patch.hasMovedChildren;

    return patch;
  }
}
