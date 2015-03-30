package virdomort;

import js.Error;

enum ValueEnum {
  VNone;
  VInt(v : Int);
  VFloat(v : Float);
  VBool(v : Bool);
  VString(v : String);
  VDate(v : Date);
  VStrings(v : Array<String>);
  VStringMap(v : Map<String, String>);
}

abstract Value(ValueEnum) {
  inline function new(v : ValueEnum) {
    this = v;
  }

  @:from
  public static function fromInt(v : Int) : Value {
    return new Value(VInt(v));
  }

  @:from
  public static function fromFloat(v : Float) : Value {
    return new Value(VFloat(v));
  }

  @:from
  public static function fromString(v : String) : Value {
    return new Value(VString(v));
  }

  @:from
  public static function fromBool(v : Bool) : Value {
    return new Value(VBool(v));
  }

  @:from
  public static function fromDate(v : Date) : Value {
    return new Value(VDate(v));
  }

  @:from
  public static function fromStrings(v : Array<String>) : Value {
    return new Value(VStrings(v));
  }

  @:from
  public static function fromStringMap(v : Map<String, String>) : Value {
    return new Value(VStringMap(v));
  }

  public function toValue() : Dynamic {
    return switch this {
      case VNone: null;
      case VInt(v) : v;
      case VFloat(v) : v;
      case VBool(v) : v;
      case VString(v) : v;
      case VDate(v) : v;
      case VStrings(v) : v;
      case VStringMap(v) : v;
    };
  }

  public function isNone() : Bool {
    return switch this {
      case VNone : true;
      case _ : false;
    }
  }

  @:to
  public function toInt() : Int {
    return switch this {
      case VInt(v) : v;
      case VFloat(v) : Std.int(v);
      case VString(v): Std.parseInt(v);
      case VBool(v) : v ? 1 : 0;
      case VDate(v) : Std.int(v.getTime());
      case _ : throw new Error('Cannot convert value to Int');
    }
  }

  @:to
  public function toFloat() : Float {
    return switch this {
      case VInt(v) : v;
      case VFloat(v) : v;
      case VString(v) : Std.parseFloat(v);
      case VBool(v) : v ? 1.0 : 0.0;
      case VDate(v) : v.getTime();
      case _ : throw new Error('Cannot convert value to Float');
    };
  }

  @:to
  public function toBool() : Bool {
    return switch this {
      case VInt(v) : v != 0;
      case VFloat(v) : v != 0.0;
      case VString(v) : v != null && v != "";
      case VBool(v) : v;
      case _ : throw new Error('Cannot convert value to Float');
    };
  }

  @:to
  public function toString() : String {
    return switch this {
      case VNone : "";
      case VInt(v) : Std.string(v);
      case VFloat(v) : Std.string(v);
      case VBool(v) : Std.string(v);
      case VDate(v) : v.toString();
      case VString(v) : v;
      case VStrings(v) : v.join(" ");
      case VStringMap(v) : throw new Error("Cannot convert value to String");
    };
  }

  @:to
  public function toDate() : Date {
    return switch this {
      case VDate(v) : v;
      case _: throw new Error("Cannot convert value to Date");
    };
  }

  @:to
  public function toStrings() : Array<String> {
    return switch this {
      case VStrings(v) : v;
      case _: throw new Error("Cannot convert value to Array<String>");
    };
  }

  @:to
  public function toStringMap() : Map<String, String> {
    return switch this {
      case VStringMap(v) : v;
      case _: throw new Error("Cannot convert value to Map<String, String>");
    };
  }
}
