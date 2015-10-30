package vmort;

enum ValOrFuncType<TValue> {
  Value(v : TValue);
  Func(v : Void -> TValue);
}

abstract ValOrFunc<TValue>(ValOrFuncType<TValue>) {
  inline function new(valOrFunc: ValOrFuncType<TValue>) {
    this = valOrFunc;
  }

  @:from public static function fromValOrFuncType<TValue>(v : ValOrFuncType<TValue>) : ValOrFunc<TValue> {
    return new ValOrFunc(v);
  }

  @:from
  public static function fromValue<TValue>(v : TValue) : ValOrFunc<TValue> {
    return Value(v);
  }

  @:from
  public static function fromFunc<TValue>(v : Void -> TValue) : ValOrFunc<TValue> {
    return Func(v);
  }

  public function toValue() : TValue {
    if (this == null) return null;
    return switch this {
      case Value(v) : v;
      case Func(f) : f();
    }
  }

  public function toFunc() : Void -> TValue {
    if (this == null) return null;
    return switch this {
      case Value(v) : function() { return v; };
      case Func(f) : f;
    };
  }
}
