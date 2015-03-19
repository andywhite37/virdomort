package vdom;

class VHyperScript {
  public static function h(selector : String, ?properties : {}, ?children : Array<VNode>) {
    var childNodes : Array<VNode> = [];
    var key : String = null;
    var namespace : String = null;

    if (properties == null)
      properties = {};

    if (children == null)
      children = [];

    if (properties.key != null) key = properties.key;

    if (properties.namespace != null) namespace = properties.namespace;



  }
}
