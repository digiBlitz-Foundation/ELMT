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
function showList(){
	if(document.frmItemMaster.subItem.checked == true){
		document.frmItemMaster.subItemNo.disabled = false;
	}
	else{
		document.frmItemMaster.subItemNo.disabled = true;
	}
}

function hideList(){
	document.frmItemMaster.subItemNo.disabled =true;
}

function chkValid(){
	if(document.frmItemMaster.servMasterNo.value == "" || document.frmItemMaster.servMasterNo.value.indexOf(' ')==0){
		alert('Select Any one of the Service Type');
		document.frmItemMaster.servMasterNo.focus();
		return false;
	}
	
	if(document.frmItemMaster.itemNameNumber.value=="" || document.frmItemMaster.itemNameNumber.value.indexOf(' ')==0){
		alert('Item Name/Number cannot be empty');
		document.frmItemMaster.itemNameNumber.focus();
		return false;
	}
	
/*	if(document.frmItemMaster.itemNameNumber.value!="" || document.frmItemMaster.itemNameNumber.value.indexOf(' ')!=0){
		if(itemNameNumberChk(document.frmItemMaster.itemNameNumber.value)){
			alert('Enter a valid Item Name/Number');
			document.frmItemMaster.itemNameNumber.focus();
			return false;		
		}
	}*/
	
	if(document.frmItemMaster.subItem.checked == true){
		if(document.frmItemMaster.subItemNo.value=="" || document.frmItemMaster.subItemNo.value.indexOf(' ')==0){
			alert('Select Any one of the Sub Item');
			document.frmItemMaster.subItemNo.focus();
			return false;					
		}
		if(document.frmItemMaster.subItemNo.value!=""){
			var itemNo = document.frmItemMaster.itemNameNumber.value;
			var subItemNo = document.frmItemMaster.subItemNo.value;
			if(itemNo==subItemNo){
				alert('Selected Sub Item cannot be a subitem of itself');
				document.frmItemMaster.subItemNo.focus();
				return false;
			}
		}
	}
	
	if(document.frmItemMaster.itemDescrption.value=="" || document.frmItemMaster.itemDescrption.value.indexOf(' ')==0){
		alert('Item Description Cannot be empty');
		document.frmItemMaster.itemDescrption.focus();
		return false;
	}	
	
	if(document.frmItemMaster.itemRate.value!="" || document.frmItemMaster.itemRate.value.indexOf(' ')!=0){
		if(isnotIntegerChk(document.frmItemMaster.itemRate.value)){
			alert('Enter Valid Item Rate');
			document.frmItemMaster.itemRate.focus();
			return false;
		}
	}
	
	if(document.frmItemMaster.AccountNo.value == "" || document.frmItemMaster.AccountNo.value.indexOf(' ')==0){
		alert('Select Any of the Account ');
		document.frmItemMaster.AccountNo.focus();
		return false;
	}		
}

function itemNameNumberChk(str){
	stringIntCheck="abcdefghijklmopqrstuvwxyz0123456789.-()";
	f2=1;
	
	for(j=0;j<str.length;j++)
	{ 
		if(stringIntCheck.indexOf(str.charAt(j))==-1){
			f2=0;
		}
	}
	if(f2==0){
		return true;
	}
	else{ 
	  return false;
	}
}

function isnotIntegerChk(str){
	stringIntCheck="0123456789.";
	f2=1;
	
	for(j=0;j<str.length;j++)
	{ 
		if(stringIntCheck.indexOf(str.charAt(j))==-1){
			f2=0;
		}
	}
	if(f2==0){
		return true;
	}
	else{ 
	  return false;
	}
}

function enableCombo(){
	if(document.frmItemMaster.subItem.checked==true){
		document.frmItemMaster.subItemNo.disabled = false;
	}
}