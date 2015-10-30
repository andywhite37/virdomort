package vmort;

import js.Error;

enum ValueType {
  VInt(v : Int);
  VFloat(v : Float);
  VBool(v : Bool);
  VString(v : String);
  VDate(v : Date);
  VStringArray(v : Array<String>);
  VStringMap(v : Map<String, String>);
  VNone;
}

abstract Value(ValueType) {
  public function new(ve : ValueType) this = ve;

  @:from public static function fromValueType(ve : ValueType) : Value return new Value(ve);
  @:from public static function fromInt(v : Int) : Value return VInt(v);
  @:from public static function fromFloat(v : Float) : Value return VFloat(v);
  @:from public static function fromBool(v : Bool) : Value return VBool(v);
  @:from public static function fromString(v : String) : Value return VString(v);
  @:from public static function fromDate(v : Date) : Value return VDate(v);
  @:from public static function fromStringArray(v : Array<String>) : Value return VStringArray(v);
  @:from public static function fromStringMap(v : Map<String, String>) : Value return VStringMap(v);

  @:to
  public function toValueType() : ValueType {
    return this;
  }

  @:to
  public function toInt() : Int {
    return switch this {
      case VInt(v) : v;
      case VFloat(v) : Std.int(v);
      case VBool(v) : v ? 1 : 0;
      case VString(v): Std.parseInt(v);
      case VDate(v) : Std.int(v.getTime());
      case _ : throw new Error('Cannot convert value to Int');
    }
  }

  @:to
  public function toFloat() : Float {
    return switch this {
      case VInt(v) : v;
      case VFloat(v) : v;
      case VBool(v) : v ? 1.0 : 0.0;
      case VString(v) : Std.parseFloat(v);
      case VDate(v) : v.getTime();
      case _ : throw new Error('Cannot convert value to Float');
    };
  }

  @:to
  public function toBool() : Bool {
    return switch this {
      case VInt(v) : v != 0;
      case VFloat(v) : v != 0.0;
      case VBool(v) : v;
      case VString(v) : v != null && v != "";
      case _ : throw new Error('Cannot convert value to Bool');
    };
  }

  @:to
  public function toString() : String {
    return switch this {
      case VInt(v) : Std.string(v);
      case VFloat(v) : Std.string(v);
      case VBool(v) : Std.string(v);
      case VString(v) : v;
      case VDate(v) : v.toString();
      case VStringArray(v) : v.join(" ");
      case VStringMap(v) : v.toString();
      case VNone : "";
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
  public function toStringArray() : Array<String> {
    return switch this {
      case VStringArray(v) : v;
      case _ : throw new Error("Cannot convert value to Array<String>");
    };
  }

  @:to
  public function toStringMap() : Map<String, String> {
    return switch this {
      case VStringMap(v) : v;
      case _: throw new Error("Cannot convert value to Map<String, String>");
    };
  }

  public function toDynamic() : Dynamic {
    return switch this {
      case VInt(v) : v;
      case VFloat(v) : v;
      case VBool(v) : v;
      case VString(v) : v;
      case VDate(v) : v;
      case VStringArray(v) : v;
      case VStringMap(v) : v;
      case VNone : null;
    };
  }

  public function isInt() : Bool {
    return switch this {
      case VInt(v) : true;
      case _ : false;
    };
  }

  public function isFloat() : Bool {
    return switch this {
      case VFloat(v) : true;
      case _ : false;
    };
  }

  public function isBool() : Bool {
    return switch this {
      case VBool(v) : true;
      case _ : false;
    };
  }

  public function isString() : Bool {
    return switch this {
      case VString(v) : true;
      case _ : false;
    };
  }

  public function isDate() : Bool {
    return switch this {
      case VDate(v) : true;
      case _ : false;
    };
  }

  public function isStringArray() : Bool {
    return switch this {
      case VStringArray(v) : true;
      case _ : false;
    };
  }

  public function isStringMap() : Bool {
    return switch this {
      case VStringMap(v) : true;
      case _ : false;
    };
  }

  public function isNone() : Bool {
    return switch this {
      case VNone : true;
      case _ : false;
    }
  }
}
