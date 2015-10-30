package vmort;

class VText<TRef> {
  public var text(default, null) : String;
  public var ref(default, null) : Null<TRef>;

  public function new(text : String) {
    this.text = text;
    this.ref = null;
  }

  public function setText(text : String) : VText<TRef> {
    this.text = text;
    return this;
  }

  public function setRef(ref : TRef) : VText<TRef> {
    this.ref = ref;
    return this;
  }
}
