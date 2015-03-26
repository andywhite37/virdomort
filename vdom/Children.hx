package vdom;

enum Children {
  Node(child : Node);
  Nodes(children : Array<Node>);
  Text(text : String);
}
