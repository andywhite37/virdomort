package virdomort;

class VElementTools {
  public function tag<TRef>(velement : VElement<TRef>, tag : String) {
    velement.tag = tag;
    return velement;
  }

  public function key<TRef>(velement : VElement<TRef>, key : String) {
    velement.key = key;
    return velement;
  }

  public function ns<TRef>(velement : VElement<TRef>, namespace : String) {
    velement.namespace = namespace;
    return velement;
  }

  public function attr<TRef>(velement : VElement<TRef>, name, value) {
    velement.attributes.set(name, value);
    return velement;
  }

  public function on<TRef>(velement : VElement<TRef>, name, eventHandler) {
    velement.events.set(name, eventHandler);
    return velement;
  }

  public function child<TRef>(velement : VElement<TRef>, c) {
    velement.children.push(c);
    return velement;
  }

  public function children<TRef>(velement : VElement<TRef>, cs) {
    velement.children = velement.children.concat(cs);
    return velement;
  }
}
