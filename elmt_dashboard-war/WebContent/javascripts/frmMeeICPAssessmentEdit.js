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

function naviTab(tab_id){
	  for(i=1; i<=3; i++){
			tdId =document.getElementById('tabData'+i);
			divId = document.getElementById('part'+i);
			linkId = document.getElementById('link'+i);
			
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

/*
var part = new Array("A", "B", "C", "D");
var dom = document.getElementById;
function famAddOnInit(){
	for(i=1; i<=4; i++){
		dom("tabData" + i).style.display = "none";
		dom(i).innerHTML = "PART " + part[i-1];
		if(i==1){
			dom("tabData1").style.display = "block";
		}
	dom("tabData4").style.display = "block";
	dom(4).innerHTML = "PART " + part[1];
	}
}
*/

function showLevels(chkBxNam,divId){
		if(document.frmMeeICPAssessment.elements[chkBxNam].checked == true){
				document.getElementById(divId).style.display = "block";	
		}else {
				document.getElementById(divId).style.display = "none";	
		} 
}
				
function showHide(chkBxNam,divId){
		if(document.frmMeeICPAssessment.elements[chkBxNam].checked == true){
				document.getElementById(divId).style.display = "block";	
		}else {
				document.getElementById(divId).style.display = "none";	
		} 
}

function enabDisab(chkBxId,txtBxId){
	  
		if(document.frmMeeICPAssessment.elements[chkBxId].checked == true){
				document.frmMeeICPAssessment.elements[txtBxId].disabled = false;	
		}else {
				document.frmMeeICPAssessment.elements[txtBxId].disabled = "disabled";	
		} 
}

function enableRad(radBtnId,txtBxId){
		if(document.frmMeeICPAssessment.elements[radBtnId].checked == true){
				document.frmMeeICPAssessment.elements[txtBxId].disabled = false;	
		}else{
				document.frmMeeICPAssessment.elements[txtBxId].disabled = "disabled";	
		} 
}

function disable(radBtnNewId,txtBxId){
		if(document.frmMeeICPAssessment.elements[radBtnNewId].checked == true){
				document.frmMeeICPAssessment.elements[txtBxId].disabled = "disabled";	
		}
}	
		
function showHideRadio(radioNam,divId,radVal){
		if(document.frmMeeICPAssessment.elements[radioNam].value == radVal){
				document.getElementById(divId).style.display = "block";	
		}
		else {
				document.getElementById(divId).style.display = "none";	
		} 
}


/*
function dispAmt(){
	var docForm = document.frmMeeICPAssessment;
		if(docForm.selDisp.value != null){
			docForm.amount.value = docForm.selDisp.value;
		}
}
*/


		
