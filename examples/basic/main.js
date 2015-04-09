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
Reflect.deleteField = function(o,field) {
	if(!Object.prototype.hasOwnProperty.call(o,field)) return false;
	delete(o[field]);
	return true;
};
var Std = function() { };
Std.__name__ = true;
Std.string = function(s) {
	return js_Boot.__string_rec(s,"");
};
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
	var vnode = virdomort_dom_VDom.clc(virdomort_dom_VDom.clc(virdomort_dom_VDom.cln(virdomort_dom_VDom.cl(virdomort_dom_VDom.ve(virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue("div")),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue("test-class")),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue("test-class-1 test-class-2")),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue(true),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue("class-true-1"),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue("class-false-1")),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue(false),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue("class-true-2"),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue("class-false-2")).cs([virdomort__$VNode_VNode_$Impl_$.fromVElement(virdomort_dom_VDom.st(virdomort_dom_VDom.ve(virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue("span")),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue("color"),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue("blue")).c(virdomort__$VNode_VNode_$Impl_$.fromString("My Span"))),virdomort__$VNode_VNode_$Impl_$.fromVElement(virdomort_dom_VDom.ve(virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue("br"))),virdomort__$VNode_VNode_$Impl_$.fromVElement(virdomort_dom_VDom.stc(virdomort_dom_VDom.ve(virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue("span")),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue("background-color"),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue(true),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue("#ddd")).c(virdomort__$VNode_VNode_$Impl_$.fromString("My Span 2"))),virdomort__$VNode_VNode_$Impl_$.fromVElement(virdomort_dom_VDom.ve(virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue("br"))),virdomort__$VNode_VNode_$Impl_$.fromString("Hello, world!"),virdomort__$VNode_VNode_$Impl_$.fromVElement(virdomort_dom_VDom.ve(virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue("hr"))),virdomort__$VNode_VNode_$Impl_$.fromVElement(virdomort_dom_VDom.ve(virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue("button")).on("click",onClick).c(virdomort__$VNode_VNode_$Impl_$.fromString("Click me")))]);
	console.log(vnode);
	var root = window.document.getElementById("root");
	var node = virdomort_dom_VDom.createNode(virdomort__$VNode_VNode_$Impl_$.fromVElement(vnode));
	root.appendChild(node);
};
var haxe_IMap = function() { };
haxe_IMap.__name__ = true;
var haxe_ds__$StringMap_StringMapIterator = function(map,keys) {
	this.map = map;
	this.keys = keys;
	this.index = 0;
	this.count = keys.length;
};
haxe_ds__$StringMap_StringMapIterator.__name__ = true;
haxe_ds__$StringMap_StringMapIterator.prototype = {
	hasNext: function() {
		return this.index < this.count;
	}
	,next: function() {
		return this.map.get(this.keys[this.index++]);
	}
};
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
var virdomort_Diff = function() { };
virdomort_Diff.__name__ = true;
virdomort_Diff.getPatch = function(vold,vnew) {
	var patch = new virdomort_Patch();
	patch.isVText = virdomort__$VNode_VNode_$Impl_$.isVText(vold) && virdomort__$VNode_VNode_$Impl_$.isVText(vnew);
	if(patch.isVText) return virdomort_Diff.fillVTextPatch(virdomort__$VNode_VNode_$Impl_$.toVText(vold),virdomort__$VNode_VNode_$Impl_$.toVText(vnew),patch);
	patch.isVElement = virdomort__$VNode_VNode_$Impl_$.isVElement(vold) && virdomort__$VNode_VNode_$Impl_$.isVElement(vnew);
	if(patch.isVElement) return virdomort_Diff.fillVElementPatch(virdomort__$VNode_VNode_$Impl_$.toVElement(vold),virdomort__$VNode_VNode_$Impl_$.toVElement(vnew),patch);
	return patch;
};
virdomort_Diff.fillVTextPatch = function(vold,vnew,patch) {
	patch.isPatchable = true;
	patch.hasChanges = vold.text != vnew.text;
	patch.changedText = vnew.text;
	return patch;
};
virdomort_Diff.fillVElementPatch = function(vold,vnew,patch) {
	patch.isPatchable = virdomort_Diff.isVElementPatchable(vold,vnew);
	if(!patch.isPatchable) return patch;
	virdomort_Diff.fillVElementAttributesPatch(vold,vnew,patch);
	virdomort_Diff.fillVElementEventHandlersPatch(vold,vnew,patch);
	virdomort_Diff.fillVElementChildrenPatch(vold,vnew,patch);
	patch.hasChanges = patch.hasAttributeChanges || patch.hasEventHandlerChanges || patch.hasChildrenChanges;
	return patch;
};
virdomort_Diff.isVElementPatchable = function(vold,vnew) {
	if(vold.key != null && vnew.key != null && vold.key == vnew.key) return true;
	if(vold.tag == vnew.tag && vold["namespace"] == vnew["namespace"]) return true;
	return false;
};
virdomort_Diff.fillVElementAttributesPatch = function(vold,vnew,patch) {
	patch.hasAttributeChanges = patch.hasAddedAttributes || patch.hasRemovedAttributes || patch.hasChangedAttributes;
	return patch;
};
virdomort_Diff.fillVElementEventHandlersPatch = function(vold,vnew,patch) {
	patch.hasEventHandlerChanges = patch.hasAddedEventHandlers || patch.hasRemovedEventHandlers || patch.hasChangedEventHandlers;
	return patch;
};
virdomort_Diff.fillVElementChildrenPatch = function(vold,vnew,patch) {
	patch.hasChildrenChanges = patch.hasAddedChildren || patch.hasRemovedChildren || patch.hasMovedChildren;
	return patch;
};
var virdomort_Patch = function() {
	this.movedChildren = [];
	this.hasMovedChildren = false;
	this.removedChildren = [];
	this.hasRemovedChildren = false;
	this.addedChildren = [];
	this.hasAddedChildren = false;
	this.hasChildrenChanges = false;
	this.changedEventHandlers = new haxe_ds_StringMap();
	this.hasChangedEventHandlers = false;
	this.removedEventHandlers = new haxe_ds_StringMap();
	this.hasRemovedEventHandlers = false;
	this.addedEventHandlers = new haxe_ds_StringMap();
	this.hasAddedEventHandlers = false;
	this.hasEventHandlerChanges = false;
	this.changedAttributes = new haxe_ds_StringMap();
	this.hasChangedAttributes = false;
	this.removedAttributes = new haxe_ds_StringMap();
	this.hasRemovedAttributes = false;
	this.addedAttributes = new haxe_ds_StringMap();
	this.hasAddedAttributes = false;
	this.hasAttributeChanges = false;
	this.isVElement = false;
	this.changedText = null;
	this.isVText = false;
	this.hasChanges = false;
	this.isPatchable = false;
};
virdomort_Patch.__name__ = true;
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
	,attrs: function(map) {
		var $it0 = map.keys();
		while( $it0.hasNext() ) {
			var key = $it0.next();
			var value;
			value = __map_reserved[key] != null?map.getReserved(key):map.h[key];
			this.attributes.set(key,value);
		}
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
virdomort__$VNode_VNode_$Impl_$.getRef = function(this1) {
	switch(this1[1]) {
	case 1:
		var v = this1[2];
		return v.ref;
	case 0:
		var v1 = this1[2];
		return v1.ref;
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
	if(this1 == null) return null;
	switch(this1[1]) {
	case 0:
		var v = this1[2];
		return v;
	case 1:
		var f = this1[2];
		return f();
	}
};
var virdomort_ValueEnum = { __ename__ : true, __constructs__ : ["VNone","VInt","VFloat","VBool","VString","VDate","VStringArray","VStringMap"] };
virdomort_ValueEnum.VNone = ["VNone",0];
virdomort_ValueEnum.VNone.toString = $estr;
virdomort_ValueEnum.VNone.__enum__ = virdomort_ValueEnum;
virdomort_ValueEnum.VInt = function(v) { var $x = ["VInt",1,v]; $x.__enum__ = virdomort_ValueEnum; $x.toString = $estr; return $x; };
virdomort_ValueEnum.VFloat = function(v) { var $x = ["VFloat",2,v]; $x.__enum__ = virdomort_ValueEnum; $x.toString = $estr; return $x; };
virdomort_ValueEnum.VBool = function(v) { var $x = ["VBool",3,v]; $x.__enum__ = virdomort_ValueEnum; $x.toString = $estr; return $x; };
virdomort_ValueEnum.VString = function(v) { var $x = ["VString",4,v]; $x.__enum__ = virdomort_ValueEnum; $x.toString = $estr; return $x; };
virdomort_ValueEnum.VDate = function(v) { var $x = ["VDate",5,v]; $x.__enum__ = virdomort_ValueEnum; $x.toString = $estr; return $x; };
virdomort_ValueEnum.VStringArray = function(v) { var $x = ["VStringArray",6,v]; $x.__enum__ = virdomort_ValueEnum; $x.toString = $estr; return $x; };
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
virdomort__$Value_Value_$Impl_$.fromStringArray = function(v) {
	var v1 = virdomort_ValueEnum.VStringArray(v);
	return v1;
};
virdomort__$Value_Value_$Impl_$.fromStringMap = function(v) {
	var v1 = virdomort_ValueEnum.VStringMap(v);
	return v1;
};
virdomort__$Value_Value_$Impl_$.isNone = function(this1) {
	switch(this1[1]) {
	case 0:
		return true;
	default:
		return false;
	}
};
virdomort__$Value_Value_$Impl_$.isInt = function(this1) {
	switch(this1[1]) {
	case 1:
		var v = this1[2];
		return true;
	default:
		return false;
	}
};
virdomort__$Value_Value_$Impl_$.isFloat = function(this1) {
	switch(this1[1]) {
	case 2:
		var v = this1[2];
		return true;
	default:
		return false;
	}
};
virdomort__$Value_Value_$Impl_$.isBool = function(this1) {
	switch(this1[1]) {
	case 3:
		var v = this1[2];
		return true;
	default:
		return false;
	}
};
virdomort__$Value_Value_$Impl_$.isString = function(this1) {
	switch(this1[1]) {
	case 4:
		var v = this1[2];
		return true;
	default:
		return false;
	}
};
virdomort__$Value_Value_$Impl_$.isDate = function(this1) {
	switch(this1[1]) {
	case 5:
		var v = this1[2];
		return true;
	default:
		return false;
	}
};
virdomort__$Value_Value_$Impl_$.isStringArray = function(this1) {
	switch(this1[1]) {
	case 6:
		var v = this1[2];
		return true;
	default:
		return false;
	}
};
virdomort__$Value_Value_$Impl_$.isStringMap = function(this1) {
	switch(this1[1]) {
	case 7:
		var v = this1[2];
		return true;
	default:
		return false;
	}
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
		throw new Error("Cannot convert value to Bool");
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
virdomort__$Value_Value_$Impl_$.toStringArray = function(this1) {
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
var virdomort_dom_VDom = function() { };
virdomort_dom_VDom.__name__ = true;
virdomort_dom_VDom.createNode = function(vnode) {
	if(virdomort__$VNode_VNode_$Impl_$.isVText(vnode)) return virdomort_dom_VDom.createText(virdomort__$VNode_VNode_$Impl_$.toVText(vnode)); else return virdomort_dom_VDom.createElement(virdomort__$VNode_VNode_$Impl_$.toVElement(vnode));
};
virdomort_dom_VDom.createText = function(vtext) {
	var text = window.document.createTextNode(vtext.text);
	vtext.ref = text;
	return text;
};
virdomort_dom_VDom.createElement = function(velement) {
	var element = window.document.createElement(velement.tag);
	velement.ref = element;
	virdomort_dom_VDom.setAttributes(element,velement.attributes);
	virdomort_dom_VDom.setEventHandlers(element,velement.events);
	virdomort_dom_VDom.setChildren(element,velement.children);
	return element;
};
virdomort_dom_VDom.updateNode = function(vold,vnew) {
	var patch = virdomort_Diff.getPatch(vold,vnew);
	if(!patch.isPatchable) virdomort_dom_VDom.replaceNode(vold,vnew);
	if(!patch.hasChanges) {
		virdomort__$VNode_VNode_$Impl_$.setRef(vnew,virdomort__$VNode_VNode_$Impl_$.getRef(vold));
		return;
	}
	if(patch.isVText) {
		virdomort_dom_VDom.updateText(vold,vnew,patch);
		return;
	}
	if(patch.isVElement) {
		virdomort_dom_VDom.updateElement(vold,vnew,patch);
		return;
	}
	virdomort_dom_VDom.replaceNode(vold,vnew);
};
virdomort_dom_VDom.updateText = function(vold,vnew,patch) {
	var textOld = virdomort__$VNode_VNode_$Impl_$.toVText(vold).ref;
	textOld.nodeValue = patch.changedText;
	virdomort__$VNode_VNode_$Impl_$.setRef(vnew,textOld);
};
virdomort_dom_VDom.updateElement = function(vold,vnew,patch) {
	var element = virdomort__$VNode_VNode_$Impl_$.getRef(vold);
	virdomort_dom_VDom.updateAttributes(vold,vnew,element,patch);
	virdomort_dom_VDom.updateEventHandlers(vold,vnew,element,patch);
	virdomort_dom_VDom.updateChildren(vold,vnew,element,patch);
	virdomort__$VNode_VNode_$Impl_$.setRef(vnew,virdomort__$VNode_VNode_$Impl_$.getRef(vold));
};
virdomort_dom_VDom.updateAttributes = function(vold,vnew,element,patch) {
	if(!patch.hasAttributeChanges) return;
	if(patch.hasAddedAttributes) {
		var added = patch.addedAttributes;
		var $it0 = new haxe_ds__$StringMap_StringMapIterator(added,added.arrayKeys());
		while( $it0.hasNext() ) {
			var key = $it0.next();
			virdomort_dom_VDom.setAttribute(element,virdomort__$Value_Value_$Impl_$.toString(key),(function($this) {
				var $r;
				var key1 = virdomort__$Value_Value_$Impl_$.toString(key);
				$r = __map_reserved[key1] != null?added.getReserved(key1):added.h[key1];
				return $r;
			}(this)));
		}
	}
	if(patch.hasRemovedAttributes) {
		var removed = patch.removedAttributes;
		var $it1 = new haxe_ds__$StringMap_StringMapIterator(removed,removed.arrayKeys());
		while( $it1.hasNext() ) {
			var key2 = $it1.next();
			virdomort_dom_VDom.removeAttribute(element,virdomort__$Value_Value_$Impl_$.toString(key2));
		}
	}
	if(patch.hasChangedAttributes) {
		var changed = patch.changedAttributes;
		var $it2 = new haxe_ds__$StringMap_StringMapIterator(changed,changed.arrayKeys());
		while( $it2.hasNext() ) {
			var key3 = $it2.next();
			virdomort_dom_VDom.setAttribute(element,virdomort__$Value_Value_$Impl_$.toString(key3),(function($this) {
				var $r;
				var key4 = virdomort__$Value_Value_$Impl_$.toString(key3);
				$r = __map_reserved[key4] != null?changed.getReserved(key4):changed.h[key4];
				return $r;
			}(this)));
		}
	}
};
virdomort_dom_VDom.updateEventHandlers = function(vold,vnew,element,patch) {
	if(!patch.hasEventHandlerChanges) return;
	if(patch.hasAddedEventHandlers) {
		var added = patch.addedEventHandlers;
		var $it0 = added.keys();
		while( $it0.hasNext() ) {
			var key = $it0.next();
			virdomort_dom_VDom.setEventHandler(element,"on" + key,__map_reserved[key] != null?added.getReserved(key):added.h[key]);
		}
	}
	if(patch.hasRemovedEventHandlers) {
		var removed = patch.removedEventHandlers;
		var $it1 = new haxe_ds__$StringMap_StringMapIterator(removed,removed.arrayKeys());
		while( $it1.hasNext() ) {
			var key1 = $it1.next();
			virdomort_dom_VDom.removeEventHandler(element,"on" + Std.string(key1));
		}
	}
	if(patch.hasChangedEventHandlers) {
		var changed = patch.changedEventHandlers;
		var $it2 = changed.keys();
		while( $it2.hasNext() ) {
			var key2 = $it2.next();
			virdomort_dom_VDom.setEventHandler(element,"on" + key2,__map_reserved[key2] != null?changed.getReserved(key2):changed.h[key2]);
		}
	}
};
virdomort_dom_VDom.updateChildren = function(vold,vnew,element,patch) {
	if(!patch.hasChildrenChanges) return;
	if(patch.hasAddedChildren) {
		var added = patch.addedChildren;
		var _g = 0;
		while(_g < added.length) {
			var vchild = added[_g];
			++_g;
		}
	}
	if(patch.hasRemovedChildren) {
	}
	if(patch.hasMovedChildren) {
	}
};
virdomort_dom_VDom.replaceNode = function(vold,vnew) {
	var rnew = virdomort_dom_VDom.createNode(vnew);
	var rold = virdomort__$VNode_VNode_$Impl_$.getRef(vold);
	var roldParent = rold.parentNode;
	roldParent.removeChild(rold);
	roldParent.appendChild(rnew);
};
virdomort_dom_VDom.ve = function(tag,key,$namespace,attributes,events,children) {
	return new virdomort_VElement(virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue(tag),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue(key),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue($namespace),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue(attributes),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue(events),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue(children));
};
virdomort_dom_VDom.vt = function(text) {
	return new virdomort_VText(virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue(text));
};
virdomort_dom_VDom.id = function(velement,id) {
	var v = virdomort__$Value_Value_$Impl_$.fromString(virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue(id));
	velement.attributes.set(virdomort_dom_VDom.V_ID_KEY,v);
	v;
	return velement;
};
virdomort_dom_VDom.cl = function(velement,className) {
	return virdomort_dom_VDom.cls(velement,[virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue(className)]);
};
virdomort_dom_VDom.cln = function(velement,classNames) {
	return virdomort_dom_VDom.cls(velement,new EReg("[ \t]+","g").split(virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue(classNames)));
};
virdomort_dom_VDom.cls = function(velement,classNames) {
	var classes = virdomort_dom_VDom.getClasses(velement);
	var _g = 0;
	while(_g < classNames.length) {
		var className = classNames[_g];
		++_g;
		classes.push(className);
	}
	return velement;
};
virdomort_dom_VDom.clc = function(velement,conditional,classNameIfTrue,classNameIfFalse) {
	if(virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue(conditional)) return virdomort_dom_VDom.cl(velement,classNameIfTrue); else if(classNameIfFalse != null) return virdomort_dom_VDom.cl(velement,virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue(virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue(classNameIfFalse))); else return velement;
};
virdomort_dom_VDom.st = function(velement,name,value) {
	var styles = virdomort_dom_VDom.getStyles(velement);
	var k = virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue(name);
	var v = virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue(value);
	if(__map_reserved[k] != null) styles.setReserved(k,v); else styles.h[k] = v;
	v;
	return velement;
};
virdomort_dom_VDom.sts = function(velement,s) {
	var styles = virdomort_dom_VDom.getStyles(velement);
	var _g = 0;
	var _g1 = virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue(s);
	while(_g < _g1.length) {
		var style = _g1[_g];
		++_g;
		var v = style.value;
		styles.set(style.name,v);
		v;
	}
	return velement;
};
virdomort_dom_VDom.stc = function(velement,name,conditional,valueIfTrue,valueIfFalse) {
	if(virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue(conditional)) return virdomort_dom_VDom.st(velement,virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue(virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue(name)),valueIfTrue); else if(valueIfFalse != null) return virdomort_dom_VDom.st(velement,virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue(virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue(name)),virdomort__$ValOrFunc_ValOrFunc_$Impl_$.fromValue(virdomort__$ValOrFunc_ValOrFunc_$Impl_$.getValue(valueIfFalse))); else return velement;
};
virdomort_dom_VDom.getClasses = function(velement) {
	if(velement.attributes.get(virdomort_dom_VDom.V_CLASSES_KEY) == null) {
		var v = virdomort__$Value_Value_$Impl_$.fromStringArray([]);
		velement.attributes.set(virdomort_dom_VDom.V_CLASSES_KEY,v);
		v;
	}
	return virdomort__$Value_Value_$Impl_$.toStringArray(velement.attributes.get(virdomort_dom_VDom.V_CLASSES_KEY));
};
virdomort_dom_VDom.getClassName = function(velement) {
	return virdomort_dom_VDom.getClasses(velement).join(" ");
};
virdomort_dom_VDom.getStyles = function(velement) {
	if(velement.attributes.get(virdomort_dom_VDom.V_STYLES_KEY) == null) {
		var v = virdomort__$Value_Value_$Impl_$.fromStringMap(new haxe_ds_StringMap());
		velement.attributes.set(virdomort_dom_VDom.V_STYLES_KEY,v);
		v;
	}
	return virdomort__$Value_Value_$Impl_$.toStringMap(velement.attributes.get(virdomort_dom_VDom.V_STYLES_KEY));
};
virdomort_dom_VDom.setAttribute = function(element,key,value) {
	if(key == virdomort_dom_VDom.V_CLASSES_KEY) {
		var className = virdomort__$Value_Value_$Impl_$.toStringArray(value).join(" ");
		element.className = className;
		return;
	}
	if(key == virdomort_dom_VDom.V_STYLES_KEY) {
		var styles = virdomort__$Value_Value_$Impl_$.toStringMap(value);
		var $it0 = styles.keys();
		while( $it0.hasNext() ) {
			var styleKey = $it0.next();
			element.style.setProperty(styleKey,__map_reserved[styleKey] != null?styles.getReserved(styleKey):styles.h[styleKey]);
		}
		return;
	}
	Reflect.setField(element,key,virdomort__$Value_Value_$Impl_$.toValue(value));
};
virdomort_dom_VDom.setAttributes = function(element,attributes) {
	var $it0 = attributes.keys();
	while( $it0.hasNext() ) {
		var key = $it0.next();
		virdomort_dom_VDom.setAttribute(element,key,__map_reserved[key] != null?attributes.getReserved(key):attributes.h[key]);
	}
};
virdomort_dom_VDom.removeAttribute = function(element,key) {
	if(key == virdomort_dom_VDom.V_CLASSES_KEY) {
		element.removeAttribute(virdomort_dom_VDom.CLASS_NAME_KEY);
		return;
	}
	if(key == virdomort_dom_VDom.V_STYLES_KEY) {
		element.removeAttribute(virdomort_dom_VDom.STYLE_KEY);
		return;
	}
	Reflect.deleteField(element,key);
};
virdomort_dom_VDom.setEventHandler = function(element,key,eventHandler) {
	element["on" + key] = eventHandler;
};
virdomort_dom_VDom.setEventHandlers = function(element,events) {
	var $it0 = events.keys();
	while( $it0.hasNext() ) {
		var key = $it0.next();
		virdomort_dom_VDom.setEventHandler(element,key,__map_reserved[key] != null?events.getReserved(key):events.h[key]);
	}
};
virdomort_dom_VDom.removeEventHandler = function(element,key) {
	element.removeAttribute(key);
};
virdomort_dom_VDom.setChildren = function(element,vnodes) {
	var _g = 0;
	while(_g < vnodes.length) {
		var vnode = vnodes[_g];
		++_g;
		var node = virdomort_dom_VDom.createNode(vnode);
		element.appendChild(node);
	}
};
String.__name__ = true;
Array.__name__ = true;
Date.__name__ = ["Date"];
var __map_reserved = {}
virdomort_dom_VDom.V_ID_KEY = "id";
virdomort_dom_VDom.V_CLASSES_KEY = "classes";
virdomort_dom_VDom.V_STYLES_KEY = "styles";
virdomort_dom_VDom.ID_KEY = "id";
virdomort_dom_VDom.CLASS_NAME_KEY = "className";
virdomort_dom_VDom.STYLE_KEY = "style";
examples_basic_Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});
