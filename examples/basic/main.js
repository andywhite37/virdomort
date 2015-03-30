(function (console) { "use strict";
var $estr = function() { return js_Boot.__string_rec(this,''); };
var EReg = function(r,opt) {
	opt = opt.split("u").join("");
	this.r = new RegExp(r,opt);
};
EReg.__name__ = true;
EReg.prototype = {
	split: function(s) {
		var d = "#__delim__#";
		return s.replace(this.r,d).split(d);
	}
};
var HxOverrides = function() { };
HxOverrides.__name__ = true;
HxOverrides.dateStr = function(date) {
	var m = date.getMonth() + 1;
	var d = date.getDate();
	var h = date.getHours();
	var mi = date.getMinutes();
	var s = date.getSeconds();
	return date.getFullYear() + "-" + (m < 10?"0" + m:"" + m) + "-" + (d < 10?"0" + d:"" + d) + " " + (h < 10?"0" + h:"" + h) + ":" + (mi < 10?"0" + mi:"" + mi) + ":" + (s < 10?"0" + s:"" + s);
};
HxOverrides.cca = function(s,index) {
	var x = s.charCodeAt(index);
	if(x != x) return undefined;
	return x;
};
HxOverrides.iter = function(a) {
	return { cur : 0, arr : a, hasNext : function() {
		return this.cur < this.arr.length;
	}, next : function() {
		return this.arr[this.cur++];
	}};
};
Math.__name__ = true;
var Reflect = function() { };
Reflect.__name__ = true;
Reflect.setField = function(o,field,value) {
	o[field] = value;
};
var Std = function() { };
Std.__name__ = true;
Std["int"] = function(x) {
	return x | 0;
};
Std.parseInt = function(x) {
	var v = parseInt(x,10);
	if(v == 0 && (HxOverrides.cca(x,1) == 120 || HxOverrides.cca(x,1) == 88)) v = parseInt(x);
	if(isNaN(v)) return null;
	return v;
};
var examples_basic_Main = function() { };
examples_basic_Main.__name__ = true;
examples_basic_Main.render = function(count) {
};
examples_basic_Main.main = function() {
	var myString = "Hello";
	var onClick = function(e) {
		e.preventDefault();
		console.log("click");
	};
	var tree = virdomort_dom_Dom.clc(virdomort_dom_Dom.clc(virdomort_dom_Dom.cln(virdomort_dom_Dom.cl(virdomort_dom_Dom.ve("div"),"test-class"),"test-class-1 test-class-2"),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue(true),"class-true-1","class-false-1"),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue(false),"class-true-2","class-false-2").cs([virdomort__$VNode_VNode_$Impl_$.fromVElement(virdomort_dom_Dom.ve("span").c(virdomort__$VNode_VNode_$Impl_$.fromString("My Span"))),virdomort__$VNode_VNode_$Impl_$.fromVElement(virdomort_dom_Dom.ve("br")),virdomort__$VNode_VNode_$Impl_$.fromString("Hello, world!")]);
	console.log(tree);
	var root = window.document.getElementById("root");
	var el = virdomort_dom_Dom.createNode(virdomort__$VNode_VNode_$Impl_$.fromVElement(tree));
	root.appendChild(el);
};
var haxe_IMap = function() { };
haxe_IMap.__name__ = true;
var haxe_ds_StringMap = function() {
	this.h = { };
};
haxe_ds_StringMap.__name__ = true;
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
var js_Boot = function() { };
js_Boot.__name__ = true;
js_Boot.__string_rec = function(o,s) {
	if(o == null) return "null";
	if(s.length >= 5) return "<...>";
	var t = typeof(o);
	if(t == "function" && (o.__name__ || o.__ename__)) t = "object";
	switch(t) {
	case "object":
		if(o instanceof Array) {
			if(o.__enum__) {
				if(o.length == 2) return o[0];
				var str2 = o[0] + "(";
				s += "\t";
				var _g1 = 2;
				var _g = o.length;
				while(_g1 < _g) {
					var i1 = _g1++;
					if(i1 != 2) str2 += "," + js_Boot.__string_rec(o[i1],s); else str2 += js_Boot.__string_rec(o[i1],s);
				}
				return str2 + ")";
			}
			var l = o.length;
			var i;
			var str1 = "[";
			s += "\t";
			var _g2 = 0;
			while(_g2 < l) {
				var i2 = _g2++;
				str1 += (i2 > 0?",":"") + js_Boot.__string_rec(o[i2],s);
			}
			str1 += "]";
			return str1;
		}
		var tostr;
		try {
			tostr = o.toString;
		} catch( e ) {
			return "???";
		}
		if(tostr != null && tostr != Object.toString && typeof(tostr) == "function") {
			var s2 = o.toString();
			if(s2 != "[object Object]") return s2;
		}
		var k = null;
		var str = "{\n";
		s += "\t";
		var hasp = o.hasOwnProperty != null;
		for( var k in o ) {
		if(hasp && !o.hasOwnProperty(k)) {
			continue;
		}
		if(k == "prototype" || k == "__class__" || k == "__super__" || k == "__interfaces__" || k == "__properties__") {
			continue;
		}
		if(str.length != 2) str += ", \n";
		str += s + k + " : " + js_Boot.__string_rec(o[k],s);
		}
		s = s.substring(1);
		str += "\n" + s + "}";
		return str;
	case "function":
		return "<function>";
	case "string":
		return o;
	default:
		return String(o);
	}
};
var virdomort_VElement = function(tag,key,$namespace,attributes,events,children) {
	if(tag != null) this.tag = tag; else this.tag = "div";
	this.key = key;
	this["namespace"] = $namespace;
	if(attributes != null) this.attributes = attributes; else this.attributes = new haxe_ds_StringMap();
	if(events != null) this.events = events; else this.events = new haxe_ds_StringMap();
	if(children != null) this.children = children; else this.children = [];
};
virdomort_VElement.__name__ = true;
virdomort_VElement.prototype = {
	t: function(tag) {
		this.tag = tag;
		return this;
	}
	,k: function(key) {
		this.key = key;
		return this;
	}
	,ns: function($namespace) {
		this["namespace"] = $namespace;
		return this;
	}
	,attr: function(name,value) {
		this.attributes.set(name,value);
		return this;
	}
	,on: function(name,eventHandler) {
		this.events.set(name,eventHandler);
		return this;
	}
	,c: function(child) {
		this.children.push(child);
		return this;
	}
	,cs: function(children) {
		this.children = this.children.concat(children);
		return this;
	}
};
var virdomort_VNodeEnum = { __ename__ : true, __constructs__ : ["VElement","VText"] };
virdomort_VNodeEnum.VElement = function(element) { var $x = ["VElement",0,element]; $x.__enum__ = virdomort_VNodeEnum; $x.toString = $estr; return $x; };
virdomort_VNodeEnum.VText = function(text) { var $x = ["VText",1,text]; $x.__enum__ = virdomort_VNodeEnum; $x.toString = $estr; return $x; };
var virdomort__$VNode_VNode_$Impl_$ = {};
virdomort__$VNode_VNode_$Impl_$.__name__ = true;
virdomort__$VNode_VNode_$Impl_$._new = function(v) {
	return v;
};
virdomort__$VNode_VNode_$Impl_$.fromVElement = function(v) {
	var v1 = virdomort_VNodeEnum.VElement(v);
	return v1;
};
virdomort__$VNode_VNode_$Impl_$.fromVText = function(v) {
	var v1 = virdomort_VNodeEnum.VText(v);
	return v1;
};
virdomort__$VNode_VNode_$Impl_$.fromString = function(v) {
	var v1 = virdomort_VNodeEnum.VText(new virdomort_VText(v));
	return v1;
};
virdomort__$VNode_VNode_$Impl_$.isVElement = function(this1) {
	switch(this1[1]) {
	case 0:
		var v = this1[2];
		return true;
	default:
		return false;
	}
};
virdomort__$VNode_VNode_$Impl_$.isVText = function(this1) {
	switch(this1[1]) {
	case 1:
		var v = this1[2];
		return true;
	default:
		return false;
	}
};
virdomort__$VNode_VNode_$Impl_$.toVElement = function(this1) {
	switch(this1[1]) {
	case 0:
		var v = this1[2];
		return v;
	default:
		throw new Error("Cannot convert VNode to VElement");
	}
};
virdomort__$VNode_VNode_$Impl_$.toVText = function(this1) {
	switch(this1[1]) {
	case 1:
		var v = this1[2];
		return v;
	default:
		throw new Error("Cannot convert VNode to VText");
	}
};
virdomort__$VNode_VNode_$Impl_$.setRef = function(this1,ref) {
	switch(this1[1]) {
	case 1:
		var v = this1[2];
		v.ref = ref;
		break;
	case 0:
		var v1 = this1[2];
		v1.ref = ref;
		break;
	}
};
var virdomort_VText = function(text) {
	this.text = text;
};
virdomort_VText.__name__ = true;
var virdomort_ValOrFuncEnum = { __ename__ : true, __constructs__ : ["Value","Func"] };
virdomort_ValOrFuncEnum.Value = function(v) { var $x = ["Value",0,v]; $x.__enum__ = virdomort_ValOrFuncEnum; $x.toString = $estr; return $x; };
virdomort_ValOrFuncEnum.Func = function(v) { var $x = ["Func",1,v]; $x.__enum__ = virdomort_ValOrFuncEnum; $x.toString = $estr; return $x; };
var virdomort__$ValOrFunc_ValOrFunc_$Impl_$ = {};
virdomort__$ValOrFunc_ValOrFunc_$Impl_$.__name__ = true;
virdomort__$ValOrFunc_ValOrFunc_$Impl_$._new = function(valOrFunc) {
	return valOrFunc;
};
virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue = function(v) {
	var valOrFunc = virdomort_ValOrFuncEnum.Value(v);
	return valOrFunc;
};
virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromFunc = function(v) {
	var valOrFunc = virdomort_ValOrFuncEnum.Func(v);
	return valOrFunc;
};
virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue = function(this1) {
	switch(this1[1]) {
	case 0:
		var v = this1[2];
		return v;
	case 1:
		var f = this1[2];
		return f();
	}
};
var virdomort_ValueEnum = { __ename__ : true, __constructs__ : ["VNone","VInt","VFloat","VBool","VString","VDate","VStrings","VStringMap"] };
virdomort_ValueEnum.VNone = ["VNone",0];
virdomort_ValueEnum.VNone.toString = $estr;
virdomort_ValueEnum.VNone.__enum__ = virdomort_ValueEnum;
virdomort_ValueEnum.VInt = function(v) { var $x = ["VInt",1,v]; $x.__enum__ = virdomort_ValueEnum; $x.toString = $estr; return $x; };
virdomort_ValueEnum.VFloat = function(v) { var $x = ["VFloat",2,v]; $x.__enum__ = virdomort_ValueEnum; $x.toString = $estr; return $x; };
virdomort_ValueEnum.VBool = function(v) { var $x = ["VBool",3,v]; $x.__enum__ = virdomort_ValueEnum; $x.toString = $estr; return $x; };
virdomort_ValueEnum.VString = function(v) { var $x = ["VString",4,v]; $x.__enum__ = virdomort_ValueEnum; $x.toString = $estr; return $x; };
virdomort_ValueEnum.VDate = function(v) { var $x = ["VDate",5,v]; $x.__enum__ = virdomort_ValueEnum; $x.toString = $estr; return $x; };
virdomort_ValueEnum.VStrings = function(v) { var $x = ["VStrings",6,v]; $x.__enum__ = virdomort_ValueEnum; $x.toString = $estr; return $x; };
virdomort_ValueEnum.VStringMap = function(v) { var $x = ["VStringMap",7,v]; $x.__enum__ = virdomort_ValueEnum; $x.toString = $estr; return $x; };
var virdomort__$Value_Value_$Impl_$ = {};
virdomort__$Value_Value_$Impl_$.__name__ = true;
virdomort__$Value_Value_$Impl_$._new = function(v) {
	return v;
};
virdomort__$Value_Value_$Impl_$.fromInt = function(v) {
	var v1 = virdomort_ValueEnum.VInt(v);
	return v1;
};
virdomort__$Value_Value_$Impl_$.fromFloat = function(v) {
	var v1 = virdomort_ValueEnum.VFloat(v);
	return v1;
};
virdomort__$Value_Value_$Impl_$.fromString = function(v) {
	var v1 = virdomort_ValueEnum.VString(v);
	return v1;
};
virdomort__$Value_Value_$Impl_$.fromBool = function(v) {
	var v1 = virdomort_ValueEnum.VBool(v);
	return v1;
};
virdomort__$Value_Value_$Impl_$.fromDate = function(v) {
	var v1 = virdomort_ValueEnum.VDate(v);
	return v1;
};
virdomort__$Value_Value_$Impl_$.fromStrings = function(v) {
	var v1 = virdomort_ValueEnum.VStrings(v);
	return v1;
};
virdomort__$Value_Value_$Impl_$.fromStringMap = function(v) {
	var v1 = virdomort_ValueEnum.VStringMap(v);
	return v1;
};
virdomort__$Value_Value_$Impl_$.toValue = function(this1) {
	switch(this1[1]) {
	case 0:
		return null;
	case 1:
		var v = this1[2];
		return v;
	case 2:
		var v1 = this1[2];
		return v1;
	case 3:
		var v2 = this1[2];
		return v2;
	case 4:
		var v3 = this1[2];
		return v3;
	case 5:
		var v4 = this1[2];
		return v4;
	case 6:
		var v5 = this1[2];
		return v5;
	case 7:
		var v6 = this1[2];
		return v6;
	}
};
virdomort__$Value_Value_$Impl_$.isNone = function(this1) {
	switch(this1[1]) {
	case 0:
		return true;
	default:
		return false;
	}
};
virdomort__$Value_Value_$Impl_$.toInt = function(this1) {
	switch(this1[1]) {
	case 1:
		var v = this1[2];
		return v;
	case 2:
		var v1 = this1[2];
		return v1 | 0;
	case 4:
		var v2 = this1[2];
		return Std.parseInt(v2);
	case 3:
		var v3 = this1[2];
		if(v3) return 1; else return 0;
		break;
	case 5:
		var v4 = this1[2];
		return Std["int"](v4.getTime());
	default:
		throw new Error("Cannot convert value to Int");
	}
};
virdomort__$Value_Value_$Impl_$.toFloat = function(this1) {
	switch(this1[1]) {
	case 1:
		var v = this1[2];
		return v;
	case 2:
		var v1 = this1[2];
		return v1;
	case 4:
		var v2 = this1[2];
		return parseFloat(v2);
	case 3:
		var v3 = this1[2];
		if(v3) return 1.0; else return 0.0;
		break;
	case 5:
		var v4 = this1[2];
		return v4.getTime();
	default:
		throw new Error("Cannot convert value to Float");
	}
};
virdomort__$Value_Value_$Impl_$.toBool = function(this1) {
	switch(this1[1]) {
	case 1:
		var v = this1[2];
		return v != 0;
	case 2:
		var v1 = this1[2];
		return v1 != 0.0;
	case 4:
		var v2 = this1[2];
		return v2 != null && v2 != "";
	case 3:
		var v3 = this1[2];
		return v3;
	default:
		throw new Error("Cannot convert value to Float");
	}
};
virdomort__$Value_Value_$Impl_$.toString = function(this1) {
	switch(this1[1]) {
	case 0:
		return "";
	case 1:
		var v = this1[2];
		if(v == null) return "null"; else return "" + v;
		break;
	case 2:
		var v1 = this1[2];
		if(v1 == null) return "null"; else return "" + v1;
		break;
	case 3:
		var v2 = this1[2];
		if(v2 == null) return "null"; else return "" + v2;
		break;
	case 5:
		var v3 = this1[2];
		return HxOverrides.dateStr(v3);
	case 4:
		var v4 = this1[2];
		return v4;
	case 6:
		var v5 = this1[2];
		return v5.join(" ");
	case 7:
		var v6 = this1[2];
		throw new Error("Cannot convert value to String");
		break;
	}
};
virdomort__$Value_Value_$Impl_$.toDate = function(this1) {
	switch(this1[1]) {
	case 5:
		var v = this1[2];
		return v;
	default:
		throw new Error("Cannot convert value to Date");
	}
};
virdomort__$Value_Value_$Impl_$.toStrings = function(this1) {
	switch(this1[1]) {
	case 6:
		var v = this1[2];
		return v;
	default:
		throw new Error("Cannot convert value to Array<String>");
	}
};
virdomort__$Value_Value_$Impl_$.toStringMap = function(this1) {
	switch(this1[1]) {
	case 7:
		var v = this1[2];
		return v;
	default:
		throw new Error("Cannot convert value to Map<String, String>");
	}
};
var virdomort_dom_Dom = function() { };
virdomort_dom_Dom.__name__ = true;
virdomort_dom_Dom.createNode = function(vnode) {
	if(virdomort__$VNode_VNode_$Impl_$.isVText(vnode)) return virdomort_dom_Dom.createText(virdomort__$VNode_VNode_$Impl_$.toVText(vnode)); else return virdomort_dom_Dom.createElement(virdomort__$VNode_VNode_$Impl_$.toVElement(vnode));
};
virdomort_dom_Dom.createText = function(vtext) {
	var rtext = window.document.createTextNode(vtext.text);
	vtext.ref = rtext;
	return rtext;
};
virdomort_dom_Dom.createElement = function(velement) {
	var relement = window.document.createElement(velement.tag);
	velement.ref = relement;
	virdomort_dom_Dom.setAttributes(relement,velement);
	virdomort_dom_Dom.setEventHandlers(relement,velement);
	virdomort_dom_Dom.setChildren(relement,velement);
	return relement;
};
virdomort_dom_Dom.ve = function(tag,key,$namespace,attributes,events,children) {
	return new virdomort_VElement(tag,key,$namespace,attributes,events,children);
};
virdomort_dom_Dom.vt = function(text) {
	return new virdomort_VText(text);
};
virdomort_dom_Dom.id = function(velement,id) {
	var v = virdomort__$Value_Value_$Impl_$.fromString(id);
	velement.attributes.set("id",v);
	v;
	return velement;
};
virdomort_dom_Dom.cl = function(velement,className) {
	return virdomort_dom_Dom.cls(velement,[className]);
};
virdomort_dom_Dom.cln = function(velement,classNames) {
	return virdomort_dom_Dom.cls(velement,new EReg("[ \t]+","g").split(classNames));
};
virdomort_dom_Dom.cls = function(velement,classNames) {
	virdomort_dom_Dom.ensureClasses(velement);
	var v = virdomort__$Value_Value_$Impl_$.fromStrings(virdomort__$Value_Value_$Impl_$.toStrings(velement.attributes.get(virdomort_dom_Dom.CLASSES_KEY)).concat(classNames));
	velement.attributes.set(virdomort_dom_Dom.CLASSES_KEY,v);
	v;
	return velement;
};
virdomort_dom_Dom.clc = function(velement,conditional,classNameIfTrue,classNameIfFalse) {
	if(classNameIfFalse == null) classNameIfFalse = "";
	if(virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue(conditional)) return virdomort_dom_Dom.cl(velement,classNameIfTrue); else if(classNameIfFalse != null || classNameIfFalse != "") return virdomort_dom_Dom.cl(velement,classNameIfFalse); else return velement;
};
virdomort_dom_Dom.ensureClasses = function(velement) {
	if(velement.attributes.get(virdomort_dom_Dom.CLASSES_KEY) == null) {
		var v = virdomort__$Value_Value_$Impl_$.fromStrings([]);
		velement.attributes.set(virdomort_dom_Dom.CLASSES_KEY,v);
		v;
	}
	return velement;
};
virdomort_dom_Dom.ensureStyles = function(velement) {
	if(velement.attributes.get(virdomort_dom_Dom.STYLES_KEY) == null) {
		var v = virdomort__$Value_Value_$Impl_$.fromStringMap(new haxe_ds_StringMap());
		velement.attributes.set(virdomort_dom_Dom.STYLES_KEY,v);
		v;
	}
	return velement;
};
virdomort_dom_Dom.setAttribute = function(relement,velement,key) {
	if(key == virdomort_dom_Dom.CLASSES_KEY) {
		var className = virdomort__$Value_Value_$Impl_$.toStrings(velement.attributes.get(key)).join(" ");
		relement.className = className;
		return;
	}
	if(key == virdomort_dom_Dom.STYLES_KEY) {
		var styles = virdomort__$Value_Value_$Impl_$.toStringMap(velement.attributes.get(key));
		var el = relement;
		var $it0 = styles.keys();
		while( $it0.hasNext() ) {
			var styleKey = $it0.next();
			Reflect.setField(el.style,styleKey,__map_reserved[styleKey] != null?styles.getReserved(styleKey):styles.h[styleKey]);
		}
		return;
	}
	var value = virdomort__$Value_Value_$Impl_$.toValue(velement.attributes.get(key));
	relement.key = value;
};
virdomort_dom_Dom.setAttributes = function(relement,velement) {
	var $it0 = velement.attributes.keys();
	while( $it0.hasNext() ) {
		var key = $it0.next();
		virdomort_dom_Dom.setAttribute(relement,velement,key);
	}
};
virdomort_dom_Dom.setEventHandler = function(relement,velement,key) {
	Reflect.setField(relement,"on" + key,velement.events.get(key));
};
virdomort_dom_Dom.setEventHandlers = function(relement,velement) {
	var $it0 = velement.events.keys();
	while( $it0.hasNext() ) {
		var key = $it0.next();
		virdomort_dom_Dom.setEventHandler(relement,velement,key);
	}
};
virdomort_dom_Dom.setChildren = function(relement,velement) {
	var _g = 0;
	var _g1 = velement.children;
	while(_g < _g1.length) {
		var vchild = _g1[_g];
		++_g;
		var rchild = virdomort_dom_Dom.createNode(vchild);
		virdomort__$VNode_VNode_$Impl_$.setRef(vchild,rchild);
		relement.appendChild(rchild);
	}
};
String.__name__ = true;
Array.__name__ = true;
Date.__name__ = ["Date"];
var __map_reserved = {}
virdomort_dom_Dom.CLASSES_KEY = "classes";
virdomort_dom_Dom.STYLES_KEY = "styles";
examples_basic_Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});
