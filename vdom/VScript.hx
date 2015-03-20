package vdom;

class VScript {
  public static function h(sel : String, ?props : Dynamic, ?child : VChild) {
    var childNodes : Array<VNode> = [];
    var key : String = null;
    var namespace : String = null;

    if (props == null)
      props = {};

    if (children == null)
      children = [];

    var vSelector = VSelector.parse(sel, props);

    if (props.key != null)
      key = props.key;

    if (props.namespace != null)
      namespace = props.namespace;


    return new VNode(vSelector.tag, vSelector.props, children, key, namespace);
  }
}
