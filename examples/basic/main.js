(function (console) { "use strict";
var $estr = function() { return js_Boot.__string_rec(this,''); };
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
Std.string = function(s) {
	return js_Boot.__string_rec(s,"");
};
var StringBuf = function() {
	this.b = "";
};
StringBuf.__name__ = true;
StringBuf.prototype = {
	add: function(x) {
		this.b += Std.string(x);
	}
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
	var tree = virdomort_dom_VElementDomTools.ve("div",null,null,(function($this) {
		var $r;
		var _g = new haxe_ds_StringMap();
		{
			var value = virdomort_AttributeValue.VString("test-id");
			if(__map_reserved.id != null) _g.setReserved("id",value); else _g.h["id"] = value;
		}
		{
			var value1 = virdomort_AttributeValue.VString("test-class-1 test-class-2");
			if(__map_reserved["class"] != null) _g.setReserved("class",value1); else _g.h["class"] = value1;
		}
		$r = _g;
		return $r;
	}(this)),(function($this) {
		var $r;
		var _g1 = new haxe_ds_StringMap();
		if(__map_reserved.click != null) _g1.setReserved("click",onClick); else _g1.h["click"] = onClick;
		$r = _g1;
		return $r;
	}(this)),[virdomort_dom_VTextTools.vt("Hello, world!")]);
	console.log(tree);
	var root = window.document.getElementById("root");
	var el = virdomort_dom_Dom.create(tree);
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
	,toString: function() {
		var s = new StringBuf();
		s.b += "{";
		var keys = this.arrayKeys();
		var _g1 = 0;
		var _g = keys.length;
		while(_g1 < _g) {
			var i = _g1++;
			var k = keys[i];
			if(k == null) s.b += "null"; else s.b += "" + k;
			s.b += " => ";
			s.add(Std.string(__map_reserved[k] != null?this.getReserved(k):this.h[k]));
			if(i < keys.length) s.b += ", ";
		}
		s.b += "}";
		return s.b;
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
var virdomort_AttributeValue = { __ename__ : true, __constructs__ : ["VNone","VInt","VFloat","VBool","VString","VDate","VStrings","VStringMap"] };
virdomort_AttributeValue.VNone = ["VNone",0];
virdomort_AttributeValue.VNone.toString = $estr;
virdomort_AttributeValue.VNone.__enum__ = virdomort_AttributeValue;
virdomort_AttributeValue.VInt = function(v) { var $x = ["VInt",1,v]; $x.__enum__ = virdomort_AttributeValue; $x.toString = $estr; return $x; };
virdomort_AttributeValue.VFloat = function(v) { var $x = ["VFloat",2,v]; $x.__enum__ = virdomort_AttributeValue; $x.toString = $estr; return $x; };
virdomort_AttributeValue.VBool = function(v) { var $x = ["VBool",3,v]; $x.__enum__ = virdomort_AttributeValue; $x.toString = $estr; return $x; };
virdomort_AttributeValue.VString = function(v) { var $x = ["VString",4,v]; $x.__enum__ = virdomort_AttributeValue; $x.toString = $estr; return $x; };
virdomort_AttributeValue.VDate = function(v) { var $x = ["VDate",5,v]; $x.__enum__ = virdomort_AttributeValue; $x.toString = $estr; return $x; };
virdomort_AttributeValue.VStrings = function(v) { var $x = ["VStrings",6,v]; $x.__enum__ = virdomort_AttributeValue; $x.toString = $estr; return $x; };
virdomort_AttributeValue.VStringMap = function(v) { var $x = ["VStringMap",7,v]; $x.__enum__ = virdomort_AttributeValue; $x.toString = $estr; return $x; };
var virdomort_VElement = function(tag,key,$namespace,attributes,events,children) {
	this.tag = tag;
	this.key = key;
	this["namespace"] = $namespace;
	if(attributes != null) this.attributes = attributes; else this.attributes = new haxe_ds_StringMap();
	if(events != null) this.events = events; else this.events = new haxe_ds_StringMap();
	if(children != null) this.children = children; else this.children = [];
};
virdomort_VElement.__name__ = true;
var virdomort_VElementTools = function() { };
virdomort_VElementTools.__name__ = true;
virdomort_VElementTools.prototype = {
	tag: function(velement,tag) {
		velement.tag = tag;
		return velement;
	}
	,key: function(velement,key) {
		velement.key = key;
		return velement;
	}
	,ns: function(velement,$namespace) {
		velement["namespace"] = $namespace;
		return velement;
	}
	,attr: function(velement,name,value) {
		velement.attributes.set(name,value);
		return velement;
	}
	,on: function(velement,name,eventHandler) {
		velement.events.set(name,eventHandler);
		return velement;
	}
	,child: function(velement,c) {
		velement.children.push(c);
		return velement;
	}
	,children: function(velement,cs) {
		velement.children = velement.children.concat(cs);
		return velement;
	}
};
var virdomort_VNode = { __ename__ : true, __constructs__ : ["VElement","VText"] };
virdomort_VNode.VElement = function(element) { var $x = ["VElement",0,element]; $x.__enum__ = virdomort_VNode; $x.toString = $estr; return $x; };
virdomort_VNode.VText = function(text) { var $x = ["VText",1,text]; $x.__enum__ = virdomort_VNode; $x.toString = $estr; return $x; };
var virdomort_VText = function(text) {
	this.text = text;
};
virdomort_VText.__name__ = true;
var virdomort_dom_Dom = function() { };
virdomort_dom_Dom.__name__ = true;
virdomort_dom_Dom.create = function(vnode) {
	switch(vnode[1]) {
	case 1:
		var vtext = vnode[2];
		return virdomort_dom_Dom.createText(vtext);
	case 0:
		var velement = vnode[2];
		return virdomort_dom_Dom.createElement(velement);
	}
};
virdomort_dom_Dom.createText = function(vtext) {
	var rtext = window.document.createTextNode(vtext.text);
	vtext.ref = rtext;
	return rtext;
};
virdomort_dom_Dom.createElement = function(velement) {
	var relement = window.document.createElement(velement.tag);
	velement.ref = relement;
	var $it0 = velement.attributes.keys();
	while( $it0.hasNext() ) {
		var key = $it0.next();
		var value;
		{
			var _g = velement.attributes.get(key);
			switch(_g[1]) {
			case 1:
				var v = _g[2];
				if(v == null) value = "null"; else value = "" + v;
				break;
			case 2:
				var v1 = _g[2];
				if(v1 == null) value = "null"; else value = "" + v1;
				break;
			case 3:
				var v2 = _g[2];
				if(v2 == null) value = "null"; else value = "" + v2;
				break;
			case 4:
				var v3 = _g[2];
				value = v3;
				break;
			case 5:
				var v4 = _g[2];
				value = HxOverrides.dateStr(v4);
				break;
			case 6:
				var v5 = _g[2];
				value = v5.join(" ");
				break;
			case 7:
				var v6 = _g[2];
				value = v6.toString();
				break;
			case 0:
				value = null;
				break;
			}
		}
		relement[key] = value;
	}
	var $it1 = velement.events.keys();
	while( $it1.hasNext() ) {
		var key1 = $it1.next();
		Reflect.setField(relement,"on" + key1,velement.events.get(key1));
	}
	var _g1 = 0;
	var _g11 = velement.children;
	while(_g1 < _g11.length) {
		var vchild = _g11[_g1];
		++_g1;
		var rchild = virdomort_dom_Dom.create(vchild);
		switch(vchild[1]) {
		case 0:
			var v7 = vchild[2];
			v7.ref = rchild;
			break;
		case 1:
			var v8 = vchild[2];
			v8.ref = rchild;
			break;
		}
		relement.appendChild(rchild);
	}
	return relement;
};
var virdomort_dom_VElementDomTools = function() { };
virdomort_dom_VElementDomTools.__name__ = true;
virdomort_dom_VElementDomTools.ve = function(tag,key,$namespace,attributes,events,children) {
	return virdomort_VNode.VElement(new virdomort_VElement(tag,key,$namespace,attributes,events,children));
};
var virdomort_dom_VTextTools = function() { };
virdomort_dom_VTextTools.__name__ = true;
virdomort_dom_VTextTools.vt = function(t) {
	return virdomort_VNode.VText(new virdomort_VText(t));
};
String.__name__ = true;
Array.__name__ = true;
Date.__name__ = ["Date"];
var __map_reserved = {}
virdomort_dom_VElementDomTools.classes = "classes";
virdomort_dom_VElementDomTools.styles = "styles";
examples_basic_Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});
