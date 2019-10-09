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
// JavaScript Document
function frmOnCheck(){
	if(document.frmSponsReg.finalCost.value==""){
		alert("The Final Cost field can't be blank");
		document.frmSponsReg.finalCost.focus();
		return false;
	}
   if(!Number(document.frmSponsReg.finalCost.value)){
		alert("Enter valid Final Cost");
		document.frmSponsReg.finalCost.focus();
		return false;
	}
	if(document.frmSponsReg.finalCost.value.indexOf('.')>7){
		alert("Enter valid Final Cost");
		document.frmSponsReg.finalCost.focus();
		return false;
	}
 
	if((document.frmSponsReg.finalCost.value.indexOf('.'))==-1){
		if(document.frmSponsReg.finalCost.value.length>7){
			alert("Enter valid Final Cost");
			document.frmSponsReg.finalCost.focus();
			return false;
		}
	}
		
	if(!(document.frmSponsReg.finalCost.value=="")){
		if((document.frmSponsReg.finalCost.value.indexOf('.'))!=-1){
			fstr=document.frmSponsReg.finalCost.value;
			fstr1=document.frmSponsReg.finalCost.value.lastIndexOf('.');
			mm = (fstr.substring(fstr1,document.frmSponsReg.finalCost.value.length));
			str=(Number(mm.length));
			if((str)>3){
				alert("Final Cost is not valid");
				document.frmSponsReg.finalCost.focus();
				return false;
			}
		}
	}
	
	
	if(document.frmSponsReg.contractStartDate.value==""){
		alert("Select Contract Start Date.");
		document.frmSponsReg.contractStartDate.focus();
		return false;
	}

if(!(document.frmSponsReg.contractStartDate.value=="")){
	
	var todayDate=new Date();
	var nowDate=todayDate.getDate();
	var nowYear=todayDate.getYear();
	var nowMonth1=todayDate.getMonth();
	var nowMonth=1+nowMonth1;
	
	if(nowDate<10){
		nowDate="0"+nowDate;
	}

	if(nowMonth<10){
		nowMonth="0"+nowMonth;
	}

	if(!(document.frmSponsReg.contractStartDate.value=="")){
		strdate=document.frmSponsReg.contractStartDate.value;
		mm = Number(strdate.substring(0,2));
		dd = Number(strdate.substring(3,5));
		yyyy=(strdate.substring(6,document.frmSponsReg.contractStartDate.value.length));
		yyyy1=(Number(yyyy.length));

			if(yyyy<nowYear){
				alert("Enter Valid Contract Start Date.");
				document.frmSponsReg.contractStartDate.focus();
				return false;
			}

			if((yyyy==nowYear)&&(mm<nowMonth)){
				alert("Enter Valid Contract Start Date.");
				document.frmSponsReg.contractStartDate.focus();
				return false;
			}

			if (mm>12){
				alert("Enter Valid Contract Start Date.");
				document.frmSponsReg.contractStartDate.focus();
				return false;
			}

			if((dd<nowDate)&&(mm==nowMonth)){
				alert("Enter Valid Contract Start Date.");
				document.frmSponsReg.contractStartDate.focus();
				return false;
			}

			else if(dd>31){
				alert("Enter Valid Contract Start Date.");
				document.frmSponsReg.contractStartDate.focus();
				return false;
			}
		}
	}

	if(document.frmSponsReg.contractEndDate.value==""){
		alert("Select Contract End Date.");
		document.frmSponsReg.contractEndDate.focus();
		return false;
	}

	if(!(document.frmSponsReg.contractEndDate.value=="")){
		strdate1=document.frmSponsReg.contractEndDate.value;
		mm1 = Number(strdate1.substring(0,2));
		dd1 = Number(strdate1.substring(3,5));
		yyy=(strdate1.substring(6,document.frmSponsReg.contractEndDate.value.length));
		yyy1=(Number(yyy.length));

			if(yyy<nowYear){
				alert("Enter Valid Contract End Date.");
				document.frmSponsReg.contractEndDate.focus();
				return false;
			}

			if((yyy1==nowYear)&&(mm1<nowMonth)){
				alert("Enter Valid Contract End Date.");
				document.frmSponsReg.contractEndDate.focus();
				return false;
			}

			if (mm1>12){
				alert("Enter Valid Contract End Date.");
				document.frmSponsReg.contractEndDate.focus();
				return false;
			}

			if((dd1<nowDate)&&(mm1==nowMonth)){
				alert("Enter Valid Contract End Date.");
				document.frmSponsReg.contractEndDate.focus();
				return false;
			}

			else if(dd1>31){
				alert("Enter Valid Contract End Date.");
				document.frmSponsReg.contractEndDate.focus();
				return false;
			}
		}


	if(!(document.frmSponsReg.contractEndDate.value=="")){
		
		strdate2=document.frmSponsReg.contractEndDate.value;
		mm2 = Number(strdate2.substring(0,2));
		dd2 = Number(strdate2.substring(3,5));
		yy = Number(strdate2.substring(6,document.frmSponsReg.contractEndDate.value.length));
	
		strdate3=document.frmSponsReg.contractStartDate.value;
		mm3 = Number(strdate3.substring(0,2));
		dd3 = Number(strdate3.substring(3,5));
		y = Number(strdate3.substring(6,document.frmSponsReg.contractStartDate.value.length));
		
			if(yy<y){
				alert("Enter Valid Contract End Date.");
				document.frmSponsReg.contractEndDate.focus();
				return false;
			}
			
			if((yy==y)&&(mm2<mm3)){
				alert("Enter Valid Contract End Date.");
				document.frmSponsReg.contractEndDate.focus();
				return false;
			}

			if((mm2==mm3)&&(dd2<dd3)){
				alert("Enter Valid Contract End Date..");
				document.frmSponsReg.contractEndDate.focus();
				return false;
			}
		}
	    if(document.frmSponsReg.fileUpload.value==""){
		alert("Please Upload contract form");
		document.frmSponsReg.fileUpload.focus();
		return false;
	}
	return true;
}
