package virdomort;

class VText<TRef> {
  public var text : String;
  public var ref : Null<TRef>;

  public function new(text : String) {
    this.text = text;
  }
}
