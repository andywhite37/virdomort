package vdom;

import js.Browser;
import js.html.Element;
import vdom.Node.*;

class VDom {
  /**
   * Creates a real (detached) DOM element from a virtual Node.
   */
  public static function render(node : Node) : Element {
    var element : Element;

    if (node.data.namespace != null)
      element = Browser.document.createElementNS(node.data.tag, node.data.namespace);
    else
      element = Browser.document.createElement(node.data.tag);

    if (node.data.id != null)
      element.id = node.data.id;

    for (c in node.data.classes)
      element.classList.add(c);

    for (name in node.data.styles.keys())
      element.style.setProperty(name, node.data.styles.get(name));

    for (name in node.data.attributes.keys())
      element.setAttribute(name, node.data.attributes.get(name));

    // TODO: should this differentiate between attributes and properties?
    // TODO: is there a better way to set properties (like required?) (other than setAttribute)
    for (name in node.data.properties.keys())
      Reflect.setField(element, name, node.data.properties.get(name));

    // TODO: Use addEventListener/removeEventListener?
    for (name in node.data.events.keys())
      Reflect.setField(element, 'on$name', node.data.events.get(name));

    for (child in node.data.children) {
      switch child {
        case Node(node):
          var childElement = render(node);
          element.appendChild(childElement);

        case Nodes(nodes):
          for (node in nodes) {
            var childElement = render(node);
            element.appendChild(childElement);
          }

        case Text(text):
          var textElement = Browser.document.createTextNode(text);
          element.appendChild(textElement);
      }
    }

    node.data.rootElement = element;

    return element;
  }

  /**
   * Creates a real DOM element from a virtual Node, then appends it to another
   * real DOM element.
   */
  public static function append(container : Element, node : Node) : Element {
    var element = render(node);
    container.appendChild(element);
    return element;
  }

  /**
   * Compares a "new" virtual Node tree against a "previous" virtual Node tree,
   * and creates a patch of changes.  The patch is then applied to the real
   * DOM element which was created for the "previous" virtual node, to bring it up-
   * to-date with the state of the "new" virtual Node.
   */
  public static function redraw(previous : Node, current : Node) {
    var patch = Diff.diff(previous, current);
    patch.apply(previous.data.rootElement);
  }
}
