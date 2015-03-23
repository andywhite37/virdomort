package vdom;

enum VChild {
  Child(child : VNode);
  Children(children : Array<VNode>);
  Text(text : VText);
  None;
}
