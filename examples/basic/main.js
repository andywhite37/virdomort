(function (console) { "use strict";
var EReg = function(r,opt) {
	opt = opt.split("u").join("");
	this.r = new RegExp(r,opt);
};
EReg.prototype = {
	split: function(s) {
		var d = "#__delim__#";
		return s.replace(this.r,d).split(d);
	}
};
var HxOverrides = function() { };
HxOverrides.iter = function(a) {
	return { cur : 0, arr : a, hasNext : function() {
		return this.cur < this.arr.length;
	}, next : function() {
		return this.arr[this.cur++];
	}};
};
var Reflect = function() { };
Reflect.setField = function(o,field,value) {
	o[field] = value;
};
var examples_basic_Main = function() { };
examples_basic_Main.render = function(count) {
};
examples_basic_Main.main = function() {
	var myString = "Hello";
	var onClick = function(e) {
		e.preventDefault();
		console.log("click");
	};
	var node = vdom_Node.v("div").id("test").cl("my-class").cln("my-class-1 my-class-2  my-class-3").clc(true,"my-true-class-1","my-false-class-1").clc(false,"my-true-class-2","my-false-class-2").st("text-decoration","none").stc("display",true,"block").st("height","500px").st("width","500px").st("background-color","whitesmoke").attr("data-test","123").prop("required",true).on("click",onClick).child(vdom_Node.v("span").id("my-span").text("Hi")).children([vdom_Node.v("h1").text("H1"),vdom_Node.v("h2").text("H2")]).text("Some text").text("Some more text").child(vdom_Node.v("div",{ classes : ["test-1","test-2"], attributes : (function($this) {
		var $r;
		var _g = new haxe_ds_StringMap();
		if(__map_reserved["data-test"] != null) _g.setReserved("data-test","some data"); else _g.h["data-test"] = "some data";
		$r = _g;
		return $r;
	}(this)), events : (function($this) {
		var $r;
		var _g1 = new haxe_ds_StringMap();
		if(__map_reserved.click != null) _g1.setReserved("click",function(e1) {
			console.log("clicked");
		}); else _g1.h["click"] = function(e1) {
			console.log("clicked");
		};
		$r = _g1;
		return $r;
	}(this))},vdom_Children.Nodes([vdom_Node.v("h1",null,vdom_Children.Text("something"))])));
	console.log(node);
	var root = window.document.getElementById("root");
	vdom_VDom.append(root,node);
};
var haxe_IMap = function() { };
var haxe_ds_StringMap = function() {
	this.h = { };
};
haxe_ds_StringMap.__interfaces__ = [haxe_IMap];
haxe_ds_StringMap.prototype = {
	set: function(key,value) {
		if(__map_reserved[key] != null) this.setReserved(key,value); else this.h[key] = value;
	}
	,get: function(key) {
		if(__map_reserved[key] != null) return this.getReserved(key);
		return this.h[key];
	}
	,setReserved: function(key,value) {
		if(this.rh == null) this.rh = { };
		this.rh["$" + key] = value;
	}
	,getReserved: function(key) {
		if(this.rh == null) return null; else return this.rh["$" + key];
	}
	,keys: function() {
		var _this = this.arrayKeys();
		return HxOverrides.iter(_this);
	}
	,arrayKeys: function() {
		var out = [];
		for( var key in this.h ) {
		if(this.h.hasOwnProperty(key)) out.push(key);
		}
		if(this.rh != null) {
			for( var key in this.rh ) {
			if(key.charCodeAt(0) == 36) out.push(key.substr(1));
			}
		}
		return out;
	}
};
var vdom_Children = { __constructs__ : ["Node","Nodes","Text"] };
vdom_Children.Node = function(child) { var $x = ["Node",0,child]; $x.__enum__ = vdom_Children; return $x; };
vdom_Children.Nodes = function(children) { var $x = ["Nodes",1,children]; $x.__enum__ = vdom_Children; return $x; };
vdom_Children.Text = function(text) { var $x = ["Text",2,text]; $x.__enum__ = vdom_Children; return $x; };
var vdom_Diff = function() { };
vdom_Diff.diff = function(previous,current) {
	return new vdom_Patch();
};
var vdom_Node = function(tag,data,children) {
	if(data == null) data = { };
	this.data = data;
	if(tag != null) this.data.tag = tag;
	if(this.data.tag == null) this.data.tag = "div";
	if(this.data.classes == null) this.data.classes = [];
	if(this.data.styles == null) this.data.styles = new haxe_ds_StringMap();
	if(this.data.attributes == null) this.data.attributes = new haxe_ds_StringMap();
	if(this.data.properties == null) this.data.properties = new haxe_ds_StringMap();
	if(this.data.events == null) this.data.events = new haxe_ds_StringMap();
	if(this.data.children == null) this.data.children = [];
	if(children != null) this.data.children.push(children);
};
vdom_Node.v = function(tag,data,children) {
	return new vdom_Node(tag,data,children);
};
vdom_Node.prototype = {
	tag: function(tag) {
		this.data.tag = tag;
		return this;
	}
	,id: function(id) {
		this.data.id = id;
		return this;
	}
	,key: function(key) {
		this.data.key = key;
		return this;
	}
	,ns: function($namespace) {
		this.data["namespace"] = $namespace;
		return this;
	}
	,cl: function(cl) {
		this.data.classes.push(cl);
		return this;
	}
	,cls: function(classes) {
		this.data.classes = this.data.classes.concat(classes);
		return this;
	}
	,cln: function(className) {
		return this.cls(new EReg("[ \t]+","g").split(className));
	}
	,clc: function(conditional,ifTrue,ifFalse) {
		if(ifFalse == null) ifFalse = "";
		return this.cl(conditional?ifTrue:ifFalse);
	}
	,st: function(name,value) {
		this.data.styles.set(name,value);
		return this;
	}
	,stc: function(name,conditional,ifTrue,ifFalse) {
		if(ifFalse == null) ifFalse = "";
		return this.st(name,conditional?ifTrue:ifFalse);
	}
	,attr: function(name,value) {
		this.data.attributes.set(name,value);
		return this;
	}
	,prop: function(name,value) {
		var value1 = value;
		this.data.properties.set(name,value1);
		return this;
	}
	,on: function(name,listener) {
		this.data.events.set(name,listener);
		return this;
	}
	,child: function(node) {
		this.data.children.push(vdom_Children.Node(node));
		return this;
	}
	,children: function(nodes) {
		this.data.children.push(vdom_Children.Nodes(nodes));
		return this;
	}
	,text: function(text) {
		this.data.children.push(vdom_Children.Text(text));
		return this;
	}
};
var vdom_Patch = function() {
};
vdom_Patch.prototype = {
	apply: function(element) {
	}
};
var vdom_VDom = function() { };
vdom_VDom.render = function(node) {
	var element;
	if(node.data["namespace"] != null) element = window.document.createElementNS(node.data.tag,node.data["namespace"]); else element = window.document.createElement(node.data.tag);
	if(node.data.id != null) element.id = node.data.id;
	var _g = 0;
	var _g1 = node.data.classes;
	while(_g < _g1.length) {
		var c = _g1[_g];
		++_g;
		element.classList.add(c);
	}
	var $it0 = node.data.styles.keys();
	while( $it0.hasNext() ) {
		var name = $it0.next();
		element.style.setProperty(name,node.data.styles.get(name));
	}
	var $it1 = node.data.attributes.keys();
	while( $it1.hasNext() ) {
		var name1 = $it1.next();
		element.setAttribute(name1,node.data.attributes.get(name1));
	}
	var $it2 = node.data.properties.keys();
	while( $it2.hasNext() ) {
		var name2 = $it2.next();
		Reflect.setField(element,name2,node.data.properties.get(name2));
	}
	var $it3 = node.data.events.keys();
	while( $it3.hasNext() ) {
		var name3 = $it3.next();
		Reflect.setField(element,"on" + name3,node.data.events.get(name3));
	}
	var _g2 = 0;
	var _g11 = node.data.children;
	while(_g2 < _g11.length) {
		var child = _g11[_g2];
		++_g2;
		switch(child[1]) {
		case 0:
			var node1 = child[2];
			var childElement = vdom_VDom.render(node1);
			element.appendChild(childElement);
			break;
		case 1:
			var nodes = child[2];
			var _g21 = 0;
			while(_g21 < nodes.length) {
				var node2 = nodes[_g21];
				++_g21;
				var childElement1 = vdom_VDom.render(node2);
				element.appendChild(childElement1);
			}
			break;
		case 2:
			var text = child[2];
			var textElement = window.document.createTextNode(text);
			element.appendChild(textElement);
			break;
		}
	}
	node.data.rootElement = element;
	return element;
};
vdom_VDom.append = function(container,node) {
	var element = vdom_VDom.render(node);
	container.appendChild(element);
	return element;
};
vdom_VDom.redraw = function(previous,current) {
	var patch = vdom_Diff.diff(previous,current);
	patch.apply(previous.data.rootElement);
};
var __map_reserved = {}
examples_basic_Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});
