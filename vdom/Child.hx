package vdom;

enum Child {
  Node(child : Node);
  Nodes(children : Array<Node>);
  Text(text : String);
}

enum Value {
  VInt(v : Int);
  VString(v : String);
  VBool(v : Bool);
  VFloat(v : Float);
  VDate(v : Date);
  VStrings(v : Array<String>);
  VStringMap(v : Map<String, String>);
}

class ElementData<TRef> {
  public var name : String;
  public var attributes : Map<String, Value>;
  public var events : Map<String, EventHandler>;
  public var children : Array<Node>;
  public var ref : Null<TRef>;

  public function new(name) {
    this.name = name;

    attributes = [];
    events = new Map();
    children = [];
  }
}

class TextData {
  public var text : String;
  public var ref : Null<TRef>;
}

enum Node<TRef> {
  Element(data : ElementData<TRef>);
  Text(text : TextData<TRef>);
}


