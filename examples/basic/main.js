(function (console) { "use strict";
var examples_basic_Main = function() { };
examples_basic_Main.render = function(count) {
};
examples_basic_Main.myHandler = function(s) {
	console.log(s);
};
examples_basic_Main.main = function() {
	var myString = "Hello";
	var vNode = vdom_VScript.h("div.my-class",{ required : vdom__$VProps_VProp_$Impl_$.fromBool(true), style : vdom_PropValue.PVStyle({ display : "none"})});
};
var vdom_VChild = { __constructs__ : ["Child","Children","Text","None"] };
vdom_VChild.Child = function(child) { var $x = ["Child",0,child]; $x.__enum__ = vdom_VChild; return $x; };
vdom_VChild.Children = function(children) { var $x = ["Children",1,children]; $x.__enum__ = vdom_VChild; return $x; };
vdom_VChild.Text = function(text) { var $x = ["Text",2,text]; $x.__enum__ = vdom_VChild; return $x; };
vdom_VChild.None = ["None",3];
vdom_VChild.None.__enum__ = vdom_VChild;
var vdom_VNode = function(tag,props,child,key,$namespace) {
	this.tag = tag;
	if(props != null) this.props = props; else this.props = { };
	if(child != null) this.child = child; else this.child = vdom_VChild.None;
	this.key = key;
	this["namespace"] = $namespace;
};
var vdom_PropValue = { __constructs__ : ["VoidHandler","EventHandler","PVBool","PVString","PVStyle"] };
vdom_PropValue.VoidHandler = function(f) { var $x = ["VoidHandler",0,f]; $x.__enum__ = vdom_PropValue; return $x; };
vdom_PropValue.EventHandler = function(f) { var $x = ["EventHandler",1,f]; $x.__enum__ = vdom_PropValue; return $x; };
vdom_PropValue.PVBool = function(b) { var $x = ["PVBool",2,b]; $x.__enum__ = vdom_PropValue; return $x; };
vdom_PropValue.PVString = function(s) { var $x = ["PVString",3,s]; $x.__enum__ = vdom_PropValue; return $x; };
vdom_PropValue.PVStyle = function(obj) { var $x = ["PVStyle",4,obj]; $x.__enum__ = vdom_PropValue; return $x; };
var vdom__$VProps_VProp_$Impl_$ = {};
vdom__$VProps_VProp_$Impl_$.fromBool = function(b) {
	return vdom_PropValue.PVBool(b);
};
vdom__$VProps_VProp_$Impl_$.fromString = function(s) {
	return vdom_PropValue.PVString(s);
};
vdom__$VProps_VProp_$Impl_$.fromEventHandler = function(f) {
	return vdom_PropValue.EventHandler(f);
};
vdom__$VProps_VProp_$Impl_$.fromStyle = function(obj) {
	return vdom_PropValue.PVStyle(obj);
};
var vdom_VScript = function() { };
vdom_VScript.h = function(sel,props,child) {
	var childNodes = [];
	var key = null;
	var $namespace = null;
	if(props == null) props = { };
	if(child == null) child = vdom_VChild.None;
	var vSelector = vdom_VSelector.parse(sel,props);
	return new vdom_VNode(vSelector.tag,vSelector.props,child,key,$namespace);
};
var vdom_VSelector = function(tag,props) {
	this.tag = tag;
	this.props = props;
};
vdom_VSelector.parse = function(selector,props) {
	if(props == null) props = { };
	if(selector == null || selector == "") return new vdom_VSelector("div",props);
	return new vdom_VSelector("div",props);
};
var vdom_VText = function(text) {
	this.text = text;
};
examples_basic_Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});
