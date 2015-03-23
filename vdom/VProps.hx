package vdom;

//import js.html.Event;
import js.html.*;

/*
enum PropValue {
  //Function(f : Void -> Void);
  //Function1(f : T -> Void);
  VoidHandler(f : Void -> Void);
  EventHandler<T : Event>(f : T -> Void);
  PVBool(b : Bool);
  PVString(s : String);
  PVStyle(obj : Dynamic<String>);
}

abstract VProp(PropValue) from PropValue to PropValue {
  @:from
  public static function fromBool(b : Bool) : VProp {
    return PVBool(b);
  }

  @:from
  public static inline function fromString(s : String) : VProp {
    return PVString(s);
  }

  @:from
  public static inline function fromEventHandler<T : Event>(f : T -> Void) : VProp {
    return EventHandler(f);
  }

  @:from
  public static inline function fromStyle(obj : Dynamic<String>) : VProp {
    return PVStyle(obj);
  }
}

//typedef VProps = Map<String, VProp>;
//typedef VProps = Array<{ att : String, value : VProp }>;
typedef VProps = Dynamic<VProp>;

//typedef VProps = Dynamic;
*/

enum Primitive {
  I(i : Int);
  F(f : Float);
  B(b : Bool);
  S(s : String);
}

typedef EventHandler = Event -> Void;
typedef MouseEventHandler = MouseEvent -> Void;

typedef VProps = {
  ?key : String,
  ?id : String,
  ?className : String,
  ?classes : Array<String>,
  ?data : StringMap<Primitive>,
  ?style : StringMap<Primitive>,
  ?on : StringMap<EventHandler>
};

abstract InputType(String) from String {
}

typedef VInputProps = { > VProps,
  ?type : InputType,
  ?value : String,
  ?required : Bool,
  ?placeholder : String
}
