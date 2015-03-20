(function (console) { "use strict";
var examples_basic_Main = function() { };
examples_basic_Main.render = function(count) {
};
examples_basic_Main.main = function() {
};
var vdom_VNode = function(selector,properties,children,key,$namespace) {
	this.selector = selector;
	if(properties != null) this.properties = properties; else this.properties = { };
	if(children != null) this.children = children; else this.children = [];
	this.key = key;
	this["namespace"] = $namespace;
};
var vdom__$VProps_VProps_$Impl_$ = {};
vdom__$VProps_VProps_$Impl_$._new = function(props) {
	return props;
};
var vdom_VScript = function() { };
vdom_VScript.h = function(sel,props,children) {
	var childNodes = [];
	var key = null;
	var $namespace = null;
	if(props == null) props = { };
	if(children == null) children = [];
	var vSelector = vdom_VSelector.parse(sel,props);
	if(props.key != null) key = props.key;
	if(props["namespace"] != null) $namespace = props["namespace"];
};
var vdom_VSelector = function(tag,props) {
	this.tag = tag;
	this.props = props;
};
vdom_VSelector.parse = function(selector,props) {
	if(props == null) props = { };
	if(selector == null || selector == "") return new vdom_VSelector("div",props);
	props.id = "test";
	props.className = "test1 test2";
	return new vdom_VSelector("div",props);
};
examples_basic_Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});
