package vdom;

enum Child {
  Node(child : Node);
  Nodes(children : Array<Node>);
  Text(text : String);
}
