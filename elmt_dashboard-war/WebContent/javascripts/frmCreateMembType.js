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
/*function populateEditYear(){
	var dte1 = new Date();
	var yr1 = dte1.getFullYear();
	yr2= document.frmCreateMembType.populYr.value;
	for(i=0;i<2;i++){
		if(yr2 == yr1){
			yr2=0;
		}
		else{
			addOption(document.frmCreateMembType.memYear,yr1+i,yr1+i);
		}
	}
}*/

/*function populateYear(){
    var dte = new Date();
    var yr = dte.getFullYear();
    for(i=0;i<2;i++){
        addOption(document.frmCreateMembType.memYear,yr+i,yr+i);
    }
}*/
/*function addOption(selectbox,text,value )
{
    var optn = document.createElement("OPTION");
    optn.text = text;
    optn.value = value;
    selectbox.options.add(optn);
}*/
function resetAll()
{
    if(document.frmCreateMembType.memName.readOnly==false)
    {
        document.frmCreateMembType.memName.value="";
    }
    document.frmCreateMembType.memAmount.value="";
    document.frmCreateMembType.periodValue.value="";
    document.frmCreateMembType.DurationNoDdl.value="";
    document.frmCreateMembType.DurationTypeDdl.options.selectedIndex = 0;
    document.frmCreateMembType.status1.checked=false;
    document.frmCreateMembType.status2.checked=false;
    document.frmCreateMembType.transacType.selectedIndex=0;
}
function trim(s) {
    return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );
}
function myvalidate(){
    
    //-------------------------------------Membership name------------------------------------------------------------

    if(document.frmCreateMembType.memName.value=="")
    {
        alert("Please enter valid Membership type");
        document.frmCreateMembType.memName.focus();
        return false;
    }
  //  if((document.frmCreateMembType.memName.value.indexOf(' ')==0)
   // {
		if((document.frmCreateMembType.memName.value.indexOf('	') == 0) || (document.frmCreateMembType.memName.value.lastIndexOf('	') == (document.frmCreateMembType.memName.value.length-1)) ||
				(document.frmCreateMembType.memName.value.indexOf(' ') == 0) || (document.frmCreateMembType.memName.value.lastIndexOf(' ') == (document.frmCreateMembType.memName.value.length-1)))
	{		

        document.frmCreateMembType.memName.value = trim(document.frmCreateMembType.memName.value);
        alert("Leading and Trailing spaces will be trimmed. Please Submit again");
		return false;
    }

    if((document.frmCreateMembType.memName.value.length >80 ))
    {
        alert("Membership Type cannot have more than 80 characters");
        document.frmCreateMembType.memName.focus();
        return false;
    }


    //-------------------------------------------Membership Amount------------------------------------------------------------------

    if(document.frmCreateMembType.memAmount.value=="")
    {
        alert(" Please enter  valid Membership Cost $ ");
        document.frmCreateMembType.memAmount.focus();
        return false;
    }
    if(document.frmCreateMembType.memAmount.value.indexOf(' ')==0)
    {
        document.frmCreateMembType.memAmount.value = trim(document.frmCreateMembType.memAmount.value);
        alert("Leading and Trailing spaces will be trimmed. Please Submit again");
        return false;
    }

    if(!(document.frmCreateMembType.memAmount.value=="")){
    {
        if(!Number(document.frmCreateMembType.memAmount.value))

        {
            alert("Membership Cost $ is not valid");
            document.frmCreateMembType.memAmount.focus();
            return false;
        }
    }
    if((document.frmCreateMembType.memAmount.value.indexOf('.'))!=-1){
        fstr=document.frmCreateMembType.memAmount.value;
        fstr1=document.frmCreateMembType.memAmount.value.indexOf('.');
        mm = (fstr.substring(fstr1,document.frmCreateMembType.memAmount.value.length));
        str=(Number(mm.length));
        if((str)>3){
            alert("Membership Cost $ is not valid ");
            document.frmCreateMembType.memAmount.focus();
            return false;
        }
    }
    }

    if(document.frmCreateMembType.memAmount.value.length>16)
    {
        alert("Membership Cost $ cannot have more than 16 characters");
        document.frmCreateMembType.memAmount.focus();
        return false;
    }
    //-------------------------------------------Membership Duration------------------------------------------------------------------
    if(document.frmCreateMembType.DurationNoDdl.value.length>3 )
    {
        alert("Duration cannot have more than 3 characters");
        document.frmCreateMembType.DurationNoDdl.focus();
        return false;
    }
    if(!Number(document.frmCreateMembType.DurationNoDdl.value)){
        alert("Please enter valid Duration");
        document.frmCreateMembType.DurationNoDdl.focus();
        return false;
    }
    if(document.frmCreateMembType.DurationTypeDdl.value=="Select One"){
        alert(" Please select valid Duration ");
        document.frmCreateMembType.DurationTypeDdl.focus();
        return false;
    }

    if(document.frmCreateMembType.DurationTypeDdl.options[document.frmCreateMembType.DurationTypeDdl.selectedIndex].value ==""){
        alert(" Please select valid Duration ");
        document.frmCreateMembType.DurationTypeDdl.focus();
        return false;
    }
    //-------------------------------------------Membership Status------------------------------------------------------------------
    if((document.frmCreateMembType.rd1[0].checked==false)&&(document.frmCreateMembType.rd1[1].checked==false)){
        alert("Please choose the Status");
        return false;
    }

    //-------------------------------------------Membership PeriodValue------------------------------------------------------------------

    if((document.frmCreateMembType.periodValue.value!="")&&(document.frmCreateMembType.periodValue.value.indexOf(' ')!=0 && document.frmCreateMembType.periodValue.value!=0)){
        if(document.frmCreateMembType.periodValue.value.length >4 )
        {
            alert("Membership Priority cannot have more than 3 characters");
            document.frmCreateMembType.periodValue.focus();
            return false;
        }
        if(!Number(document.frmCreateMembType.periodValue.value)){
            alert("Please enter valid Membership Priority");
            document.frmCreateMembType.periodValue.focus();
            return false;
        }
        if(document.frmCreateMembType.periodValue.value.indexOf('.')!=-1){
            alert("Please enter valid Membership Priority");
            document.frmCreateMembType.periodValue.focus();
            return false;
        }
    }
    if(document.frmCreateMembType.transacType.selectedIndex==0){
        alert("Please select valid QB Transaction Type");
        document.frmCreateMembType.transacType.focus();
        return false;
    }
    //return false;
    return true;
}
//-----------------------function for pure Integer Numbers

//alert('Before Period Value > 0');
/*	if(document.frmCreateMembType.periodValue.value.length>0)
	{
		//alert('Inside Period Value  > 0');
		str=document.frmCreateMembType.periodValue.value;
		stringIntCheck="0123456789";
		f2=1;
		for(j=0;j<str.length;j++)
		{
			if(stringIntCheck.indexOf(str.charAt(j))!=-1){
					f2=0;
					//alert('Not Matching');
					}
		}
		if(f2==0)
		{ return true; } else {    alert('Enter valid priority'); document.frmCreateMembType.periodValue.focus();  return false;}
	}

*/