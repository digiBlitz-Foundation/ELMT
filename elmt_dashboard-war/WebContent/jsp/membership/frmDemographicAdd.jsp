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
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/validate.js" type="text/javascript" ></script>
<script src="javascripts/frmCreateContactType.js" type="text/javascript" ></script>
 <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" />
<!--Start:[DemographicDetails] For Demographic Type Addition changes dated 11-Apr-2011-->
<script language="javascript">
 function myvalidate(obj){
	 vFlag = false;
       if(obj.Demo.value == ""){
		alert('Please enter valid Demographic');
		obj.Demo.focus();
		return false;
	}
        if(obj.Desc.value == ""){
		alert('Please enter valid Description');
		obj.Desc.focus();
		return false;
	}



	for(var i=0;i<obj.elements.length;i++)
	{
		if(obj.elements[i].type=='text')
		{
			if((obj.elements[i].value.indexOf('	') == 0) || (obj.elements[i].value.lastIndexOf('	') == (obj.elements[i].value.length-1)) ||
			(obj.elements[i].value.indexOf(' ') == 0) || (obj.elements[i].value.lastIndexOf(' ') == (obj.elements[i].value.length-1)))
			{
				obj.elements[i].value = obj.elements[i].value.trim();
                                obj.elements[i].focus();
				vFlag = true;
			}
		}
	}

	if(vFlag==true)
	{
		alert("Leading and Trailing spaces will be trimmed. Please submit again.");
		return false;
	}

	if(obj.DemogType.value == ""){
		alert('Please select valid Type');
		obj.DemogType.focus();
		return false;
	}

 if(document.getElementById('frmDemoAdd').status1.checked==false && document.getElementById('frmDemoAdd').status2.checked==false)
		{
				alert("Please choose the Status");
                                return false;
		}
    return true;
    }

        function clearFields(obj){

           obj.Demo.value="";
		   obj.Desc.value="";
		   obj.DemogType.selectedIndex="selected";

           document.getElementById('frmDemoAdd').status1.checked=false;
           document.getElementById('frmDemoAdd').status2.checked=false;

           /*var vOptionsLen = 0;

		   if(document.frmDemoAdd.DemogType.options[document.frmDemoAdd.DemogType.selectedIndex].value!='')
		   {
			   document.frmDemoAdd.DemogType.options.length = document.frmDemoAdd.DemogType.options.length+1;
				   document.frmDemoAdd.DemogType.options[document.frmDemoAdd.DemogType.options.length-1].value = "";
				   document.frmDemoAdd.DemogType.options[document.frmDemoAdd.DemogType.options.length-1].text = "Select One";
				   document.frmDemoAdd.DemogType.selectedIndex = document.frmDemoAdd.DemogType.options.length-1;
		   }

		   for(var i=0;i<(obj.DemogType.options.length-1);i++)
		   {
				if(document.frmDemoAdd.DemogType.options[i].value=='')
			   {
					vOptionsLen++;
					document.frmDemoAdd.DemogType.options.length = document.frmDemoAdd.DemogType.options.length - vOptionsLen;
					document.frmDemoAdd.DemogType.selectedIndex = 0;//document.frmDemoAdd.DemogType.options.length-1;

			   }
		   }*/


           return true;
}

</script>
<!--End:[DemographicDetails] For Demographic Type Addition changes dated 11-Apr-2011-->

<!--Start:[DemographicDetails] For Demographic Type Addition changes dated 11-Apr-2011-->

<script language="javascript">
  function CancelContactType(){
       if(confirm("Do you want to Cancel and go back to List Page?"))
	{
	strURL = "./Demographic.do?horseprocess=list";
	window.location.href = strURL;
         }
	else
	{
		return;
	}
       }
       </script>
<!--End:[DemographicDetails] For Demographic Type Addition changes dated 11-Apr-2011-->

</head>

<body>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab">
  <tr>
    <td class="alignTop">
		<!-- HEADER STARTS HERE -->
		<%@ include file = "../../include/header.jsp" %>
		<!-- HEADER ENDS HERE -->
	</td>
  </tr>
  <tr>
    <td class="infoBar">
		<!-- INFO BAR STARTS HERE -->
		<%@ include file = "../../include/infobar.jsp" %>
		<!-- INFO BAR ENDS HERE -->
	</td>
  </tr>
  <!--Start:[DemographicDetails] For Demographic Type Addition changes dated 11-Apr-2011-->

  <tr>
    <td class="tableCommonBg">

		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">

		  <tr>

			<td width="500" class="subDeptTablePad">

<table border="1" cellpadding="0" align="center" cellspacing="0" class="tblInnerContainer">
  <tr>
    <td colspan="2" class="tblMainHead">
	Demographic Categories - Human: <span class="styleBoldTwo">Create</span></td>
  </tr>
  <tr>
    <td colspan="2" class="tblDescrp">
	  You can <strong>Create</strong> a <strong>New Demographic Category - Human</strong> for all members and non-members Online Services Dashboard, right here!</td>
  </tr>
  <tr>
  	<td>

		<form name="frmDemoAdd" id="frmDemoAdd" method="post" action="Demographic.do" onsubmit="return myvalidate(this);">

                     <input type="hidden" name="horseprocess" value="insert" />
			<table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
			<tr>
                            <td colspan="2" class="tblDescrp">&nbsp;Fields marked with an asterisk (<span class="asterisk">*</span>) are required.</td>
		  	</tr>
				<%
					String status=(String)request.getAttribute("err");

					if(status!=null)
					{
					if(status.equalsIgnoreCase("st"))
					{%>
				  <tr>
                            <td class="styleError" colspan="4"><strong>Demographic already exists</strong></td>
                  </tr>
					<%}}%>


				  <tr>

					<td class="tableLeft">Demographic:</td>
                                        <td class="tableRight"><input name="Demo" type="text" class="textboxOne" maxlength="50" />
					<span class="asterisk">*</span></td>
				 </tr>

                                         <tr>
					<td class="tableLeft">Description:</td>
					<td class="tableRight"><input name="Desc" type="text" class="textboxOne" maxlength="150" />
					<span class="asterisk">*</span></td>
				 </tr>

                                    <tr>
				<td class="tableLeft">Type:</td>
				<td width="297" class="tableRight">
								<select type="select" name="DemogType" class="selectboxOne">
								<option value="" selected="selected">Select One</option>
									<%
								ArrayList DemoType = (ArrayList) request.getAttribute("DemoType");
                                                                int icon1=0;
                                                                if(DemoType != null){
                                                                    icon1 = DemoType.size();
                                                                }

								if(DemoType!=null){
								Iterator itr = DemoType.iterator();
								while(itr.hasNext()){
									String DemoTypeArray[] = (String[]) itr.next();
									String demoTypeId = DemoTypeArray[0];
									String demoTypeName =DemoTypeArray[1];
                                                                        System.out.println("hi"+demoTypeName);
									%>
									<option value="<%=demoTypeId%>"><%=demoTypeName%></option>
								<%	}
								}
								%>
								</select>  <span class="asterisk">*</span>
							</td>
				</tr>

                                              <tr>
							<td class="tableLeft"> Status</td>
							<td width="40" class="tableRight" >
                                                            <input type="radio" id="status1" name="status" value="true" />Active <input type="radio" id="status2" name="status" value="false"/>Inactive
                                                        <span class="asterisk">*</span></td>

						  </tr>

				   <tr>
					<!--<td class="tableLeft">&nbsp;</td>-->
					<td colspan="2" style="text-align:center" height="25">
					<input type="submit" value="Create" class="gradBtn"/>&nbsp;&nbsp;

                                        <input name="button" type="button" class="gradBtn" value="Clear" onClick = "clearFields(this.form);"/>&nbsp;&nbsp;
					<input type="button" value="Cancel" class="gradBtn" onclick="CancelContactType();"/>

					</td>
				  </tr>
			</table>
		</form>
	</td>
  </tr>
<!--End:[DemographicDetails] For Demographic Type Addition changes dated 11-Apr-2011-->
  <tr>
    <td height="20">&nbsp; <!-- DO NOT DELETE THIS ROW --></td>
  </tr>
</table>

			<!-- CONTENTS END HERE -->
			</td>
		  </tr>
	  </table>

	</td>
  </tr>
  <tr>
    <td class="footerBg">
		<!-- FOOTER STARTS HERE -->
			<%@ include file = "../../include/footer.jsp" %>
		<!-- FOOTER ENDS HERE -->
	</td>
  </tr>
</table>

</body>
</html>