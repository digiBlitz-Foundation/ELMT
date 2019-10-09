#-------------------------------------------------------------------------------
# * * Copyright: 2019 digiBlitz Foundation
#  * * 
#  * * License: digiBlitz Public License 1.0 (DPL) 
#  * * Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
#  * * 
#  * * Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
#  * * 
#  * * Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
#  * * 
#  * * "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
#-------------------------------------------------------------------------------
/*  Javascript Document 
******************************************************************************************************************
	Product Name: Integrated Enterprise Dashboard - Association / Club V0.5
	Organization: digiBlitz Technologies (P) Ltd.
    Created by: K.N.Sathish
    Created Date: 07/08/2006  
*****************************************************************************************************************
*/
/* -------------------------------------------------------
	System Date
---------------------------------------------------------*/

var isn1=null;
var isn2=false;
today=new Date();

// Build an array initializer
function isnArray() {
 argnr=isnArray.arguments.length;
 for (var i=0;i<argnr;i++) {
  this[i+1] = isnArray.arguments[i];
  }
 }
// And months and day arrays
var isnMonths=new isnArray("JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC");
var isnDays= new isnArray("SUN","MON","TUE","WED","THU","FRI","SAT");


/* -------------------------------------------------------
Trapping or disabling the rightclick menu.
---------------------------------------------------------*/

function norightmenu(){
document.oncontextmenu = function(){return false}
}


/* -------------------------------------------------------
	Open Browser Window.
---------------------------------------------------------*/

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
/* -------------------------------------------------------
 Bookmark a site or page
---------------------------------------------------------*/
//var bookmarkurl="http://www.useventing.com"

var bookmarkurl=window.location.href;
var bookmarktitle="Site Tile";

function addbookmark(){
	if (document.all)
	window.external.AddFavorite(bookmarkurl,bookmarktitle);
}

/* -------------------------------------------------------
 Detecting User's Operating System
---------------------------------------------------------*/

function checkOS() {
  if(navigator.userAgent.indexOf('IRIX') != -1)
    { var OpSys = "Irix"; }
  else if((navigator.userAgent.indexOf('Win') != -1) &&
  (navigator.userAgent.indexOf('95') != -1))
    { var OpSys = "Windows95"; }
  else if(navigator.userAgent.indexOf('Win') != -1)
    { var OpSys = "Windows3.1 or NT"; }
  else if(navigator.userAgent.indexOf('Mac') != -1)
    { var OpSys = "Macintosh"; }
  else { var OpSys = "other"; }
  return OpSys;
}

/* -------------------------------------------------------
 Detecting User's Browser & OS
---------------------------------------------------------*/
var BrowserDetect = {
	init: function init () {
		this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
		this.version = this.searchVersion(navigator.userAgent)
			|| this.searchVersion(navigator.appVersion)
			|| "an unknown version";
		this.OS = this.searchString(this.dataOS) || "an unknown OS";
	},
	searchString: function (data) {
		for (var i=0;i<data.length;i++)	{
			var dataString = data[i].string;
			var dataProp = data[i].prop;
			this.versionSearchString = data[i].versionSearch || data[i].identity;
			if (dataString) {
				if (dataString.indexOf(data[i].subString) != -1)
					return data[i].identity;
			}
			else if (dataProp)
				return data[i].identity;
		}
	},
	searchVersion: function (dataString) {
		var index = dataString.indexOf(this.versionSearchString);
		if (index == -1) return;
		return parseFloat(dataString.substring(index+this.versionSearchString.length+1));
	},
	dataBrowser: [
		{
			string: navigator.vendor,
			subString: "Apple",
			identity: "Safari"
		},
		{
			prop: window.opera,
			identity: "Opera"
		},
		{
			string: navigator.userAgent,
			subString: "Firefox",
			identity: "Firefox"
		},
		{	// for newer Netscapes (6+)
			string: navigator.userAgent,
			subString: "Netscape",
			identity: "Netscape"
		},
		{
			string: navigator.userAgent,
			subString: "MSIE",
			identity: "Explorer",
			versionSearch: "MSIE"
		},
		{
			string: navigator.userAgent,
			subString: "Gecko",
			identity: "Mozilla",
			versionSearch: "rv"
		},
		{ 	// for older Netscapes (4-)
			string: navigator.userAgent,
			subString: "Mozilla",
			identity: "Netscape",
			versionSearch: "Mozilla"
		}
	],
	dataOS : [
		{
			string: navigator.platform,
			subString: "Win",
			identity: "Windows"
		},
		{
			string: navigator.platform,
			subString: "Mac",
			identity: "Mac"
		},
		{
			string: navigator.platform,
			subString: "Linux",
			identity: "Linux"
		}
	]

};
BrowserDetect.init()


/* -------------------------------------------------------
 Swapping Stylesheets
---------------------------------------------------------*/
var csstype="external";
var IECSS='css/store-ie.css';
var FFCSS='css/store-mff.css'; 

if (csstype=="external"){
	if(BrowserDetect.browser == "Explorer"){
		document.write('<link rel="stylesheet" type="text/css" href="'+ (IECSS) +'" />');
	}else if(BrowserDetect.browser == "Firefox"){
		document.write('<link rel="stylesheet" type="text/css" href="'+ (FFCSS) +'" />');
	}
}

/* -------------------------------------------------------
 Image Preloading
---------------------------------------------------------*/

imgPrArr=new Array()
function imgPreload(imgP){
	imgPrArrT=(imgP+",").split(",");
	for (i in imgPrArrT){
		if (imgPrArrT[i]!=""){
			imgPrArr[imgPrArrT[i]]=new Image();
			imgPrArr[imgPrArrT[i]].src=imgPrArrT[i];
			}
		}
	}
imgPreload("images/i1_2.gif, images/i2_2.gif, images/i3_2.gif");


/* -------------------------------------------------------
 HLC Related Scripts
---------------------------------------------------------*/

function expandColl(divId){
	if(document.getElementById(divId).style.display == "none"){
			document.getElementById(divId).style.display = "block";	
	}else {
			document.getElementById(divId).style.display = "none";	
	} 
}

function getStyleObject(objectId) {
		  // checkW3C DOM, then MSIE 4, then NN 4.
		  //
		  if(document.getElementById && document.getElementById(objectId)) {
				return document.getElementById(objectId).style;
		   } else if (document.all && document.all(objectId)) {  
				return document.all(objectId).style;
		   } else if (document.layers && document.layers[objectId]) { 
				return document.layers[objectId];
		   } else {
				return false;
		   }
}

function switchDiv(divID){
			//alert("hi");
		  var styleObj = getStyleObject(divID);
		  
		  if (styleObj){
			//hideAll();
			changeObjectDisplay(divID, "block");
		  }
		  else {
		  	document.getElementById(divId).style.display = "none";
			alert("sorry, this only works in browsers that do Dynamic HTML");
		  }
}

function changeObjectDisplay(objectId, newDisplay) {
			var styleObject = getStyleObject(objectId);
			if (styleObject) {
				styleObject.display = newDisplay;
				return true;
			} else {
				return false;
			}
}

function dispVal(selBx, txtBx){
	var sBx = selBx;
	var tBx = txtBx;
	var el = document.forms[0].elements;
		for (i=0; i < el.length; i++) {
				if (el[i].name == sBx) {
					if (document.getElementById(sBx).value != null) {
						document.getElementById(tBx).value = document.getElementById(sBx).value;
					}
				}
		}
}


function show(rowId){	
		if(document.getElementById(rowId).style.display == "none"){
			document.getElementById(rowId).style.display = "block";
		}
		else{
			document.getElementById(rowId).style.display = "none";
		}
	}


function hide(rowId){	
	if(document.getElementById(rowId).style.display == "block"){
		document.getElementById(rowId).style.display = "none";
	}
	else{
		document.getElementById(rowId).style.display = "block";
	}
}


function disableRad(radBtnId,txtBxId,radVal){
		if(document.getElementById(radBtnId).value == radVal){
			document.getElementById(txtBxId).disabled = false;
			document.getElementById(txtBxId).value = "";
			document.getElementById(txtBxId).focus();
		}
		else{
			document.getElementById(txtBxId).disabled = true;
			document.getElementById(txtBxId).value = " Disabled";
		}
}	

/* -------------------------------------------------------
 Swapping Classes For Menus
---------------------------------------------------------*/

var selected_id = null;
var dom = document.getElementById;

function swapIt(id, newclass) {
	if (dom) {
		if(selected_id != id) {
			el = document.getElementById(id);
			el.className = newclass;
			el.style.cursor = "hand";
			el.style.cursor = "pointer";
		}
	}
}

function down (id,oldclass,newclass){
	if (dom) {
		if(selected_id != null) {
			document.getElementById(selected_id).className = oldclass;
		}
		el.className = newclass;
		selected_id = id;
	}
}

function naviTab(tab_id){
	  for(i=1; i<=6; i++){
			tdId = document.getElementById("tabData"+i);
			divId = document.getElementById("part"+i);
			linkId = document.getElementById("link"+i);
			
			if(tab_id==i){
			  tdId.className="tabHighlight";
			  linkId.className="active";
			  tdId.style.borderBottom="0px solid #FFFFFF";
			  divId.style["display"]="block";
			  divId.style["visibility"]="visible";
			}
			else{
			  tdId.className="tabLowlight";
			  linkId.className="inactive";
			  tdId.style.borderBottom="1px solid #999";
			  divId.style["display"]="none";
			  divId.style["visibility"]="hidden";
			}
	  }
}
