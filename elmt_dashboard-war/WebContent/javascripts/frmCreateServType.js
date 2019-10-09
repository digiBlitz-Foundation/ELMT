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
function trim(s) {
    return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );
}

function myvalidate(){

if(document.frmCreateServType.uType.selectedIndex==0){
		alert(" Please select valid User Type");
		document.frmCreateServType.uType.focus();
		return false;
	}

//-------------------------------------Service Type name:------------------------------------------------------------

if(document.frmCreateServType.horseServiceTypeName.value=="")
   {alert(" Please enter valid Service ");
     document.frmCreateServType.horseServiceTypeName.focus();
    return false; }

//if(document.frmCreateServType.horseServiceTypeName.value.indexOf(' ')==0)
//{
	if((document.frmCreateServType.horseServiceTypeName.value.indexOf('	') == 0) || (document.frmCreateServType.horseServiceTypeName.value.lastIndexOf('	') == (document.frmCreateServType.horseServiceTypeName.value.length-1)) ||
				(document.frmCreateServType.horseServiceTypeName.value.indexOf(' ') == 0) || (document.frmCreateServType.horseServiceTypeName.value.lastIndexOf(' ') == (document.frmCreateServType.horseServiceTypeName.value.length-1)))
	{	
 document.frmCreateServType.horseServiceTypeName.value=trim(document.frmCreateServType.horseServiceTypeName.value);
     	alert("Leading and Trailing spaces will be trimmed. Please submit again");
		return false;
  }

	if(document.frmCreateServType.horseServiceTypeName.value.length >80 )
 {alert("Service cannot have more than 80 characters");
  document.frmCreateServType.horseServiceTypeName.focus();
 return false;}

 //------------------------------------- Amount--------------------------------------------------------------
 if(document.frmCreateServType.horseServiceTypeAmount.value=="")
   {alert(" Please enter valid Cost");
     document.frmCreateServType.horseServiceTypeAmount.focus();
    return false; }
if(document.frmCreateServType.horseServiceTypeAmount.value.indexOf(' ')==0)
	{
		document.frmCreateServType.horseServiceTypeAmount.value=trim(document.frmCreateServType.horseServiceTypeAmount.value);
    	alert("Leading and Trailing spaces will be trimmed. Please submit again");
		return false;
	}

	   if(!(document.frmCreateServType.horseServiceTypeAmount.value=="")){
		   {
			   if(!Number(document.frmCreateServType.horseServiceTypeAmount.value)){
					alert(" Please enter valid Cost");
					document.frmCreateServType.horseServiceTypeAmount.focus();
					return false;
				}
			}
			if((document.frmCreateServType.horseServiceTypeAmount.value.indexOf('.'))!=-1){
				fstr=document.frmCreateServType.horseServiceTypeAmount.value;
				fstr1=document.frmCreateServType.horseServiceTypeAmount.value.indexOf('.');
				mm = (fstr.substring(fstr1,document.frmCreateServType.horseServiceTypeAmount.value.length));
				str=(Number(mm.length));
					if((str)>3){
						alert(" Please enter valid Cost ");
						document.frmCreateServType.horseServiceTypeAmount.focus();
						return false;
					}
				}
		}


	if(document.frmCreateServType.rd1[0].checked==false && document.frmCreateServType.rd1[1].checked==false )
            {
                alert("Please choose the Status");
                document.frmCreateServType.rd1[0].focus();
                return false;
           }
        if(document.frmCreateServType.transacType.selectedIndex==0){
		alert("Please select valid QB Transaction Type");
		document.frmCreateServType.transacType.focus();
		return false;
	}
	return true;
    }
	