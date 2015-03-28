package virdomort;

enum AttributeValue {
  VNone;
  VInt(v : Int);
  VFloat(v : Float);
  VBool(v : Bool);
  VString(v : String);
  VDate(v : Date);
  VStrings(v : Array<String>);
  VStringMap(v : Map<String, String>);
}

/*
abstract AttributeValue(AttributeValueEnum) {
  inline function new(v : ValueEnum) {
    this = v;
  }

  @:from
  public static function fromInt(v : Int) {
    return new Value(VInt(v));
  }

  @:from
  public static function fromFloat(v : Float) {
    return new Value(VFloat(v));
  }

  @:from
  public static function fromString(v : String) {
    return new Value(VString(v));
  }

  @:from
  public static function fromBool(v : Bool) {
    return new Value(VBool(v));
  }
}
*/
