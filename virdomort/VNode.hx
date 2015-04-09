package virdomort;

import js.Error;

enum VNodeEnum<TRef> {
  VElement(element : VElement<TRef>);
  VText(text : VText<TRef>);
}

abstract VNode<TRef>(VNodeEnum<TRef>) {
  public inline function new(v : VNodeEnum<TRef>) {
    this = v;
  }

  @:from
  public static function fromVElement<TRef>(v : VElement<TRef>) : VNode<TRef> {
    return new VNode(VElement(v));
  }

  @:from
  public static function fromVText<TRef>(v : VText<TRef>) : VNode<TRef> {
    return new VNode(VText(v));
  }

  @:from
  public static function fromString<TRef>(v : String) : VNode<TRef> {
    return new VNode(VText(new VText(v)));
  }

  public function isVElement() : Bool {
    return switch this {
      case VElement(v): true;
      case _ : false;
    };
  }

  public function isVText() : Bool {
    return switch this {
      case VText(v) : true;
      case _ : false;
    }
  }

  @:to
  public function toVElement() : VElement<TRef> {
    return switch this {
      case VElement(v) : v;
      case _ : throw new Error("Cannot convert VNode to VElement");
    }
  }

  @:to
  public function toVText() : VText<TRef> {
    return switch this {
      case VText(v) : v;
      case _ : throw new Error("Cannot convert VNode to VText");
    }
  }

  public function getRef() : TRef {
    return switch this {
      case VText(v) : v.ref;
      case VElement(v) : v.ref;
    };
  }

  public function setRef(ref) {
    switch this {
      case VText(v) : v.ref = ref;
      case VElement(v) : v.ref = ref;
    }
  }
}
