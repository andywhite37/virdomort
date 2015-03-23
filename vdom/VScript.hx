package vdom;

import js.Error;
import vdom.VProps;

class VScript {
  public static function div(sel : String, props : VProps) {
  }

  public static function inputText(sel : String, props : VProps) {
  }

  static function h(sel : String, ?props : VProps, ?child : VChild) {
    var childNodes : Array<VNode> = [];
    var key : String = null;
    var namespace : String = null;

    if (props == null)
      props = {};

    if (child == null)
      child = VChild.None;

    var vSelector = VSelector.parse(sel, props);

    /*
    if (props.key != null)
      key = props.key;
    */

    if (props.key != null)
      key = switch props.key {
        case PropValue.String(s) : s;
        case _ : throw new Error("test");
      };

    /*
    if (props.namespace != null)
      namespace = props.namespace;
    */

    return new VNode(vSelector.tag, vSelector.props, child, key, namespace);
  }
}
