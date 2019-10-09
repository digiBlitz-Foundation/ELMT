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
<%@ page import="com.hlcmro.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
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
			<%@ include file = "/include/menu-roles-leftmenu.jsp" %>
			<!-- LEFT MENU ENDS HERE -->

		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				<table  border="0" cellpadding="0" cellspacing="0"  align="center" class="formLayout">
				  <tr>
					<td colspan="5" class="tblMainHead">
					Meetings:<span class="styleBoldTwo"> Annual Ticket Listing </span></td>
				  </tr>
				  <tr>
					<td colspan="5" class="tblDescrp">&nbsp;</td>
				  </tr>
				 
				 <tr>
					<td>
						 <table border="0" cellpadding="3" align="center" cellspacing="1" class="formLayout">
				
						  <tr>
							<th width="125" height="20" valign="top" class="alignRight" style="border-bottom:1px solid #999;">&nbsp;Color Legends: </th>
							<td colspan="4" valign="middle" class="alignLeft" style="border-bottom:1px solid #999;">
							<span class="legendTwo">&nbsp;</span> &nbsp;Edit.
							</td>

						   </tr>
						  <tr>
							<td height="27" colspan="2" class="tblRowHeadTwo">Activity Name </td>
							<td class="tblRowHeadTwo">Total Available Tickets</td>
							<td width="50" class="tblRowHeadTwo">Edit</td>
						  </tr>
						  
				 
			     <% 
					ArrayList tkt_list = new ArrayList();
                    tkt_list=(ArrayList)request.getAttribute("details");
 			     
					if(tkt_list!=null && tkt_list.size()!=0)
						{
    					   System.out.println("size in jsp :"+tkt_list.size());
 						   Iterator itr = tkt_list.iterator();
						   while(itr.hasNext())
						   {
						   		String[] tktVal = (String[])itr.next();
   								String annualTId = tktVal[0];
//								out.print(annualTId);
								String availTicket = tktVal[1];
								String meeId  = tktVal[2];
								String meeName = tktVal[3];
				  %>
				 
		 


							<tr>
										<td height="26" colspan="2" bgcolor="#E3E1D2" class="alignCenter"><%=meeName%></a></td>
											<td bgcolor="#E3E1D2" class="alignCenter"><%=availTicket%></td>
											<td bgcolor="#E3E1D2" class="alignCenter"><input name="submit" type="button" class="oneBtn" onclick="javascript:location.href('./AnnualTcktDetails.do?process=edit&act_typ=<%=annualTId%>');" value="Edit"/>
										</td>
							</tr>
					 
			<%		}
				}

			else
				{			%>
	  	 
									  
								  <tr>
									<td height="26" colspan="6" bgcolor="#E3E1D2" class="alignCenter">No Records are Available.</td>
								  </tr>
								  <% 
									  } 
								  %>
						  <tr>
							<td height="19" colspan="7">&nbsp;</td>
						   </tr>
					  </table>
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
</body>
</html>