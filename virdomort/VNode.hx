package virdomort;

enum VNode<TRef> {
  VElement(element : VElement<TRef>);
  VText(text : VText<TRef>);
}

/*
abstract VNode<TRef>(VNodeEnum<TRef>) {
  public inline function new(v : VNodeEnum<TRef>) {
    this = v;
  }

  @:from
  public static function fromVElement<TRef>(v : VElement<TRef>) {
    return new VNode(VElement(v));
  }

  @:from
  public static function fromVText<TRef>(v : VText<TRef>) {
    return new VNode(VText(v));
  }

  public function isVElement() {
    return switch this {
      case VElement(v): true;
      case _ : false;
    };
  }
}
*/
