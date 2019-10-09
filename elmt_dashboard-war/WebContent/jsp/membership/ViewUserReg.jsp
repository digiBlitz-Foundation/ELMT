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
<%@ page import="java.util.*,java.util.regex.*"%> 
<%@ page import="com.hlchorse.form.util.*" %>
<%@ page import="com.hlcform.util.HLCMemberDetails" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.hlcform.util.*" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/validate.js" type="text/javascript" ></script>
<script src="javascripts/frmMembRegi.js" type="text/javascript" ></script>
 <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" />
 
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
		<form name="frmMembRegi" id="myform" method="post" class="formcss" action="InsertUserReg.do">
		
<div class="cmmnForm">
	<div class="colspan">
		<strong>Membership: <span class="styleBoldTwo"> Registration Detail</span></strong>	</div>
		
		
	<%!              SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat sd1 = new SimpleDateFormat("MM-dd-yyyy");
					
					String dateFormat(String fieldName){					
						Date clDate = null;
						Calendar cal = Calendar.getInstance();
						GregorianCalendar gc = new GregorianCalendar();
						try{
							clDate = sd.parse(fieldName);
						}catch(Exception e){
							System.out.println("Error While Parsing Date: "+e);
						}
						
						gc.setTime(clDate);
						cal.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DAY_OF_MONTH),0,0,0);
						String dispDate = "N/A";
						if(clDate!=null ){
						dispDate = sd1.format(cal.getTime());
						}
						return dispDate;
					}
%>	
		
	<%
	
			String membId="NA";
			String mem_typ="NA";
			String status="NA";
			String exp="NA";
			String amName="";
			String amDec1="";
			String amDec2="";
			String amStat="NA";
			String mid = (String)session.getAttribute("memberId");
			//SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyy");
			
		if(mid != null)
		{
			HLCMemberDetails objMember = new HLCMemberDetails();
			objMember=(HLCMemberDetails)request.getAttribute("objMember");
			
			 membId = (String)session.getAttribute("memberId");
			 mem_typ = objMember.getMembershipTypeName();
			 
			 amName = objMember.getAmateurName();
			 amDec1 = String.valueOf(objMember.isAmateurDec1());
			 amDec2 = String.valueOf(objMember.isAmateurDec2());
			 
			 /*if(amName != null)
			 {
			 	amStat = "Yes";
			 }
			 else if(amDec1 != null)
			 {
			 	amStat = "Yes";
			 }
              else if(amDec2 != null)
			 {
			 	amStat = "Yes";
			 }
			 else
			 {
			 	amStat = "No";
			 }*/
			 
			 if(amName != null){
			 	if(objMember.isAmateurDec1()){
					amStat = "Yes";
				}
				else {	
					amStat="No";
				}
			 }
			 status = objMember.getStatusName();
			 
			/* Date ex = new Date();
			 //Date finExp = new Date();
			// String st = objMember.getExpiryDate().toString();
			 
			// ex = (Date)sdf.parse(st);
			 
           //  exp = ex.toString();
                       
			// ex = objMember.getExpiryDate();
			 exp = objMember.getExpiryDate().toString();*/
			 
			
		}
	
	%>
	  <div class="row">
		<span class="label">Member ID:</span>
		<span class="formX"><%=membId%></span>
	  </div>
	  
	  <div class="row">
		<span class="label">Member Type:</span>
		<span class="formX"><%=mem_typ%></span>
	  </div>
	  <div class="row">
		<span class="label">Member Status:</span>
		<span class="formX"> <span class="styleBoldOne"><%=status%></span></span>
	  </div>	  
	  <%--<div class="row">
		<span class="label">Membership Expiry:</span>
		<span class="formX"> <span class="styleBoldOne"><%=exp%></span></span>
	  </div>	--%>  
	  <div class="row">
		<span class="label">Amateur Declaration:</span>
		<span class="formX"><%=amStat%></span>
	  </div>	  

            <div id="parta" >	
                <!-- **************************************** Part A of the form starts here *********************************************** -->
						
							<div class="rowHead">
								Basic Information:
							</div>
							
							<%
                                                                 HLCUserRegVO HLCUserRegVO=new HLCUserRegVO();

                                                                 HLCUserRegVO=(HLCUserRegVO)request.getAttribute("EditusrVect");
                                                                 
                                                                 String prefix="N/A";
                                                                 
                                                                 if(HLCUserRegVO.getPrefix()!=null && HLCUserRegVO.getPrefix().trim().length()!=0)
                                                                 {
                                                                    prefix=HLCUserRegVO.getPrefix();
                                                                 }
                                                                 
                                                        %>
							
									<div class="row">
										<span class="label">Salutation:</span>
										<span class="formX">
										  <b><%=prefix%></b>
										</span>
									</div>
									<div class="row">
										<span class="label">First Name:</span>
										<span class="formX"><b><%=HLCUserRegVO.getFirstName()%></b></span>
									</div>

								<%
								String mName;

								if(HLCUserRegVO.getMiddleName()!=null && HLCUserRegVO.getMiddleName().trim().length()!=0)
								{
									mName=HLCUserRegVO.getMiddleName();
								}
								else
								{
									mName="N/A";
								}

								String lName;

								if(HLCUserRegVO.getLastName()!=null && HLCUserRegVO.getLastName().trim().length()!=0)
								{
									lName=HLCUserRegVO.getLastName();
								}
								else
								{
									lName="N/A";
								}
								
								String sName;

								if(HLCUserRegVO.getSufix()!=null && HLCUserRegVO.getSufix().trim().length()!=0)
								{
									sName=HLCUserRegVO.getSufix();
								}
								else
								{
									sName="N/A";
								}
								%>

									<div class="row">
										<span class="label">Middle Name:</span>
										<span class="formX"><b><%=mName%></b></span>
									</div>
									<div class="row">
										<span class="label">Last Name:</span>
										<span class="formX"><b><%=lName%></b></span>
									</div>
									<div class="row">
										<span class="label">Suffix:</span>
										<span class="formX"><b><%=sName%></b></span>
									</div>
			  						<div class="row">
										<%
											String finalDob="N/A";
										
											if(HLCUserRegVO.getDob()!=null)
											{
												String[] dob=HLCUserRegVO.getDob().split(" ");
												finalDob=dob[0];
												
											}
										%>

										<span class="label">Date of Birth :</span>  <span class="formX"><b><%=dateFormat(finalDob)%></b>
               						</span>
									</div>
									<div class="row">
										<span class="label">Gender:</span>
										<span class="formX">
										<%=HLCUserRegVO.getGender()%>
                                        
										</span>
									</div>
									
									<div class="row">
										<span class="label">EMail :</span>
										<span class="formX"><%=HLCUserRegVO.getEmailId()%></span>
									</div>

                                                                        <%
                                                                        
                                                                        String logName="N/A";
                                                                        String logTmp=(String)session.getAttribute("loginName");
																		
                                                                        if(logTmp!=null)
                                                                        {
                                                                           logName = (String) session.getAttribute("loginName");
                                                                        }
                                                                        
                                                                        %>
                                                                        
									<div class="row">
										<span class="label">User Name (Login ID):</span>
										<span class="formX"><%=logName%></span>
									</div>

									<div class="row">
										                                               
                                         <div class="floatLeft"></div>
                                                                                     
										</span>			  </div>
									
							<div id="pAdd">
									
									<div class="colspan">
										<strong>Primary Address </strong> 
									</div>
											<div class="row">
												<span class="label">Address 1:</span>
												<span class="formX"> <%=HLCUserRegVO.getPrimaryAddress1()%></span>
											</div>

								<%
								String sAdd;

								if(HLCUserRegVO.getPrimaryAddress2()!=null && HLCUserRegVO.getPrimaryAddress2().trim().length()!=0)
								{
									sAdd=HLCUserRegVO.getPrimaryAddress2();
								}
								else
								{
									sAdd="N/A";
								}

								String pMob;

								if(HLCUserRegVO.getPromaryMobileNo()!=null && HLCUserRegVO.getPromaryMobileNo().trim().length()!=0)
								{
									pMob=HLCUserRegVO.getPromaryMobileNo();
								}
								else
								{
									pMob="N/A";
								}

								String pFax;

								if(HLCUserRegVO.getPrimaryFaxNo()!=null && HLCUserRegVO.getPrimaryFaxNo().trim().length()!=0)
								{
									pFax=HLCUserRegVO.getPrimaryFaxNo();
								}
								else
								{
									pFax="N/A";
								}

								%>
											
											<div class="row">
												<span class="label">Address 2:</span>
												<span class="formX"> <%=sAdd%></span>
											</div>
											<div class="row">
												<span class="label">City:</span>
												<span class="formX">
												<%=HLCUserRegVO.getPrimaryCity()%>
												</span>
											</div>
											<div class="row">
												<span class="label">State:</span>
												<span class="formX">
												<%=HLCUserRegVO.getPrimaryState()%>
												</span>
											</div>
												<div class="row">
												<span class="label">Zipcode:</span>
												<span class="formX"><%=HLCUserRegVO.getPrmaryZip()%></span>
											</div>
											<div class="row">
												<span class="label">Country:</span>
												<span class="formX">
												<%=HLCUserRegVO.getPrimaryCountry()%>
												 
												</span>
											</div>
	
									<div class="row">
										<span class="label">Phone:</span>
										<span class="formX"><%=HLCUserRegVO.getPrimaryPhoneNo()%></span>
									</div>
									<div class="row">
										<span class="label">Mobile:</span>
										<span class="formX"><%=pMob%></span>
									</div>
									<div class="row">
										<span class="label">Fax:</span>
										<span class="formX"><%=pFax%></span>
									</div>

							</div>
							
							
							<%
								if(HLCUserRegVO.getSecondaryContactTypeName()!=null)
								{
									System.out.println("HLCUserRegVO.getSecondaryContactTypeName() :"+HLCUserRegVO.getSecondaryContactTypeName());
								if(HLCUserRegVO.getSecondaryContactTypeName().equalsIgnoreCase("Secondary"))
								{
									System.out.println("HLCUserRegVO.getSecondaryAddress1() :"+HLCUserRegVO.getSecondaryAddress1());
							%>
									<div>

									<div class="colspan">
										<strong>Secondary Address </strong> 
									</div>
									<div class="row">
							  <span class="label">Address 1:</span>	 <%=HLCUserRegVO.getSecondaryAddress1()%> <span class="formX"> </span>	  </div>
								
			                    <%
								String sAdd2;

								if(HLCUserRegVO.getSecondaryAddress2()!=null && HLCUserRegVO.getSecondaryAddress2().trim().length()!=0)
								{
									sAdd2=HLCUserRegVO.getSecondaryAddress2();
								}
								else
								{
									sAdd2="N/A";
								}

								String sMob;

								if(HLCUserRegVO.getSecondaryMobileNo()!=null && HLCUserRegVO.getSecondaryMobileNo().trim().length()!=0)
								{
									sMob=HLCUserRegVO.getSecondaryMobileNo();
								}
								else
								{
									sMob="N/A";
								}

								String sFax;

								if(HLCUserRegVO.getSecondaryFaxNo()!=null && HLCUserRegVO.getSecondaryFaxNo().trim().length()!=0)
								{
									sFax=HLCUserRegVO.getSecondaryFaxNo();
								}
								else
								{
									sFax="N/A";
								}


								%>

											<div class="row">
												<span class="label">Address 2:</span>	 <span class="formX"> <%=sAdd2%></span>
												
												<span class="formX"> 
												</span>
												
											</div>
											<div class="row">
												<span class="label">City:</span>
												
												<span class="formX"><%=HLCUserRegVO.getSecondaryCity()%></span>
												
											</div>
											<div class="row">
												<span class="label">State:</span>
												
												<span class="formX"> <%=HLCUserRegVO.getSecondaryState()%></span>
												
												
											</div>
											<div class="row">
												<span class="label">Zipcode:</span>
												
												<span class="formX"><%=HLCUserRegVO.getSecondaryZip()%></span>
												
											</div>
											<div class="row">
												<span class="label">Country:</span>
												
												<span class="formX"><%=HLCUserRegVO.getSecondaryCountry()%></span>
												
											</div>
											
									<div class="row">
										<span class="label">Phone:</span>
										<span class="formX"><%=HLCUserRegVO.getSecondaryPhoneNo()%></span>
									</div>
									<div class="row">
										<span class="label">Mobile:</span>
										<span class="formX"><%=sMob%></span>
									</div>
									<div class="row">
										<span class="label">Fax:</span>
										<span class="formX"><%=sFax%></span>
									</div>												
	
								</div>
                                  <%}}%>	                                      <%
                                                                           String prefcom="";
																		   System.out.println("getPreferedCommunication() :"+HLCUserRegVO.getPreferedCommunication());

                                                                           if(HLCUserRegVO.getPreferedCommunication().equalsIgnoreCase("Primary"))
                                                                           {
                                                                                prefcom="Primary Address";
                                                                           }
                                                                           else
                                                                           {
                                                                                prefcom="Secondary Address"; 
                                                                           }
                                                                        %>						
									<div class="row">
										<span class="label">preferred Communication Address:</span>
										<span class="formX">
										<%=prefcom%>
										</span>
									</div>
									
									<div class="colspan">
										<strong>Donation Information </strong> 
									</div>

							 
										<%
										
										ArrayList donSelect=new ArrayList();
										donSelect=(ArrayList)request.getAttribute("donSelect");
										
											if(donSelect!=null)
											{
												System.out.println("donSelect.size() :"+donSelect.size());
												
												HLCDonationDetailVO onjDon = new HLCDonationDetailVO();
												
												if(donSelect.size() == 0)
												{%>
												
											<div class="row">
												<span class="styleBoldOne">No donation details available for this member!!</span>
																						   
											</div>
												
												<%}
																					
												for(int u=0;u<donSelect.size();u++)
												{		
													onjDon=(HLCDonationDetailVO)donSelect.get(u);
													String[] tmp=onjDon.getMemberDonationDate().split(" ");	
												%>
													
													<div class="row">
														<span class="label">Donated On</span>
														<span class="styleBoldOne"><%=dateFormat(tmp[0])%>&nbsp;</span>
													</div>
													
													<div class="row">
														<span class="label">Donation Type: </span>
														<span class="formX"><%=onjDon.getDonationName()%></span>
													</div>		
																								
																				 
													<div class="row">
														<span class="label">Donation Amount:($) </span>
														<span class="styleBoldOne"><%=onjDon.getDonationPrice()%>&nbsp;</span>
													</div>	
																				  
													<div class="row">
														<span class="label">Donated By</span>
														<span class="styleBoldOne"><%=onjDon.getDonatedBy()%>&nbsp;</span>
													</div>
												
						<%}}else
						{%>
																  
								<div class="row">
										<span class="styleBoldOne">No Donation Details Available for this Member!!</span>
																			
								</div>
																  
						<%}%>
									
									
									<div class="colspan">
										<strong>Contact Options</strong>
									</div>
											
											<div class="row">
											<% if(HLCUserRegVO.isNonUseaEmailStatus()){%>
											    Do not release my email address for specific use. - <span class="styleBoldOne">Yes</span><br />
												<%}else{%>
												 Do not release my email address for specific use. - <span class="styleBoldOne">No</span><br />
												 <%}%>
												 </div>
												 
												 <div class="row">
											<% if(HLCUserRegVO.isNonUseaMailingStatus()){%>
											    Do not release my mailing address for specific use. - <span class="styleBoldOne">Yes</span><br/>
												<%}else{%>
												Do not release my mailing address for specific use. - <span class="styleBoldOne">No</span><br/>
												<%}%>
											
											</div>
									<% String mailStatus = (String)request.getAttribute("mailStatus");
									if(mailStatus.equalsIgnoreCase("true")){%>
									<div class="row">
										<span class="styleBoldOne">Please verify your Mailing Address </span>
									</div>
									<%}%>
									<div class="row">
										<div class="alignCenter"><input type="button" value=" Back " class="gradBtn" onclick="location.href='./index.jsp'" /></div>
									</div>									
									
							
						<!-- **************************************** Part A of the form Ends here *********************************************** -->	
            </div>
</div>
	</form>


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