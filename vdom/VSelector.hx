package vdom;

class VSelector {
  public var tag(default, null) : String;
  public var props(default, null) : VProps;

  public static function parse(?selector : String, ?props : VProps) : VSelector {
    if (props == null)
      props = {};

    if (selector == null || selector == '') {
      return new VSelector('div', props);
    }

    //props.set("id", "test");
    //props.set("className", "test1 test2");
    return new VSelector('div', props);
  }

  public function new(tag : String, props : VProps) {
    this.tag = tag;
    this.props = props;
  }
}
