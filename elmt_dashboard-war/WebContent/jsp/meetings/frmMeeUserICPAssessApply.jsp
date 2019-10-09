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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/frmMeeUserICPAssessApply.js" type="text/javascript" ></script>
 <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" />
<%@ page import="java.util.*"%>
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
				<table border="0" cellpadding="0" align="center" cellspacing="0" class="tblInnerContainer">
				  <tr>
					<td colspan="2" class="tblMainHead">
					<strong>Meetings: </strong> <span class="styleBoldTwo">Apply ICP Assessment </span></td>
				  </tr>
				  <tr>
					<td colspan="2" class="tblDescrp">   
					</td>
				  </tr>
				  <tr>
					<td>
	
					
					<form name="frmMeeICPAssessment" id="myform" method="post" action="./IcpUsrMeetList.do?process=applyDisp">
					
							
					<table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
						<!--	<tr>
							<td colspan="2">
							 TABS START HERE										
								<table cellpadding="0" cellspacing="0" border="0" class="container">
									<tr>
										<td id="tabData1" class="tabHighlight" onclick="naviTab('1')">
											<a id="link1" href="javascript:void(0);" class="active"><span class="tabHead">Part A</span></A>
										</td>
										<td width="1" style="border-bottom:1px solid #999;">&nbsp;</td>
										<td id="tabData2" class="tabLowlight" onclick="naviTab('2')">
											<a id="link2" href="javascript:void(0);" class="inactive"><span class="tabHead">Part B</span></A>
										</td>
										<td width="1" style="border-bottom:1px solid #999;">&nbsp;</td>
										<td id="tabData3" class="tabLowlight" onclick="naviTab('3')">
											<a id="link3" href="javascript:void(0);" class="inactive"><span class="tabHead">Part C</span></A>
										</td>
									</tr>	
								</table>
								<!-- TABS END HERE  
							</td>
						</tr>
						  -->
						 <tr id="part1" class="holderDivOne" >
						 	<td colspan="2">
							<!--++++++++++++++++++++ Part 1 of the form starts here ++++++++++++++++++++++++++++++ -->	

						<%
							Vector accessDet=new Vector();
							accessDet=(Vector)request.getAttribute("meeDet");
							System.out.println("size in jsp :"+accessDet.size());
                                                        
							if(accessDet!=null && accessDet.size()!=0)
							{
                                                         Enumeration en=accessDet.elements();    
                                                            
							while(en.hasMoreElements())
							{
                                                                  String[] icpVal = (String[])en.nextElement();
/*									 out.print(" 38 "+icpVal[38]+"<br>");
									 out.print(" 39 "+icpVal[39]+"<br>");
									 out.print(" 40 "+icpVal[40]+"<br>");
									 out.print(" 41 "+icpVal[41]+"<br>");
									 out.print(" 42 "+icpVal[42]+"<br>");									 									 
									 out.print(" 43 "+icpVal[43]+"<br>");
									 out.print(" 44 "+icpVal[44]+"<br>");									 									 									 									 
									 out.print(" 45 "+icpVal[45]+"<br>");
									 out.print(" 46 "+icpVal[46]+"<br>");
									 out.print(" 47 "+icpVal[47]+"<br>");
									 out.print(" 48 "+icpVal[48]+"<br>");
									 out.print(" 49 "+icpVal[49]+"<br>");
									 out.print(" 50 "+icpVal[50]+"<br>");
									 out.print(" 51 "+icpVal[51]+"<br>");
									 out.print(" 52 "+icpVal[52]+"<br>");
									 out.print(" 53 "+icpVal[53]+"<br>");
									 out.print(" 54 "+icpVal[54]+"<br>");
									 out.print(" 55 "+icpVal[55]+"<br>");
									 out.print(" 56 "+icpVal[56]+"<br>");
									 out.print(" 57 "+icpVal[57]+"<br>");									 									 									 									 									 									 									 									 									 									 									 									 									 
									 out.print(" 58 "+icpVal[58]+"<br>");
									 out.print(" 59 "+icpVal[59]+"<br>");
									 out.print(" 60 "+icpVal[60]+"<br>");*/
							 									 									 									 									 									 									 									 									 									 									 									 									 
																  
                                                                  String dat1=icpVal[2];
								  String[] dat=dat1.split(" ");
                            %>

							<table cellpadding="0" cellspacing="0" border="0" class="formLayout">
								 <tr> 
									<td colspan="2" class="tblRowHead">ICP Assessment Details:</td>
								  </tr>
								   
								  <tr> 
									<input type="hidden" name="mid" value="<%=icpVal[0]%>" />
									<td class="tableLeft">Assessment Level:</td>
									<th class="tableRight"><%=icpVal[1]%></th>
								  </tr>
								  <tr> 
									<td class="tableLeft">Date:</td>
									<td class="tableRight"><%=dat[0]%></td>
								  </tr>
								   <tr> 
									<td class="tableLeft">No. of Days:</td>
									<td class="tableRight"><%=icpVal[3]%></td>
								  </tr>
								  <tr> 
									<td class="tableLeft">Area:</td>
									<th class="tableRight"><%=icpVal[26]%></th>
								  </tr>
								  <tr> 
									<td class="tableLeft">Location:</td>
									<td class="tableRight"><%=icpVal[5]%></td>
								  </tr>
								  <tr> 
									<td class="tableLeft">Host ID:</td>
									<th class="tableRight"><%=icpVal[7]%></th>
								  </tr>
								  <tr> 
									<td class="tableLeft">First Name:</td>
									<td class="tableRight"><%=icpVal[27]%></td>
								  </tr>
								  <tr> 
									<td class="tableLeft">Last Name:</td>
									<td class="tableRight"><%=icpVal[28]%></td>
								  </tr>
								  <tr> 
									<td class="tableLeft">Address:</td>
									<td class="tableRight"><%=icpVal[30]%></td>
								  </tr>
								  <tr> 
									<td class="tableLeft">Country:</td>
									<td class="tableRight"><%=icpVal[31]%></td>
								  </tr>
								  <tr> 
									<td height="24" class="tableLeft">State:</td>
									<td class="tableRight"><%=icpVal[32]%></td>
								  </tr>
								  <tr> 
									<td class="tableLeft">City:</td>
									<td class="tableRight"><%=icpVal[33]%></td>
								  </tr>
								  <tr> 
									<td class="tableLeft">Zip:</td>
									<td class="tableRight"><%=icpVal[34]%></td>
								  </tr>
							 </table>
							<!--++++++++++++++++++++ Part 1 of the form ends here ++++++++++++++++++++++++++++++ -->
							</td>
						 </tr>
						 
						 <tr id="part2" class="holderDivTwo">
						 	<td colspan="2">
							
							<!--++++++++++++++++++++ Part 2 of the form starts here ++++++++++++++++++++++++++++++ -->	
							<table cellpadding="0" cellspacing="0" border="0" class="formLayout">
								  <tr> 
									<td class="tableLeft">Phone:</td>
									<td class="tableRight"><%=icpVal[35]%></td>
								  </tr>
								  <tr> 
									<td class="tableLeft">Fax:</td>
									<td class="tableRight"><%=icpVal[36]%></td>
								  </tr>
								  <tr> 
									<td class="tableLeft">EMail:</td>
									<th class="tableRight"><%=icpVal[29]%></th>
								  </tr>
								  <tr> 
									<td class="tableLeftTxtArea">Assessor Detail:</td>
									<td class="tableRight"><%=icpVal[9]%></td>
								  </tr>
								  <tr>
									<td class="tableLeftTxtArea"> Facilities To Be Used Specifically:  </td>
									<%String[] facil = icpVal[10].split("#");
									String facility="";
									for(int i=0;i<facil.length;i++){
									if(!facil[i].equals("null")){
											facility+=facil[i]+",";
										}
									}
									%>
									<td class="tableRight"><span class="styleBoldOne"><%=facility%></span></td>
								  </tr>
								  
							</table>
							<!--++++++++++++++++++++ Part 2 of the form ends here ++++++++++++++++++++++++++++++ -->		
							
							</td>
						 </tr>
						  
					  	 <tr id="part3" class="holderDivTwo">
						<td colspan="2">
						
						<!--++++++++++++++++++++ Part 3 of the form starts here ++++++++++++++++++++++++++++++ -->	
						<table cellpadding="0" cellspacing="0" border="0" class="formLayout">

						  <tr>
							<td colspan="2" class="tblRowHead"> <span class="rowHead">Land Owner Details : </span></td>
						  </tr>
						  <tr>
							<td class="tableLeft">Land Owner Name :</td>
							<th class="tableRight"><%=icpVal[11]%></th>
						  </tr>
						  <tr>
							<td height="27" class="tableLeft">Business Name : </td>
							<th class="tableRight"><%=icpVal[12]%></th>
						  </tr>
						  <tr>
							<td class="tableLeft"> Address:</td>
							<td class="tableRight"><%=icpVal[13]%></td>
						  </tr>
						  <tr>
							<td height="27" class="tableLeft">Country: </td>
							<td class="tableRight"><%=icpVal[16]%></td>
						  </tr>
						  <tr>
							<td class="tableLeft"> State:</td>
							<td class="tableRight"><%=icpVal[15]%></td>
						  </tr>
						  <tr>
							<td class="tableLeft">City: </td>
							<td class="tableRight"><%=icpVal[14]%></td>
						  </tr>
						  <tr>
							<td class="tableLeft">Phone: </td>
							<td class="tableRight"><%=icpVal[18]%></td>
						  </tr>
						  <tr>
							<td class="tableLeft style1">Fax: </td>
							<td class="tableRight"><%=icpVal[19]%></td>
						  </tr>
						  <tr>
							<td colspan="2" class="tblRowHead"> <span class="rowHead">Transaction Details : </span></td>
						  </tr>
						  <% 
						  String paystat = icpVal[51];
						  if(paystat.equalsIgnoreCase("check")){
						  %>
						  <tr>
							<td class="tableLeft style1">Check Number:</td>
							<td class="tableRight"><%=icpVal[47]%></td>
						  </tr>
						  <tr>
							<td class="tableLeft style1">Check Name: </td>
							<td class="tableRight"><%=icpVal[48]%></td>
						  </tr>						  
						  <tr>
							<td class="tableLeft style1">Amount: </td>
							<td class="tableRight"><%=icpVal[49]%></td>
						  </tr>						  
						  <tr>
							<td class="tableLeft style1">Check Date: </td>
							<td class="tableRight"><%=icpVal[46]%></td>
						  </tr>						  						  
						  <tr>
							<td class="tableLeft style1">Bank Name: </td>
							<td class="tableRight"><%=icpVal[45]%></td>
						  </tr>	
						  <%	}
						  else{
						  %>					  
						  <tr>
							<td class="tableLeft style1">Transaction Id: </td>
							<td class="tableRight"><%=icpVal[54]%></td>
						  </tr>						  						  
						  <tr>
							<td class="tableLeft style1">Amount: </td>
							<td class="tableRight"><%=icpVal[49]%></td>
						  </tr>	
						  <% } %>
						<%}}
                                                else{%>
                                                              <td class="listCellBg"><center>
                                                              </center>   
															        <div align="center"><span class="styleBoldTwo"><strong>
                                                                    <div align="justify">No Records Found !
                                                                      </center>
                                                                    </div>
                                                              </strong></span></div></td>
                                                       <% }%>
						  <tr>
							 <td colspan="2" class="alignCenter"><input name="sub" type="submit" value="Apply" class="gradBtn" /></td>
						  </tr>
						</table>
						<!--++++++++++++++++++++ Part 3 of the form ends here ++++++++++++++++++++++++++++++ -->		
						
						</td>
				
					  </table>
					  </form>
					  
					</td>
				  </tr>
				  <tr>
						<td>&nbsp; 
					   <!-- DO NOT DELETE THIS ROW -->
					   </td>
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


�

</body>
</html>