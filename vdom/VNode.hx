package vdom;

import js.html.Event;
import js.html.MouseEvent;
import haxe.Json;
import haxe.ds.StringMap;
import thx.core.Set;
using thx.core.Iterables;
using thx.core.Maps;

class VNode {
  var _tag(default, null) : String = "div";
  var _id(default, null) : String = null;
  var _classes(default, null) : Set<String> = [];
  var _key(default, null) : String = null;
  var _namespace(default, null) : String = null;
  var _styles(default, null) : Map<String, String> = new Map<String, String>();
  var _events(default, null) : Map<String, Event -> Void> = new Map<String, Event -> Void>();

  public static function v(tag) : VNode {
    return new VNode(tag);
  }

  public function new(?tag : String) {
    if (tag != null)
      this.tag(tag);
  }

  // Sets the VNode tag name
  public function tag(tag : String) : VNode {
    _tag = tag;
    return this;
  }

  // Sets the VNode id
  public function id(id : String) : VNode {
    _id = id;
    return this;
  }

  // Add a single class to the VNode
  public function cl(cl : String) : VNode {
    _classes.add(cl);
    return this;
  }

  // Adds an Array of classes to the VNode
  public function cls(classes : Array<String>) : VNode {
    _classes = _classes.union(classes);
    return this;
  }

  // Adds classes with a className string (split on whitespace)
  public function cln(className : String) : VNode {
    return cls(~/[ \t]+/g.split(className));
  }

  // Add a class based on a conditional check
  public function clc(conditional : Bool, ifTrue : String, ?ifFalse : String = "") : VNode {
    return cl(conditional ? ifTrue : ifFalse);
  }

  // Sets a style on the VNode
  public function st(name, value) : VNode {
    _styles.set(name, value);
    return this;
  }

  // Sets a style value based on a conditional check
  public function stc(name : String, conditional : Bool, ifTrue : String, ?ifFalse : String = "") : VNode {
    return st(name, conditional ? ifTrue : ifFalse);
  }

  public function on(name : String, handler : Event -> Void) {
    _events.set(name, handler);
    return this;
  }

  public function toObject() {
    return {
      tag: _tag,
      id: _id,
      key: _key,
      namespace: _namespace,
      classes: _classes,
      styles: _styles.mapToObject(),
      events: _events.mapToObject()
    };
  }

  public function toString() {
    return Json.stringify(toObject());
  }
}
