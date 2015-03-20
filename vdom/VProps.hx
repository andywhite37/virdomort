package vdom;

abstract VProps(Dynamic) to Dynamic from Dynamic {
  inline function new(props) {
    this = props;
  }
}
