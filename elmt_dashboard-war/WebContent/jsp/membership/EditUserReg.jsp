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
<%@ page import="java.util.regex.*" %>
<%@ page import="com.hlchorse.form.util.*" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/validate.js" type="text/javascript" ></script>
<script src="javascripts/cscombo_new.js" type="text/javascript" ></script>
<script src="javascripts/frmMembRegi.js" type="text/javascript" ></script>
<script src="javascripts/EditUserReg.js" type="text/javascript" ></script>
</head>
<link href="../../css/core-ie.css" type="text/css" rel="stylesheet" /> 
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
  <tr>
    <td class="tableCommonBg">
		
		<table width="760" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
		  
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
		Membership:<span class="styleBoldTwo"> Edit User Registration</span> 
	</div>
    <div id="commonBG" class="textCommon">	    
		Please use the form below to<strong> Edit/Update</strong> your registration details.    </div>

   <form name="frmMembRegi" id="frmMembRegi" method="post" class="formcss" action="UpdateEditUserReg.do" onSubmit="return myvalidate(this);" onmouseover="hide_switchDiv();" >

            <div id="parta" >	
                <!-- **************************************** Part A of the form starts here *********************************************** -->
						
							<div class="rowHead">
								Basic Information:
							</div>
							
							<%
                                    HLCUserRegVO HLCUserRegVO=new HLCUserRegVO();
						
                         			HLCUserRegVO=(HLCUserRegVO)request.getAttribute("EditusrVect");
						               
							%>
							
									<div class="row">
										<span class="label">Salutation:</span>
										<span class="formX">
										<select name="select" id="uselect" class="selectboxOne">
										<option value="" selected="selected">Select One</option>
										
										<%
										String[] salutation={"Mr","Mrs","Miss","Ms"};
										
										for(int sal=0;sal<4;sal++)
										{
                                         if(HLCUserRegVO.getPrefix()!=null)
                                         {
										if(salutation[sal].equalsIgnoreCase(HLCUserRegVO.getPrefix()))
										{%>
											 <option value="<%=salutation[sal]%>" selected="selected"><%=salutation[sal]%></option>
										<%}else{%>
																									
											<option value="<%=salutation[sal]%>"><%=salutation[sal]%></option>
										<%}}
										else{%>
										
											<option value="<%=salutation[sal]%>"><%=salutation[sal]%></option>
										
										<%}}%>
										 
										</select>
										</span>
									</div>
									<div class="row">
										<span class="label">First Name:</span>
										<span class="formX"><input name="fname" type="text" class="textboxOne" value="<%=HLCUserRegVO.getFirstName()%>" size="20" />&nbsp;<span class="asterisk">*</span></span>
										
                                                                                <input type="hidden" name="userid" value="<%=HLCUserRegVO.getUserId()%>" />
																				<%
																					String sessionLogName="";
																					sessionLogName=(String)session.getAttribute("loginName");
																				%>
																				<input type="hidden" name="sessionLogName" value="<%=sessionLogName%>" />
									</div>

			<%

			String mname="";
			
			if(HLCUserRegVO.getMiddleName()!=null && HLCUserRegVO.getMiddleName().trim().length()!=0)
			{
				mname=HLCUserRegVO.getMiddleName();
			}
			else
			{
				mname="";
			}
			
			%>

									<div class="row">
										<span class="label">Middle Name:</span>
										<span class="formX"><input name="mname" type="text" class="textboxOne" value="<%=mname%>" size="20" /></span>
									</div>
									<div class="row">
										<span class="label">Last Name:</span>
										<span class="formX"><input name="lname" type="text" class="textboxOne" value="<%=HLCUserRegVO.getLastName()%>" size="20" />&nbsp;<span class="asterisk">*</span></span>
										
									</div>

<%

			String suff="";
			
			if(HLCUserRegVO.getSufix()!=null && HLCUserRegVO.getSufix().trim().length()!=0)
			{
				suff=HLCUserRegVO.getSufix();
			}
			else
			{
				suff="";
			}
			
			%>

									<div class="row">
										<span class="label">Suffix:</span>
										<span class="formX"><input type="text" name="sname" class="textboxOne" value="<%=suff%>" size="20" /></span>
									</div>
									<div class="row">
										<span class="label">Date of Birth :</span>
										<span class="formX">
                                                                                    <%
																					
																					    if(HLCUserRegVO.getDob()!=null)
																						{
                                                                                        String[] dob1=HLCUserRegVO.getDob().split(" ");
                                                                                        String[] dob=dob1[0].split("-");
                                                                                        
                                                                                        String mm=dob[1];
                                                                                        String dd=dob[2];
                                                                                        String yy=dob[0];
                                                                                                                                                                                
                                                                                       String[] mon={"January","February","March","April","May","June","July","August","September","October","November","December"};
                                                                                       String month="";
                                                                                       
                                                                                    if(mm.equals("01"))
                                                                                        month=mon[0];
                                                                                    else if(mm.equals("02"))
                                                                                        month=mon[1];
                                                                                    else if(mm.equals("03"))
                                                                                        month=mon[2];
                                                                                    else if(mm.equals("04"))

                                                                                        month=mon[3];
                                                                                    else if(mm.equals("05"))
                                                                                        month=mon[4];
                                                                                    else if(mm.equals("06"))
                                                                                        month=mon[5];
                                                                                    else if(mm.equals("07"))
                                                                                        month=mon[6];
                                                                                    else if(mm.equals("08"))
                                                                                        month=mon[7];
                                                                                    else if(mm.equals("09"))
                                                                                        month=mon[8];
                                                                                    else if(mm.equals("10"))
                                                                                        month=mon[9];
                                                                                    else if(mm.equals("11"))
                                                                                        month=mon[10];
                                                                                    else if(mm.equals("12"))
                                                                                        month=mon[11];
                                                                                    else
                                                                                           
                                                                                       
                                                                                    %>
												<select name="birthmonth" id="select" class="selectboxOne">
													<%
													int selmth=Integer.parseInt(mm);
													System.out.println("selmth :"+selmth);

													for(int mth=1;mth<=12;mth++)
													{
														if(selmth==mth)
														{%>	
												  <option value="<%=mth%>" selected="selected"><%=mon[mth-1]%></option>
														<%}else{%>
												  <option value="<%=mth%>"><%=mon[mth-1]%></option>
												 <%}}%>
												</select> 

												<select name="birthday" id="select" class="selectboxOne">
												<%
													int dat=Integer.parseInt(dd);
													for(int d=1;d<=31;d++)
													{
														if(dat==d)
														{%>																
															  <option value="<%=d%>" selected="selected"><%=d%></option>
														<%}else{%>
															  <option value="<%=d%>"><%=d%></option>
														<%}}%>
												</select>

												<select name="birthyear" id="select" class="selectboxOne">
													  
													<%  														            												  
														int selyr=Integer.parseInt(yy);
														java.util.Calendar c5 = java.util.Calendar.getInstance();
                                                        //int day = c.get(Calendar.DAY);
                                                        //int month = c.get(Calendar.MONTH);
                                                        int year5 = c5.get(java.util.Calendar.YEAR);
                                                        //String date = day+" / "+month+" / "+year;
                                                        System.out.println("Current Date = "+year5);
                                                        for(int yr=1900;yr<=year5;yr++)
                                                                                                                    {
															if(yr==selyr)
															{%>												
																 <option value="<%=yr%>" selected="selected" ><%=yr%></option>			
															<%}else{%>	
																 <option  value="<%=yr%>"><%=yr%></option>
													 <%}}%>
												</select>
										<%}
										else
										{
										%>
										
										<select name="birthmonth" id="select" class="selectboxOne">
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
												</select>
												<select name="birthday" id="select" class="selectboxOne">
												  <option value="" selected="selected">Day</option>
												  <option value="01">01</option>
												  <option value="02">02</option>
												  <option value="03">03</option>
												  <option value="04">04</option>
												  <option value="05">05</option>
												  <option value="06">06</option>
												  <option value="07">07</option>
												  <option value="08">08</option>
												  <option value="09">09</option>
												  <option value="10">10</option>
												  <option value="11">11</option>
												  <option value="12">12</option>
												  <option value="13">13</option>
												  <option value="14">14</option>
												  <option value="15">15</option>
												  <option value="16">16</option>
												  <option value="17">17</option>
												  <option value="18">18</option>
												  <option value="19">19</option>
												  <option value="20">20</option>
												  <option value="21">21</option>
												  <option value="22">22</option>
												  <option value="23">23</option>
												  <option value="24">24</option>
												  <option value="25">25</option>
												  <option value="26">26</option>
												  <option value="27">27</option>
												  <option value="28">28</option>
												  <option value="29">29</option>
												  <option value="30">30</option>
												  <option value="31">31</option>

												</select>
												<select name="birthyear" id="select" class="selectboxOne">
												  <option value="" selected="selected" >Year</option>
                                                                                                  
                                                                                                  <%
                                                                                                  java.util.Calendar c5 = java.util.Calendar.getInstance();
                                                                                                  //int day = c.get(Calendar.DAY);
                                                                                                  //int month = c.get(Calendar.MONTH);
                                                                                                  int year5 = c5.get(java.util.Calendar.YEAR);
                                                                                                  //String date = day+" / "+month+" / "+year;
                                                                                                  System.out.println("Current Date = "+year5);

                                                                                                  for(int f=1900;f<=year5;f++) 
                                                                                                  {%>
                                                                                                  <option  value="<%=f%>"><%=f%></option>
                                                                                                  <%}
                                                                                                  %>
                                                                                                  
                                                                                              </select>
																							  <%}%>
										
										<span class="asterisk">*</span>
										</span>
										
									</div>
									
									<%
									if(HLCUserRegVO.getGender()!=null)
                                    {
									%>
									<div class="row">
										<span class="label">Gender:</span>
										<span class="floatLeft">
										<%		                              
										if(HLCUserRegVO.getGender().equalsIgnoreCase("male"))
										{%>
                                         <input type="radio" size="10" name="gender" checked value="male" /> Male
										<input type="radio" size="10" name="gender" value="female" /> Female
										<%}else
										{%>
										<input type="radio" size="10" name="gender" value="male" /> Male
										<input type="radio" size="10" name="gender" checked value="female" /> Female
										<%}%>
										<span class="asterisk">*</span>
										</span>
										
									</div>
									<%}%>
									
									<div class="row">
										<span class="label">EMail :</span>
										<span class="formX"><input type="text" name="email" value="<%=HLCUserRegVO.getEmailId()%>" />&nbsp;<span class="asterisk">*</span></span>
									</div>
                                                                        
                                                                        <%
                                                                           String logName="";
                                                                           String templog=(String)session.getAttribute("loginName");
                                                                           
                                                                        if(templog!=null)
                                                                        {
                                                                            logName=templog;
                                                                        }
                                                                        %>
                                                                        
									<div class="row">
										<span class="label">User Name (Login ID):</span>
										<span class="formX"><input type="text" name="usrname" value="<%=logName%>" class="textboxOne" size="25" onblur="nonUserDetails(this);" /> &nbsp;<span class="asterisk">*</span></span>
										
									</div>
									<%
									String logBy = "NA";
									if(session.getAttribute("loggedBy")!=null)
									{
										logBy = (String) session.getAttribute("loggedBy");
									}
									%>
									<input name="logBy" type="hidden" value="<%=logBy%>" />
									
									<%if(session.getAttribute("loggedBy")!=null)
									{ 
									    String usr_code = "";
										if(HLCUserRegVO.getUser_code()!=null)
										usr_code = HLCUserRegVO.getUser_code();
									%>
									<div class="row">
										<span class="label">User Code:</span>
										<span class="formX"><input type="text" name="userCode" value="<%=usr_code%>" class="textboxOne" size="25" onblur="checkUserCode(this);" /> &nbsp;<span class="asterisk">*</span></span>
										
									</div>	
									
									<input type="hidden" name="sessUserCode" value="<%=usr_code%>" class="textboxOne" size="25" />
																	
									<%}%>
									
									<div class="rowHead">
										Change Password:
									</div>
									
									<div class="row">
									 <span class="label">New Password:</span>
									 <span class="formX">
										<input type="Password" name="newPwd" class="textboxOne" size="18" />	
										
									 </span>
								  </div>
								  <div class="row">
									 <span class="label">Re-Type New Password:</span>
									 <span class="formX">
										<input type="Password" name="confPwd" class="textboxOne" size="18" />	
										
									 </span>
								  </div>
									
                                                                        
                                                                            <input type=hidden value="<%=session.getAttribute("loginName")%>" name="usrSessionNam" />
                                                                            
									<div class="colspan">
										<span class="label">Address Types:</span>
									</div>
									<div class="row">	
										<span class="formX">
                                                                                   
											<div class="floatLeft"><input type="checkbox" name="priAdd_cbx" id="priAdd_cbx" value="Primary" size="10" checked="checked" onclick="defaultPriAdd();"/> Primary Address</div>
										</span>
                                                                                 
										<span class="formX">
                                                                                    <%
                                                                                       if(HLCUserRegVO.getSecondaryContactTypeName()!=null)
                                                                                       {
                                                                                       if(HLCUserRegVO.getSecondaryContactTypeName().equalsIgnoreCase("Secondary"))
                                                                                                                                                                                                                                                               
                                                                                     {%>
											<div class="floatLeft"><input type="checkbox" checked name="secAdd_cbx" value="Secondary" id="secAdd_cbx" size="10" onclick="return hide_switchDiv();"/> Secondary Address</div>
                                                                                        <input type="hidden" name="cttyp" value="Secondary" />
                                                                                        <%}}else{%>
                                                                                        
                                                                                        <div class="floatLeft"><input type="checkbox" name="secAdd_cbx" value="Secondary" id="secAdd_cbx" size="10" onclick="return hide_switchDiv();"/> Secondary Address</div>
                                                                                       <% }%>
										</span>
									</div>
									
							<div id="pAdd">
									
									<div class="colspan">
										<strong>Primary Address </strong> 
									</div>
											<div class="row">
												<span class="label">Address 1:</span>
												<span class="formX"> <input type="text" value="<%=HLCUserRegVO.getPrimaryAddress1()%>" name="padd_txt" id="padd_txt" class="textboxOne" size="35" />&nbsp;<span class="asterisk">*</span></span>
												
											</div>
											
			<%

			String add2="";
			
			if(HLCUserRegVO.getPrimaryAddress2()!=null && HLCUserRegVO.getPrimaryAddress2().trim().length()!=0)
			{
				add2=HLCUserRegVO.getPrimaryAddress2();
			}
			else
			{
				add2="";
			}
			
			%>

											<div class="row">
												<span class="label">Address 2:</span>
												<span class="formX"> <input type="text" value="<%=add2%>" name="padd_txt2" id="padd_txt2" class="textboxOne" size="35" /></span>
											</div>
											<div class="row">
												<span class="label">City:</span>
												<span class="formX">
												<input type="pcity_txt" name="pcity_txt" value="<%=HLCUserRegVO.getPrimaryCity()%>" id="pcity_txt" class="textboxOne" size="20" />&nbsp;<span class="asterisk">*</span>
												
												</span>
											</div>
											<div class="row">
												<span class="label">State:</span>
												<span class="formX">
												<select name="pstate_sel" id="pstate_sel" class="selectboxOne">
												
											    </select>&nbsp;<span class="asterisk">*</span>
												</span>
											</div>
											<div class="row">
												<span class="label">Zipcode:</span>
												<span class="formX"><input type="text" value="<%=HLCUserRegVO.getPrmaryZip()%>" name="pzip_txt" id="pzip_txt" class="textboxOne" size="8" />&nbsp;<span class="asterisk">*</span></span>
												
                                                                                                
											</div>
											<div class="row">
												<span class="label">Country:</span>
												<span class="formX">
                                                                 <%System.out.print(HLCUserRegVO.getPrimaryCountry());
																   System.out.print(HLCUserRegVO.getPrimaryState());
																    System.out.print(HLCUserRegVO.getSecondaryCountry());
																   System.out.print(HLCUserRegVO.getSecondaryState());
																	%>
																                               
												<select name="pcountry_sel" id="pcountry_sel" class="selectboxOne" onChange="FillState(document.frmMembRegi.pcountry_sel, document.frmMembRegi.pstate_sel,'');" >
												
											    </select>
												&nbsp;<span class="asterisk">*</span></span>
											</div>
											
											
											
									<div class="row">
										<span class="label">Phone:</span>									  <span class="formX"><input type="text" name="pphone_txt" value="<%=HLCUserRegVO.getPrimaryPhoneNo()%>" class="textboxOne" size="15" />&nbsp;<span class="asterisk">*</span>&nbsp;(e.g. xxx yyy zzzz)</span>
										
                  </div>                     

			<%

			String pmobil="";
			
			if(HLCUserRegVO.getPromaryMobileNo()!=null && HLCUserRegVO.getPromaryMobileNo().trim().length()!=0)
			{
				pmobil=HLCUserRegVO.getPromaryMobileNo();
			}
			else
			{
				pmobil="";
			}

			String pfax="";
			
			if(HLCUserRegVO.getPrimaryFaxNo()!=null && HLCUserRegVO.getPrimaryFaxNo().trim().length()!=0)
			{
				pfax=HLCUserRegVO.getPrimaryFaxNo();
			}
			else
			{
				pfax="";
			}
			
			%>

									<div class="row">
										<span class="label">Mobile:</span>
										<span class="formX"><input type="text" name="pmob_txt" value="<%=pmobil%>" class="textboxOne" size="15" /></span>
									</div>
									<div class="row">
										<span class="label">Fax:</span>
										<span class="formX"><input type="text" name="pfax_txt" value="<%=pfax%>" class="textboxOne" size="15" /></span>
									</div>

							</div>
							
							<div id="sAdd">
									
									<div class="colspan">
										<strong>Secondary Address </strong> 
									</div>
											<div class="row">
												<span class="label">Address 1:</span>
												
										 <%
										 String sec_add1="";
                                                                                       if(HLCUserRegVO.getSecondaryAddress1()!=null)
                                                                                       {
	                                                                                       	sec_add1=HLCUserRegVO.getSecondaryAddress1();
                                                                                        } %>                                                                                                                              
												<span class="formX"> <input type="text" name="sadd_txt" id="sadd_txt" class="textboxOne" value="<%=sec_add1%>" size="35" />&nbsp;<span class="asterisk">*</span></span>
												
											</div>
											
											<div class="row">
												<span class="label">Address 2:</span>												
											 <%
                                                                                    																						String sadd2="";
																						
																						if(HLCUserRegVO.getSecondaryAddress2()!=null)
																						{
																							sadd2=HLCUserRegVO.getSecondaryAddress2();
																						}
																						
																						%>
												<span class="formX"> <input type="text" value="<%=sadd2%>" name="sadd_txt1" id="sadd_txt1" class="textboxOne" size="35" /></span>
												
											</div>
											<div class="row">
											<span class="label">City:</span>	
												 <%
												 String sec_city="";
                                                                                       if(HLCUserRegVO.getSecondaryCity()!=null)
                                                                                       {
																					   sec_city=HLCUserRegVO.getSecondaryCity();
																					   }
                                                                                      %>
												<span class="formX"><input type="text" value="<%=sec_city%>" name="scity_txt" id="scity_txt" class="textboxOne" size="20" />&nbsp;<span class="asterisk">*</span></span>
												
											</div>
											<div class="row">
												<span class="label">State:</span>
											
												<span class="formX">
                                                    <select name="sstate_txt" id="sState_sel" class="selectboxOne">
												    </select>
													<!--<input type="text" name="sstate_txt" value="<%=HLCUserRegVO.getSecondaryState()%>" class="textboxOne" size="20" />-->
													&nbsp;<span class="asterisk">*</span>
												</span>
												
											</div>
											<%
											String sec_zip="";
										
											if(HLCUserRegVO.getSecondaryZip()!=null)
											{
												sec_zip=HLCUserRegVO.getSecondaryZip();
											}
										%>	                                                                                                                                                                 <div class="row">
                                                <span class="label">Zip:</span>
												                                     
												<span class="formX"><input type="text" value="<%=sec_zip%>" name="szip_txt" id="szip_txt" class="textboxOne" size="8" />&nbsp;<span class="asterisk">*</span></span>
												
									</div>
											<div class="row">
												<span class="label">Country:</span>
											
												<span class="formX">
                                                    <select name="scountry_txt" id="sCountry_sel" class="selectboxOne" onChange="FillState(document.frmMembRegi.scountry_txt, document.frmMembRegi.sstate_txt,'');" >
                                                    </select>
													<!--<input type="text" name="scountry_txt" value="<%=HLCUserRegVO.getSecondaryCountry()%>" class="textboxOne" size="20" />-->
													&nbsp;<span class="asterisk">*</span>
												</span>
												
											</div>
											
											
										
<%
String ph="";
if(HLCUserRegVO.getSecondaryPhoneNo()!=null)
{
	ph=HLCUserRegVO.getSecondaryPhoneNo();
}

%>
									<div class="row">
										<span class="label">Phone:</span>									  <span class="formX"><input type="text" name="sphone_txt" value="<%=ph%>" class="textboxOne" size="15" /> &nbsp;<span class="asterisk">*</span>&nbsp;(e.g. xxx yyy zzzz)</span>
                                        </span> </div>

			<%

			String smob2="";
			
			if(HLCUserRegVO.getSecondaryMobileNo()!=null)
			{
				smob2=HLCUserRegVO.getSecondaryMobileNo();
			}
			
			String sfax2="";
			
			if(HLCUserRegVO.getSecondaryFaxNo()!=null)
			{
				sfax2=HLCUserRegVO.getSecondaryFaxNo();
			}
			
			
			%>

									<div class="row">
										<span class="label">Mobile:</span>
										<span class="formX"><input type="text" name="smob_txt" value="<%=smob2%>" class="textboxOne" size="15" /></span>
									</div>
									<div class="row">
										<span class="label">Fax:</span>
										<span class="formX"><input type="text" name="sfax_txt" value="<%=sfax2%>" class="textboxOne" size="15" /></span>
									</div>

											
							</div>
							
									<div class="row">
										<span class="label">preferred Communication Address:</span>
										<span class="formX">
										<select name="comAdd_sel" id="comAdd_sel" class="selectboxOne" onchange="return hideTwo_switchDiv();">

										 <%
                                                                                       if(HLCUserRegVO.getPreferedCommunication()!=null)
                                                                                       {
                                                                                       if(HLCUserRegVO.getPreferedCommunication().equalsIgnoreCase("Secondary"))
                                                                                        {    System.out.println("HLCUserRegVO.getPreferedCommunication() :"+HLCUserRegVO.getPreferedCommunication());                                                                                                                                                                   
                                                                                     %>
										  <option value="Primary">Primary Address</option>
										  <option selected="selected" value="Secondary">Secondary Address</option>
										  
										 																				
										<%}else if(HLCUserRegVO.getPreferedCommunication().equalsIgnoreCase("Primary")){
										System.out.println("HLCUserRegVO.getPreferedCommunication() :"+HLCUserRegVO.getPreferedCommunication()); 
										%>
										
										  <option selected="selected" value="Primary">Primary Address</option>
										  <option value="Secondary">Secondary Address</option>
										
										<%}}%>
							</select>
										</span>
									</div>
									<div class="colspan">
										<strong>Contact Options</strong>
									</div>
											<div id="commonBG" class="textCommon" style="height:40px;">
												We provide mail/email information to other affliates, organizations, sponsors 
												and vendors on a limited basis. You may choose to not receive these mailings by selecting the 
												appropriate options below:
											</div>
											<div id="commonBG" class="textCommon" style="height:40px;">
											<% 
											System.out.println("HLCUserRegVO.isNonUseaEmailStatus() :"+HLCUserRegVO.isNonUseaEmailStatus());
											
											if(HLCUserRegVO.isNonUseaEmailStatus()){%>
												<input type="checkbox" name="nonUseaEmail"  id="nonUseaEmail_id" value="true" checked /> Do not release my email address for non-HLC specific use. <br />
												<%}else {%>
												<input type="checkbox" name="nonUseaEmail"  id="nonUseaEmail_id" value="true" /> Do not release my email address for non-HLC specific use. <br />
												<%}%>
											<%System.out.println("nonUseaMail:testing:"+HLCUserRegVO.isNonUseaMailingStatus()); 
											  if(HLCUserRegVO.isNonUseaMailingStatus()){
											%>
												<input type="checkbox" name="nonUseaMail"  id="nonUseaAdd_id" value="true" checked /> Do not release my mailing address for non-HLC specific use.<br/>
												<%} else {%>
												<input type="checkbox" name="nonUseaMail"  id="nonUseaAdd_id" value="true" /> Do not release my mailing address for non-HLC specific use.<br/>
												<%}%>
											</div>
									<!-- spacer starts-->
									<div class="spacer">&nbsp;</div>	
									<!-- spacer ends-->
							

								<div class="row">
									<span class="label">&nbsp;</span>
									<span class="formX"><input type="submit" value="Update" class="gradBtn" /></span>
								</div>
							
									<!-- spacer starts-->
									<div class="spacer">&nbsp;</div>	
									<!-- spacer ends-->
									<!-- spacer starts-->
									<div class="spacer">&nbsp;</div>	
									<!-- spacer ends-->
							
						<!-- **************************************** Part A of the form Ends here *********************************************** -->	
			<%
                           
                        String pctry="";
			
			if(HLCUserRegVO.getPrimaryCountry()!=null && HLCUserRegVO.getPrimaryCountry().trim().length()!=0)
			{
				pctry=HLCUserRegVO.getPrimaryCountry();
			}
			else
			{
				pctry="USA";
			}
                        
                        String pstat="";
			
			if(HLCUserRegVO.getPrimaryState()!=null && HLCUserRegVO.getPrimaryState().trim().length()!=0)
			{
				pstat=HLCUserRegVO.getPrimaryState();
			}
			else
			{
				pstat="";
			}
			
			String sctry="";
			
			if(HLCUserRegVO.getSecondaryCountry()!=null && HLCUserRegVO.getSecondaryCountry().trim().length()!=0)
			{
				sctry=HLCUserRegVO.getSecondaryCountry();
			}
			else
			{
				sctry="USA";
			}
                        
                        String sstat="";
			
			if(HLCUserRegVO.getSecondaryState()!=null && HLCUserRegVO.getSecondaryState().trim().length()!=0)
			{
				sstat=HLCUserRegVO.getSecondaryState();
			}
			else
			{
				sstat="";
			}

			%>


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

	FillCountry(document.frmMembRegi.pcountry_sel, document.frmMembRegi.pstate_sel, '<%=pctry%>' );
	FillState(document.frmMembRegi.pcountry_sel, document.frmMembRegi.pstate_sel, '<%=pstat%>');

	FillCountry(document.frmMembRegi.scountry_txt, document.frmMembRegi.sstate_txt, '<%=sctry%>' );
	FillState(document.frmMembRegi.scountry_txt, document.frmMembRegi.sstate_txt, '<%=sstat%>');

</script>
</html>