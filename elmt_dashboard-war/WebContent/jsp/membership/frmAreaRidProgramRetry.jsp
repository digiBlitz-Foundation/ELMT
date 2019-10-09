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
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>
<%@ page import="com.mrm.util.DonationVO"%>
<%@ page import="com.mrm.util.*"%>
<%@ page import="com.common.util.*"%>
<%@ page import="com.form.util.*" %>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><bean:message key="membership.title"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/calendar2.js" type="text/javascript"></script>
<script src="javascripts/frmAreaProgRetryValidate.js" type="text/javascript"></script>

<link href="../../css/core-ie.css" type="text/css" rel="stylesheet" />
</head>

<script type="text/javascript">
function showHideRadio(radioNam,divId,radVal){
	//alert(radVal);
		if(document.frmMyAreaRid.elements[radioNam].value == radVal){
				document.getElementById(divId).style.display = "block";	
		}
		else {
				document.getElementById(divId).style.display = "none";	
		} 
}




</script>

<%! 
DecimalFormat result  = new DecimalFormat("0.00");
String amtFormat(String amtVal){
    String amountValue = "0.00";
    if(amtVal!=null && amtVal.trim().length()!=0){
        System.out.print(Double.parseDouble(amtVal));
        amountValue = result.format(Double.parseDouble(amtVal));
    }
    return amountValue;
}

%>
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
		
                        
			<%
                            String amt="";
                            amt=(String)request.getAttribute("amt");
                            String payId=(String)request.getAttribute("payId");
                            String usrStat=(String)request.getAttribute("usrStat");
							
							String area=(String)request.getAttribute("area");
                            String progName=(String)request.getAttribute("progName");
							String progDesc=(String)request.getAttribute("progDesc");
                            String progYr=(String)request.getAttribute("progYr");
                            						
                           
	
                         %>
						<form name="frmMyAreaRid" id="frmMyAreaRid" method="post" class="formcss" action="./retryAreaMember.do" onsubmit="return myvalidate(this);">
									<input type="hidden" name="paymentId" value="<%=payId%>" />
									<input type="hidden" name="usrStat" value="<%=usrStat%>" />
									
									<input type="hidden" name="area" value="<%=area%>" />
									<input type="hidden" name="progName" value="<%=progName%>" />
									<input type="hidden" name="progDesc" value="<%=progDesc%>" />
									<input type="hidden" name="progYr" value="<%=progYr%>" />
									<input type="hidden" name="cmd" value="areaPayment" />
									
																							                                                                     
													
															<%
															
															//out.print(" usrStat :"+usrStat);
															
																/*if(usrStat==null)
																{	
																
																   if(session.getAttribute("pendingAmt")!=null)
																   {
																	
															%>
															
															<div class="row">
																<span class="label">Pending Amount:</span>
																<span class="formX"><strong>$</strong> <%=pendAmt%>&nbsp; U.S. Dollars</span>
															</div>
															
															<%}}*/%>
															<%if(session.getAttribute("loggedBy")!=null){%>
															
															
						<div class="rowHead">
														Payment Information:
													</div>
															<div class="row">
																<span class="label">Total Amount:</span>
		<span class="formX"><strong>$</strong> <input name="totalAmount" id="totalAmount" type="text" class="textboxOne" value="<%=amtFormat(amt)%>" readonly size="10" />&nbsp; U.S. Dollars</span>
															</div>
						
	                                   
							<div>
					<span >
						<input type="radio" size="10" name="r11" id="r11" value="check"  onclick="switchDiv('chkEnc'), showHideRadio('r11','chrgCrd','check'), hideImgDiv('cvvImg'),checkclear();cardclear();"/> Check enclosed.				 	</span>
					<span>
						<input type="radio" size="10" name="r11" id="r11" value="card" checked="checked"
onclick="switchDiv('chrgCrd'), showHideRadio('r11','chkEnc','card'), showImgDiv('cvvImg'), cardclear();checkclear();"/> Please charge my card.					</span>
				  </div>			
							<input type="hidden" name="cc11" id="cc11" value="adsec1"/>	
							<br/>							
								<div id="chkEnc">
								<div class="colspan">
								<strong>Check Details:</strong>
								</div>
							<div class="tblDescrp">
							<p>
							If paying by check (payable in U.S dollar to "USEA"), please mail your payment to:  <br /><br />
							
							<strong>USEA
							<br />
							Member Registration
							<br />
							525 Old Waterford Road NW
							<br />
							Leesburg, VA 20176
							</strong><br /><br />
							
							<strong>Note:</strong> <span class="styleBoldOne">Your registration status will be pending until check is processed.</span> <br /><br />
							</p>
							</div>
																			
																			
																			<div class="row">
																				<span class="label">Check Amount :</span>
																				<span class="formX">
																				<input name="chkBalAmt" id="chkBalAmt" type="text" class="textboxOne"  size="30" maxlength="16" /> 	</span>
																			</div>
																		   
																			
																			<div class="row">
																				<span class="label">Check No:</span>

																				<span class="formX"><input name="checkNumber" type="text" id="checkNumber" class="textboxOne"  size="16" />&nbsp;<span class="asterisk">*</span></span>																			</div>
												<%
																		    String chkDat2="";
																		
																			java.util.Calendar c7 = java.util.Calendar.getInstance();
																			int dyChk = c7.get(Calendar.DATE);
																			int mnth = c7.get(Calendar.MONTH);
																			
																			int mnthChk = mnth+1;
																			int yrChk = c7.get(Calendar.YEAR);
																			
																			if(mnthChk<10)
																			{
																				chkDat2 = "0"+mnthChk+"/"+dyChk+"/"+yrChk;
																			}
																			else
																			{
																				
																				chkDat2 = mnthChk+"/"+dyChk+"/"+yrChk;
																			}
																			%>									
																				
																			<div class="row">
																				<span class="label">Check Date:</span>
																				<span class="formX"><input name="checkDate" type="text" id="checkDate" class="textboxOne"  value="<%=chkDat2%>" size="10" />&nbsp;<span class="asterisk">*</span><a href="javascript:cal1.popup();"><img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a></span></div>
									             
																			<div class="row">
																				<span class="label">Activation Date:</span>
																				<span class="formX"><input name="activeDate" type="text" id="activeDate" class="textboxOne"  value="<%=chkDat2%>" size="10" />&nbsp;<span class="asterisk">*</span><a href="javascript:cal2.popup();"><img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a></span></div>
                                                      
																			<div class="row">
																				<span class="label">Bank Name :</span>
																				<span class="formX">
																				<input name="bankName" id="bankName" type="text" class="textboxOne"  size="30" />&nbsp;<span class="asterisk">*</span></span>
																			</div>
																			<div class="row">
																				<span class="label">Name on Check:</span>
																				<span class="formX">
																				<input name="nameCheck" id="nameCheck" type="text" class="textboxOne"  size="30" /> <span class="asterisk">*</span>	</span>
																			</div>
																	</div>
																	
																	<div id="chrgCrd">
																			<div class="colspan">
																				<strong>Card Details:</strong>																			</div>
																			<div class="row">
																				<span class="label">Card Type:</span>
																				<span class="formX">
																			<select name="ccType" id="ccType" class="selectboxOne">						
																				<option selected="selected">Select One</option>
																				<option value="Visa">Visa</option>
																				<option value="MasterCard">Master Card</option>
																				<option value="Amex">AmEx</option>
																			</select>
																				&nbsp;<span class="asterisk">*</span></span>																			</div>
																			<div class="row">
																				<span class="label">Card No:</span>
																				<span class="formX"><input name="ccNumber" id="ccNumber" type="text" size="20" class="textboxOne" />&nbsp;<span class="asterisk">*</span></span>		</div>

																		
																			<div class="row">
																				<span class="label">CVV No.:</span>
																				<span class="formX"><input name="ccCvvid" id="ccCvvid" type="text" size="5" class="textboxOne" maxlength="4"/>&nbsp;(see details below)</span>	</div>
																			<div class="row">
																				<span class="label">Print Name On Card:</span>
																				<span class="formX"><input type="text" name="ccName" id="ccName" size="25" class="textboxOne" />&nbsp;<span class="asterisk">*</span></span  ></div>
                                                                      
																			<div class="row">
																			<span class="label">Activation Date:</span>
																			<span class="formX"><input name="activeDatVal" type="text" id="activeDatVal"  class="textboxOne" value="<%=chkDat2%>"  size="10" /><span class="asterisk">*</span><a href="javascript:cal3.popup();"><img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0">	</a></span></div> 
																		
																			<div class="row">
																				<span class="label">Expiry Date:</span>
																				<span class="formX">
																					<select name="ccExpMonth" id="ccExpMonth" class="selectboxOne">
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
																					<select name="ccExpYear" id="ccExpYear" class="selectboxOne">
																						  <option value="" selected="selected" >Year</option>
																				<%
																		java.util.Calendar c5 = java.util.Calendar.getInstance();
																				int year5 = c5.get(Calendar.YEAR);
																				for(int f=year5;f<=year5+10;f++) 
																				{%>
																					<option  value="<%=f%>"><%=f%></option>
																				<%}
																				%>																		
																					</select>&nbsp;<span class="asterisk">*</span>
																				</span>																												                                               </div>
												</div>			
	
                                 <%
								 }else{%>                                                                                         
											
											
							<div class="rowHead">
														Payment Information:
													</div>
															<div class="row">
																<span class="label">Total Amount:</span>
		<span class="formX"><strong>$</strong> <input name="totalAmount" id="totalAmount" type="text" class="textboxOne" value="<%=amtFormat(amt)%>" readonly size="10" />&nbsp; U.S. Dollars</span>
															</div>
		
		
															<div class="row">
																<span class="floatLeft">
																<input type="radio" size="10" name="r11" value="card" checked="checked" onclick="switchDiv('chrgCrd');"/> Please charge my card.
																</span>
															</div>
											<input type="hidden" name="cc11" id="cc11" value="usrsec2"/>
															
				<div id="chrgCrd">
				<div class="colspan">
				<strong>Card Details:</strong>	</div>
																			<div class="row">
																				<span class="label">Card Type:</span>
																				<span class="formX">
																			<select name="ccType" id="ccType" class="selectboxOne">						
																				<option selected="selected">Select One</option>
																				<option value="Visa">Visa</option>
																				<option value="MasterCard">Master Card</option>
																				<option value="Amex">AmEx</option>
																			</select>
																				&nbsp;<span class="asterisk">*</span></span>																			</div>
																			<div class="row">
																				<span class="label">Card No:</span>
																				<span class="formX"><input name="ccNumber" id="ccNumber" type="text" size="20" class="textboxOne" />&nbsp;<span class="asterisk">*</span></span>		</div>

																		
																			<div class="row">
																				<span class="label">CVV No.:</span>
																				<span class="formX"><input name="ccCvvid" id="ccCvvid" type="text" size="5" class="textboxOne" maxlength="4"/>&nbsp;<span class="asterisk">*</span>&nbsp;(see details below)</span>	</div>
																			<div class="row">
																				<span class="label">Print Name On Card:</span>
																				<span class="formX"><input type="text" name="ccName" id="ccName" size="25" class="textboxOne" />&nbsp;<span class="asterisk">*</span></span  ></div>
                                                                       
																			<div class="row">
																				<span class="label">Expiry Date:</span>
																				<span class="formX">
																					<select name="ccExpMonth" id="ccExpMonth" class="selectboxOne">
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
																					<select name="ccExpYear" id="ccExpYear" class="selectboxOne">
																						  <option value="" selected="selected" >Year</option>
							<%
					        java.util.Calendar c5 = java.util.Calendar.getInstance();
							int year5 = c5.get(Calendar.YEAR);
							for(int f=year5;f<=year5+10;f++) 
							{%>
								<option  value="<%=f%>"><%=f%></option>
							<%}
							%>																		
						</select>&nbsp;<span class="asterisk">*</span>
						</span>	
						
			<%
																		    String chkDat2="";
																		
																			java.util.Calendar c6 = java.util.Calendar.getInstance();
																			int dyChk = c6.get(Calendar.DATE);
																			int month = c6.get(Calendar.MONTH);
																			
																			int monthChk = month+1;
																			int yrChk = c6.get(Calendar.YEAR);
																			
																			if(monthChk<10)
																			{
																				chkDat2 = "0"+monthChk+"/"+dyChk+"/"+yrChk;
																			}
																			else
																			{
																				
																				chkDat2 = monthChk+"/"+dyChk+"/"+yrChk;
																			}
																			%>
																				
																				<input name="activeDate" type="hidden" id="activeDate"  class="textboxOne" value="<%=chkDat2%>" />				
						
		
						</div>
						
															</div>			
											
								<%}%>
								
													<div class="row">
														<span class="label">&nbsp;</span>
														<span class="formX"><input type="submit" name="renstat" value="Submit" class="gradBtn" /></span>													</div>
														<br/>
														
													
													<!-- spacer ends-->
													<!-- spacer starts-->
													
													<!-- spacer ends-->	
								<!--++++++++++++++++++++ Part D of the form Ends here ++++++++++++++++++++++++++++++ -->
								</div>	
						
								<div id="cvvImg" class="alignCenter">
															<span class="label">&nbsp;</span>
														   <span class="formX">
																<img src="images/cvv_graphic.jpg" />																				
															</span>
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
<%  if(session.getAttribute("loggedBy")!=null){	%>
if(document.getElementById('checkDate').value!=null)
	{
	var cal1 = new calendar2(document.forms['frmMyAreaRid'].elements['checkDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	}
	if(document.getElementById('activeDate').value!=null)
	{
	var cal2= new calendar2(document.forms['frmMyAreaRid'].elements['activeDate']);
	cal2.year_scroll = true;
	cal2.time_comp = false;
	}
if(document.getElementById('activeDatVal').value!=null)
	{
	var cal3= new calendar2(document.forms['frmMyAreaRid'].elements['activeDatVal']);
	cal3.year_scroll = true;
	cal3.time_comp = false;
	}
	
	<%}%>
	</script>

</html>


