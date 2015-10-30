package vmort;

import js.Error;

enum VNodeType<TRef> {
  VNElement(element : VElement<TRef>);
  VNText(text : VText<TRef>);
}

abstract VNode<TRef>(VNodeType<TRef>) {
  public function new(vne : VNodeType<TRef>) {
    this = vne;
  }

  @:from public static function fromVNodeType<TRef>(vne : VNodeType<TRef>) : VNode<TRef> return new VNode<TRef>(vne);
  @:from public static function fromVElement<TRef>(v : VElement<TRef>) : VNode<TRef> return VNElement(v);
  @:from public static function fromVText<TRef>(v : VText<TRef>) : VNode<TRef> return VNText(v);
  @:from public static function fromString<TRef>(v : String) : VNode<TRef> return new VText(v);

  @:to public function toVNodeType() : VNodeType<TRef> {
    return this;
  }

  @:to
  public function toVElement() : VElement<TRef> {
    return switch this {
      case VNElement(v) : v;
      case _ : throw new Error("Cannot convert VNode to VElement");
    }
  }

  @:to
  public function toVText() : VText<TRef> {
    return switch this {
      case VNText(v) : v;
      case _ : throw new Error("Cannot convert VNode to VText");
    }
  }

  public function isVElement() : Bool {
    return switch this {
      case VNElement(v): true;
      case _ : false;
    };
  }

  public function isVText() : Bool {
    return switch this {
      case VNText(v) : true;
      case _ : false;
    }
  }

  public function getRef() : TRef {
    return switch this {
      case VNElement(v) : v.ref;
      case VNText(v) : v.ref;
    };
  }

  public function setRef(ref) {
    switch this {
      case VNElement(v) : v.setRef(ref);
      case VNText(v) : v.setRef(ref);
    }
  }
}
