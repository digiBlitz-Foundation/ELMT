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
<%@ page import="java.util.*" %>
<%@ page import="com.hlchorse.form.util.HLCHorseDisplayVO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/validate.js" type="text/javascript" ></script>
<script src="javascripts/frmHorseReg.js" type="text/javascript" ></script>
<script src="javascripts/HorseRenewRegValidate.js" type="text/javascript"></script>
<script language="JavaScript" src="javascripts/calendar2.js" type="text/javascript"></script>
</head>

<body onload="initConditionHorse();">
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
  <tr>
    <td class="tableCommonBg">
		
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
		  
		  <tr>
			<td width="230" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
			<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>
			<!-- LEFT MENU ENDS HERE -->

		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				
<div class="cmmnForm">
	<div class="colspan">
		<strong>Horse Life Registration Renewal Form </strong>
	</div>
    <div id="commonBG" class="textCommon" style="height:100px;">
  	<img src="images/usea_logo.jpg" class="imgFloatLeft" /><strong>Use one form for each horse.</strong> <br />
  	<br />
  	All horses competing in Registered Events at the Novice level and above MUST be registered . (Beginner Novice level exempt) <br />
  	</div>
    <form name="frmHorseReg" id="myform" method="post" class="formcss" action="./UpdateHorseReg.do" onSubmit="return myvalidate(this);">
<!-- **************************************** Part A of the form starts here *********************************************** -->

<div class="rowExpand" onclick="expandColl('parta');">Horse Life Registration Form: Part A <span class="textOne">(click to expand/contract)</span></div>
<div id="parta" class="formPart">

	<div class="rowHead">
		This form is for Horse Registration:
	</div>
	       
          <div class="row">
		  

							<span class="label">Horse Registration Type:</span>
							<span class="formX">
							<select name="feeDisp" id="select" class="selectboxOne" onChange="Disp();">

							<% 
                               
                                                             HLCHorseDisplayVO objHorseDisp = new HLCHorseDisplayVO();
                                                             objHorseDisp =(HLCHorseDisplayVO)request.getAttribute("objHorseDisp");


                                                  			String impdate=objHorseDisp.getHorseImportDate();
 															String impdate1="";

 															if(impdate!=null && impdate.trim().length()>0)
                                                            {
    							    						String[] spimpdate=impdate.split(" ");
															String[] chimpdate=spimpdate[0].split("-");
															impdate=chimpdate[1]+"/"+chimpdate[2]+"/"+chimpdate[0];
															 }else
                                                             {
                                                                  impdate1="";
                                                             }

															Vector horsememberVect=new Vector();
								   
								horsememberVect=(Vector)request.getAttribute("horsememberVect");
										
								Enumeration itrators= (Enumeration)horsememberVect.elements();

		                   		 int siz=horsememberVect.size();
		                   		String[] sarray =null;
								double amt=0.0;
                      if(siz!=0)
                      {
                      while(itrators.hasMoreElements()){
                                
                                sarray = (String[]) itrators.nextElement();
                                
                                String memberTypeId = sarray[0];
                                String membershipName = sarray[1];
                                String membershipAmount = sarray[2];
                                String cnct=memberTypeId+"#"+membershipName+"#"+membershipAmount;
								if(membershipName.equalsIgnoreCase(objHorseDisp.getMembershipTypeName()))
								{
								amt=Float.parseFloat(membershipAmount);
								%>
									<option selected="selected" value="<%=cnct%>"><%=membershipName%></option> 
		                        <%}else{%>
                                    
				 			 		 <option  value="<%=cnct%>"><%=membershipName%></option>
								<%}}}%>	  <!-- end loop  -->
				</select>
				&nbsp;
				<strong>$</strong>&nbsp;<input id="fee_txt" class="textboxOne" type="text" name="fee_txt" size="10" readonly="true" value="<%=amt%>"/>
				</span>
	  </div>
	  
			<div class="rowTwo" id="commonBG">
				<span class="floatLeft"><strong>Please allow seven days for processing and website updates.</strong></span>
			</div>
			<div class="colspan">
				<span class="floatLeftRadio">
				  <strong>&nbsp;&nbsp;&nbsp;&nbsp;Miscellaneous Charges</strong>
			   </span>
			   <span class="floatRight"><strong>Fees</strong>&nbsp;&nbsp;&nbsp;</span>
                                <input type="hidden" name="memid" value="<%=objHorseDisp.getMemberId()%>">
			</div>               
		     			 <%   
								List selectedlist=(List)request.getAttribute("selectedlist");
								String[] serviceTyp=new String[500];
						
								if(selectedlist!=null)
								{
								if(selectedlist.size()!=0)
								{

								for (int n=0; n<selectedlist.size(); n++)
								{
                                String sellist= (String)selectedlist.get(n);
								serviceTyp[n]=sellist;
								System.out.println(serviceTyp[n]);

								}}
								}
								String status="";
								
                                int chksfx=0;
                                String cbx="classification";
                                
                                Vector horsesertypVect = new Vector();
                                horsesertypVect =(Vector)request.getAttribute("horsesertypVect");
								int si=0;
								if(horsesertypVect!=null)
								{
                             //   horsesertypVect =(Vector)request.getAttribute("horsesertypVect");
                                 si=horsesertypVect.size();
								}
                       			 %>
                        
                       			 <input type="hidden" name="cbxct" value="<%=si%>">
                                 <%
                                    if(si!=0)
                                    {
                                 Enumeration itrate= (Enumeration)horsesertypVect.elements();
                                 while(itrate.hasMoreElements()){
                            	
                                String[] sarray1 = (String[]) itrate.nextElement();
                                String memberTypeId1 = sarray1[0];
                                String membershipName1 = sarray1[1];
                                String membershipAmount1 = sarray1[2];
                                String cn=memberTypeId1+"#"+membershipName1+"#"+membershipAmount1;
                                
                                String cbxname=cbx+Integer.toString(chksfx);
                                %>
                <div class="row" id="commonBG">
				<div class="row">           
								<%int flag=0;
								for(int t=0;t<si;t++)
								{
								status="";
								if(serviceTyp[t]!=null && membershipName1.equalsIgnoreCase(serviceTyp[t]))
								{	
									status="checked";
									System.out.println("inside checked......");
									t=si-1;
									}}%>
									
			  <span class="floatLeft"><input type="checkbox" name="<%=cbxname%>" <%=status%>  value="<%=cn%>" size="10" onClick="Dispall();"> </span>
			  <span class="floatLeftRadio">
				  <strong><%=membershipName1%></strong>
			  </span>
			  <span class="floatRight"><strong><%=membershipAmount1%></strong>&nbsp;&nbsp;</span>
                         </div>
						  <%chksfx++;%>
                         
                          <%}}%>
				
			</div>
			<!-- spacer starts-->
			<div class="spacer">&nbsp;</div>
			<!-- spacer ends-->
			
			<div class="colspan">
				<strong>Horse Information Section:</strong>
			</div>
			<div class="row">
				<span class="label">Horse Name: </span>
				<span class="formX"><input type="text" value="<%=objHorseDisp.getCompetitionName()%>" class="textboxOne" readonly="true" name=horseName size="15" />  
				(Competition name, not barn name)<span class="asterisk"> * </span></span>
			</div>

			<%
			String regname="";
			
			if(objHorseDisp.getRegisteredName()!=null && objHorseDisp.getRegisteredName().trim().length()!=0)
			{
				regname=objHorseDisp.getRegisteredName();
			}
			else
			{
				regname="N/A";
			}
			
			%>

			<div class="row">
				<span class="label">Registered Name:</span>
				<span class="formX"><input type="text" value="<%=regname%>" class="textboxOne" readonly="true" name=registeredName size="15" /> (If different from above)<span class="asterisk"> * </span></span>
			</div>

			<%
			String baregname="";
			
			if(objHorseDisp.getBaRegisteredName()!=null && objHorseDisp.getBaRegisteredName().trim().length()!=0)
			{
				baregname=objHorseDisp.getBaRegisteredName();
			}
			else
			{
				baregname="N/A";
			}
			
			%>

			<div class="row">
				<span class="label">Breed Assoc. Horse is registered with:</span>
				<span class="formX"><input type="text" value="<%=baregname%>" class="textboxOne" readonly="true" name=breedAssoc size="10" /><span class="asterisk"> * </span> </span>
			</div>

<%
			String bapastname="";
			
			if(objHorseDisp.getBaPastName()!=null && objHorseDisp.getBaPastName().trim().length()!=0)
			{
				bapastname=objHorseDisp.getBaPastName();
			}
			else
			{
				bapastname="N/A";
			}
			
			%>

			<div class="row">
				<span class="label">Past Name:</span>
				<span class="formX"><input type="text" value="<%=bapastname%>" class="textboxOne" readonly="true" name=pastName size="15" /> (If applicable)<span class="asterisk"> * </span></span>
			</div>

			<div class="colspan">
				<strong>Rider Information Section:</strong>
			</div>
			
			<div class="row">
				<span class="label">Name:</span>
				<span class="formX"><input type="text" class="textboxOne" name=rName value="<%=objHorseDisp.getAddRiderFirstName()%>" readonly="true" size="20" />&nbsp;No.: <input type="text" class="textboxOne" readonly="true" name=hlcNo value="<%=objHorseDisp.getRiderMemberId()%>" size="10" /></span>
			</div>
			<div class="row">
				<span class="label">Street:</span>
				<span class="formX"><input type="text" class="textboxOne" readonly="true" value="<%=objHorseDisp.getRiderAddress1()%>" name=rStreet size="20" /></span>
			</div>
			<div class="row">
				<span class="label">City:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=objHorseDisp.getRiderCity()%>" readonly="true" name=rCity size="15" /></span>
			</div>
			<div class="row">
				<span class="label">State:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=objHorseDisp.getRiderState()%>" readonly="true" name=rState size="20" /></span>
			</div>
			<div class="row">
				<span class="label">Zipcode:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=objHorseDisp.getRiderZip()%>" readonly="true" name=rZipcode size="8" /></span>
			</div>
				<div class="row">
				<span class="label">Phone:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=objHorseDisp.getRiderPhoneNo()%>" readonly="true" name=rPhone size="15" /></span>
			</div>

<%
			String Cell="";
			
			if(objHorseDisp.getRiderMobileNo()!=null && objHorseDisp.getRiderMobileNo().trim().length()!=0)
			{
				Cell=objHorseDisp.getRiderMobileNo();
			}
			else
			{
				Cell="N/A";
			}
%>

			<div class="row">
				<span class="label">Cell:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=Cell%>" readonly="true" name=rCell size="15" /></span>
			</div>
			<div class="row">
				<span class="label">Email:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=objHorseDisp.getRiderEmailId()%>" readonly="true" name=rEmail size="20" /></span>
			</div>

			<%
			String prmembid="";
			
			if(objHorseDisp.getPrevRiderMemberId()!=null && objHorseDisp.getPrevRiderMemberId().trim().length()!=0)
			{
				prmembid=objHorseDisp.getPrevRiderMemberId();
			}
			else
			{
				prmembid="N/A";
			}

			String prname="";
			
			if(objHorseDisp.getPrevRiderFirstName()!=null && objHorseDisp.getPrevRiderFirstName().trim().length()!=0)
			{
				prname=objHorseDisp.getPrevRiderFirstName();
			}
			else
			{
				prname="N/A";
			}
			
			%>

			<div class="row">
				<span class="label">Previous Rider:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=prname%>" readonly="true" name=previousRider size="20" />&nbsp; No.: <input type="text" value="<%=prmembid%>" readonly="true" class="textboxOne" name=prhlcNo size="10" /></span>
			</div>

			<%
			String arname="";
			
			if(objHorseDisp.getAddRiderFirstName()!=null && objHorseDisp.getAddRiderFirstName().trim().length()!=0)
			{
				arname=objHorseDisp.getAddRiderFirstName();
			}
			else
			{
				arname="N/A";
			}

			String armembid="";
			
			if(objHorseDisp.getAddRiderMemberId()!=null && objHorseDisp.getAddRiderMemberId().trim().length()!=0)
			{
				armembid=objHorseDisp.getAddRiderMemberId();
			}
			else
			{
				armembid="N/A";
			}
			
			%>

			<div class="row">
				<span class="label">Additional Rider:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=arname%>" readonly="true" name=additionalRider size="20" />&nbsp; No.: <input type="text" readonly="true" class="textboxOne" value="<%=armembid%>" name=arhlcNo size="10" /></span>
			</div>
</div>
<!-- **************************************** Part B of the form starts here *********************************************** -->

<div class="rowExpand" onclick="expandColl('partb');">Horse Life Registration Form: Part B <span class="textOne">(click to expand/contract)</span></div>
<div id="partb" class="formPart">

	<div class="colspan">
				<strong>Owner Information Section:</strong>
	  </div>
			
			<div class="row">
				<span class="label">Name:</span>
				<span class="formX"><input type="text" class="textboxOne" name=oName value="<%=objHorseDisp.getOwnerFirstName()+" "+objHorseDisp.getOwnerMiddleName()+" "+objHorseDisp.getOwnerLastName()%>" readonly="true"size="20" /></span>
			</div>
			<div class="row">
				<span class="label">Street:</span>
				<span class="formX"><input type="text" class="textboxOne" name=oStreet value="<%=objHorseDisp.getOwnerAddress1()+" "+objHorseDisp.getOwnerAddress2()%>" readonly="true" size="20" /></span>
			</div>
			<div class="row">
				<span class="label">City:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=objHorseDisp.getOwnerCity()%>" name=oCity readonly="true"  size="15" /></span>
			</div>
			<div class="row">
				<span class="label">State:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=objHorseDisp.getOwnerState()%>" name=oState readonly="true" size="20" /></span>
			</div>
			<div class="row">
				<span class="label">Zipcode:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=objHorseDisp.getOwnerZip()%>" name=oZipcode readonly="true" size="8" /></span>
			</div>
				<div class="row">
				<span class="label">Phone:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=objHorseDisp.getOwnerPhoneNo()%>" name=oPhone readonly="true" size="15" /></span>
			</div>
			<div class="row">
				<span class="label">Cell:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=objHorseDisp.getOwnerMobileNo()%>" name=oCell readonly="true" size="15" /></span>
			</div>
			<div class="row">
				<span class="label">Email:</span>
				<span class="formX"><input type="text" class="textboxOne" name=oEmail value="<%=objHorseDisp.getOwnerEmailId()%>" readonly="true" size="20" /></span>
			</div>

			<%
			String addownr="";
			
			if(objHorseDisp.getAddOwnerName()!=null && objHorseDisp.getAddOwnerName().trim().length()!=0)
			{
				addownr=objHorseDisp.getAddOwnerName();
			}
			else
			{
				addownr="N/A";
			}
			
			%>

			<div class="row">
				<span class="label">Additional Owner:</span>
				<span class="formX"><input type="text" class="textboxOne" name=additionalOwner value="<%=addownr%>" readonly="true" size="20" /></span>
			</div>

			<%

			String prownr="";
			
			if(objHorseDisp.getPrevOwnerName()!=null && objHorseDisp.getPrevOwnerName().trim().length()!=0)
			{
				prownr=objHorseDisp.getPrevOwnerName();
			}
			else
			{
				prownr="N/A";
			}
			
			%>

			<div class="row">
				<span class="label">Previous Owner:</span>
				<span class="formX"><input type="text" class="textboxOne" name=previousOwner value="<%=prownr%>" readonly="true" size="20" /></span>
			</div>



	<div class="rowHead">
		Horse Description:
	</div>

			<div class="row">
				<span class="label">Color:</span>
				<span class="formX"><input type="text" readonly="true" class="textboxOne" value="<%=objHorseDisp.getHorseColor()%>" name="colorHorse" size="20" /> <span class="asterisk"> * </span></span>
			</div>
			<div class="row"><span class="formX">
			  <input type="text" name="sex" readonly="true" value="<%=objHorseDisp.getHorseGender()%>"/>
			</span>
				<span class="label">Sex:</span>
				<span class="formX">				</span>
			</div>
			<div class="row">
				<span class="label">Height</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=objHorseDisp.getHorseHeight()%>" readonly="true" name=height size="10" /> <span class="asterisk"> * </span></span>
			</div>

			<%

			String yfoal="";
			
			if(objHorseDisp.getHorseYearFoaled()!=null && objHorseDisp.getHorseYearFoaled().trim().length()!=0)
			{
				yfoal=objHorseDisp.getHorseYearFoaled();
			}
			else
			{
				yfoal="N/A";
			}
			
			%>

			<div class="row">
				<span class="label">Year foaled:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=yfoal%>" readonly="true" name=yearfoaled size="10" /> <span class="asterisk"> * </span></span>
			</div>

			<%

			String breed="";
			
			if(objHorseDisp.getHorseBreed()!=null && objHorseDisp.getHorseBreed().trim().length()!=0)
			{
				breed=objHorseDisp.getHorseBreed();
			}
			else
			{
				breed="N/A";
			}
			
			%>

			<div class="row">
				<span class="label">Breed:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=breed%>" readonly="true" name=breed size="10" /> <span class="asterisk"> * </span></span>
			</div>

			<%

			String horsectry="";
			
			if(objHorseDisp.getHorseCountry()!=null && objHorseDisp.getHorseCountry().trim().length()!=0)
			{
				horsectry=objHorseDisp.getHorseCountry();
			}
			else
			{
				horsectry="N/A";
			}
			
			%>

			<div class="row">
				<span class="label">Country of origin:</span>
				<span class="formX"><input type="text" class="textboxOne" name="countryOrigin" readonly="true" value="<%=horsectry%>" size="15" /> (If not USA) <span class="asterisk"> * </span></span>
			</div>

			<%

			String hsire="";
			
			if(objHorseDisp.getHorseSire()!=null && objHorseDisp.getHorseSire().trim().length()!=0)
			{
				hsire=objHorseDisp.getHorseSire();
			}
			else
			{
				hsire="N/A";
			}
			
			%>

			<div class="row">
				<span class="label">Sire Name:</span>
				<span class="formX"><input type="text" class="textboxOne" name=sireName readonly="true" value="<%=hsire%>" size="15" /> <span class="asterisk"> * </span></span>
			</div>

			<%

			String hbreed="";
			
			if(objHorseDisp.getHorseSireBreed()!=null && objHorseDisp.getHorseSireBreed().trim().length()!=0)
			{
				hbreed=objHorseDisp.getHorseSireBreed();
			}
			else
			{
				hbreed="N/A";
			}
			
			%>

			<div class="row">
				<span class="label">Sire Breed:</span>
				<span class="formX"><input type="text" class="textboxOne" name=sireBreed readonly="true" value="<%=hbreed%>" size="15" /> <span class="asterisk"> * </span></span>
			</div>

			<%

			String hdam="";
			
			if(objHorseDisp.getHorseDam()!=null && objHorseDisp.getHorseDam().trim().length()!=0)
			{
				hdam=objHorseDisp.getHorseDam();
			}
			else
			{
				hdam="N/A";
			}
			
			%>

			<div class="row">
				<span class="label">Dam Name:</span>
				<span class="formX"><input type="text" class="textboxOne" readonly="true" value="<%=hdam%>" name=damName size="15" /> <span class="asterisk"> * </span></span>
			</div>

			<%

			String hdambred="";
			
			if(objHorseDisp.getHorseDamBreed()!=null && objHorseDisp.getHorseDamBreed().trim().length()!=0)
			{
				hdambred=objHorseDisp.getHorseDamBreed();
			}
			else
			{
				hdambred="N/A";
			}
			
			%>

			<div class="row">
				<span class="label">Dam Breed:</span>
				<span class="formX"><input type="text" class="textboxOne" readonly="true" value="<%=hdambred%>" name=damBreed size="15" /> <span class="asterisk"> * </span></span>
			</div>

			<%

			String hrsimp="";
			
			if(objHorseDisp.getHorseImportedFrom()!=null && objHorseDisp.getHorseImportedFrom().trim().length()!=0)
			{
				hrsimp=objHorseDisp.getHorseImportedFrom();
			}
			else
			{
				hrsimp="N/A";
			}
			
			%>

			<div class="row">
				<span class="label">Imported From:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=hrsimp%>" name="importedFrom" size="25" /> <span class="asterisk"> * </span></span>
			</div>
			<div class="row">
				<span class="label">Date Imported:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=impdate1%>" name="dateImported" size="15" readonly="true"/> <a href="javascript:cal1.popup();">
										<img src="images/calendar.jpg" alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a><span class="asterisk">*</span></span>
			</div>

			<%

			String hfgrad="";
			
			if(objHorseDisp.getHorseForeignGrade()!=null && objHorseDisp.getHorseForeignGrade().trim().length()!=0)
			{
				hfgrad=objHorseDisp.getHorseForeignGrade();
			}
			else
			{
				hfgrad="N/A";
			}
			
			%>

			<div class="row">
				<span class="label">Foreign Grade:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=hfgrad%>" name="foreignGrade" size="12" /> <span class="asterisk"> * </span></span>
			</div>

			<%

			String hfpt="";
			
			if(objHorseDisp.getHorseForeignPoints()!=null && objHorseDisp.getHorseForeignPoints().trim().length()!=0)
			{
				hfpt=objHorseDisp.getHorseForeignPoints();
			}
			else
			{
				hfpt="N/A";
			}
			
			%>

			<div class="row">
				<span class="label">Foreign Points:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=hfpt%>" name="foreignPoints" size="10" /> <span class="asterisk"> * </span></span>
			</div>

			<%

			String asgrd="";
			
			if(objHorseDisp.getHorseAssignedGrade()!=null && objHorseDisp.getHorseAssignedGrade().trim().length()!=0)
			{
				asgrd=objHorseDisp.getHorseAssignedGrade();
			}
			else
			{
				asgrd="N/A";
			}
			
			%>

			<div class="row">
				<span class="label">Assigned Grade:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=asgrd%>" name="assignedGrade" size="12" /> <span class="asterisk"> * </span></span>
			</div>
			
			<%

			String aspt="";
			
			if(objHorseDisp.getHorseAssignedPoints()!=null && objHorseDisp.getHorseAssignedPoints().trim().length()!=0)
			{
				aspt=objHorseDisp.getHorseAssignedPoints();
			}
			else
			{
				aspt="N/A";
			}
			
			%>
			
			<div class="row">
				<span class="label">Assigned Points:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=aspt%>" name="assignedPoints" size="10" /> <span class="asterisk"> * </span></span>
		</div>
		<div class="rowHead">
		Payment Information:
	</div>
			<div class="row">
				<span class="label">Total Amount:</span>
				<span class="formX"><input type="text" class="textboxOne" name="totalAmount" size="10" readonly="true" /> <strong>$</strong></span>
			</div>
			<div class="row">
			  <span class="floatLeft"><input type="radio" size="10" name="r11" value="check" onclick="switchDiv('checkEncl'), showHideRadio('r11','chargeCard','check');" /></span>
			  <span class="floatLeft">
				  Check enclosed.
			  </span>
			  <span class="floatLeft"><input type="radio" size="10" name="r11" value="card" onclick="switchDiv('chargeCard'), showHideRadio('r11','checkEncl','card');" ></span>
			  <span class="floatLeft">
				  Please charge my card.
			  </span>
			</div>

					<div id="checkEncl">
							<div class="colspan">
								<strong>Check Details:</strong>
							</div>
							<div class="row">
								<span class="label">Check No:</span>
								<span class="formX"><input type="text" class="textboxOne" name=checkNo size="10" /></span>
							</div>
							<div class="row">
								<span class="label">Check Date:</span>
								<span class="formX"><input type="text" class="textboxOne" name=checkDate size="10" readonly="true" /> <a href="javascript:cal2.popup();">
										<img src="images/calendar.jpg" alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a></span>
							</div>
							<div class="row">
								<span class="label">In Favor Of:</span>
								<span class="formX"><input type="text" class="textboxOne" name=inFavorof size="10" /></span>
							</div>
					</div>

					<div id="chargeCard">
							<div class="colspan">
								<strong>Card Details:</strong>
							</div>
							<div class="row">
								<span class="label">Card Type:</span>
								<span class="formX">
								<select name="cardselect" id="select" class="selectboxOne">
								  <option selected="selected">Select One</option>
								  <option value="Visa">Visa</option>
								  <option value="MasterCard">Master Card</option>
								  <option value="AmEx">AmEx</option>
								</select>
								</span>
							</div>
							<div class="row">
								<span class="label">Card No:</span>
								<span class="formX"><input type="text" class="textboxOne" name=cardNo size="20" /></span>
							</div>

							<div class="row">
								<span class="label">CVV No.:</span>
								<span class="formX"><input type="text" class="textboxOne" name=cVVNo size="5" /></span>
							</div>
							<div class="row">
								<span class="label">Print Name On Card:</span>
								<span class="formX"><input type="text" class="textboxOne" name=printName size="5" /></span>
							</div>
							<div class="row">
								<span class="label">Expiry Date:</span>
								<span class="formX">
									<select name="expirymonth" id="select" class="selectboxOne">
									  <option value="" selected="selected">Month</option>
									  <option value="01">January</option>
									  <option value="02">February</option>
									  <option value="03">March</option>
									  <option value="04">April</option>
									  <option value="05">May</option>
									  <option value="06">June</option>
									  <option value="07">July</option>
									  <option value="08">August</option>
									  <option value="09">September</option>
									  <option value="10">October</option>
									  <option value="11">November</option>
									  <option value="12">December</option>
									</select>,
									<select name="expiryyear" id="select" class="selectboxOne">
										  <option value="" selected="selected" >Year</option>
										  <option  value="2006">2006</option>
										  <option  value="2007">2007</option>
										  <option  value="2008">2008</option>
										  <option  value="2009">2009</option>
										  <option  value="2010">2010</option>
										  <option  value="2011">2011</option>
										  <option  value="2012">2012</option>
										  <option  value="2013">2013</option>
										  <option  value="2014">2014</option>
										  <option  value="2015">2015</option>
									</select>
								</span>
							</div>
					</div>
	
	<div class="row">
		<span class="label">&nbsp;</span>
		
	<div class="row">
		<span class="label">&nbsp;</span>
		<span class="formX"><input type="submit" value="Renew" class="gradBtn" /></span>
	</div>

	<div id="spacer">&nbsp;</div>
</div>
</form>
</div>

     
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

<script language="javascript">

j=0;
num1=0;
num2=0;
i=0;
sum =0;
regfee=0;

arrayval = new Array();

var cbxct=document.frmHorseReg.cbxct.value;
regfee=document.frmHorseReg.fee_txt.value;

for(i=2;i<=cbxct+2;i++)
{ 
  if(document.frmHorseReg.elements[i].status)
  {
   j=j+1;
   arrayval[j]=document.frmHorseReg.elements[i].value;
  }
}

for(i=1;i<arrayval.length;i++)
{ num1=arrayval[i].lastIndexOf("#");
  num2=arrayval[i].length;
  str = arrayval[i].substring(num1+1,num2);
  num = Number(str);
  sum = sum + num; 
}
 document.frmHorseReg.totalAmount.value=sum+Number(regfee);

</script>

<script language="javascript">
        var cal1 = new calendar2(document.forms['myform'].elements['dateImported']);
      	 cal1.year_scroll = true;
      	 cal1.time_comp = false;
      
       	var cal2 = new calendar2(document.forms['myform'].elements['checkDate']);
      	cal2.year_scroll = true;
      	cal2.time_comp = false;     
</script> 
</html>