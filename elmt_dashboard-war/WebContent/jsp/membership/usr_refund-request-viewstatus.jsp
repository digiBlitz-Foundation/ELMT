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
<%@page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@page import="java.text.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/frmSponsReg.js" type="text/javascript" ></script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
</head>

<%! 				
				    SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
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
		
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
		  
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
    <td colspan="2" class="tblMainHead"><strong> Membership</strong>: <span class="styleBoldTwo">Refund Request View </span> </td>
  </tr>
  <tr>
  	<td>
	<%
           /*
            * Display Refund details 
            ***
            *
            */
        
            String id=request.getParameter("id");
            int ids=Integer.parseInt(id);
            Vector refundDetail = new Vector();
            refundDetail = (Vector) request.getAttribute("refundDetail");
            String[] refdet=(String[])refundDetail.elementAt(ids);
		//	String[] membid={details[4],details[7]};
		//	session.setAttribute("usrdet",membid);
                //   	System.out.println(" ref approve Jsp Mid from Jsp :" +membid[0] +" "+"Refund Id Jsp:"+membid[1]);
            
            String[] dat=refdet[3].split(" ");
            String rid=refdet[0];
            String bal="0.00";
            String clamt="0.00";
            String comment="";
            String appamt="0.00";
          	String approval_status = "false";
            if(refdet[10]!=null)
            {
                bal=refdet[10];
            }
            if(refdet[2]!=null)
            {
                clamt=refdet[2];
            }
            if(refdet[11]!=null)
	   {
                comment=refdet[11];
	   }
            if(refdet[4]!=null)
	   {
                appamt=refdet[4];
	   }
		   approval_status = refdet[13];
            String[] ref={dat[0],bal,clamt,comment,appamt,rid,refdet[12]};
            session.setAttribute("refdet",ref);
     %>  
		<form name="frmAdvMag" id="myform" method="post" action="./UsrRefundClaimDisp.do">
        <table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
          <tr> 
            <td colspan="2" class="tblRowHead">My Request Detail:</td>
          </tr>
		  <tr> 
            <td class="tableLeft">Date Of Request:</td>
            <td class="tableRight"><%=dateFormat(dat[0])%></td>
          </tr>
          <tr> 
            <td class="tableLeft">Balance Amount:</td>
            <th class="tableRight">$<%=bal%></th>
          </tr>
          <tr> 
            <td class="tableLeft">Claim Amount: </td>
            <th class="tableRight">$<%=clamt%></th>
          </tr>
          <tr> 
            <td class="tableLeftTxtArea">My Comments: </td>
            <td class="tableRight"><%=comment%>
			
			</td>
          </tr>
		  <tr> 
            <td colspan="2" class="tblRowHead">Request Status Detail:</td>
          </tr>
		  <tr> 
            <td class="tableLeft">Request Status: </td>
            <th class="tableRight"><span class="styleBoldOne"><%=refdet[12]%></span></th>
          </tr>
		  <tr> 
            <td class="tableLeft">Approved Amount: </td>
            <th class="tableRight"><span class="styleBoldOne">$<%=appamt%></span></th>
          </tr>
            <%
			Double d=new Double(bal);
			//Double e=new Double();
			double e=d.parseDouble(bal);

			//String[] balsplit=bal.split(".");
			System.out.println(e);
           // String stat=(String)request.getAttribute("balanceStatus");
			if(approval_status.equalsIgnoreCase("Approved")){
			%>
          <tr> 
            <td class="tableLeft">&nbsp;</td>
            <td class="tableRight"><input type="button" value="Back" class="gradBtn" onclick="location.href='./UsrRefundReqListAction.do'"/></td>
          </tr>
			<%}
			else if(refdet[12].equalsIgnoreCase("Approved") && e!=0.0)
            {%>
          <tr> 
            <td class="tableLeft">&nbsp;</td>
            <td class="tableRight"><input type="submit" value="Apply request" class="gradBtn" /></td>
          </tr>
		  <%}
		  else{%>
           <tr> 
            <td class="tableLeft">&nbsp;</td>
            <td class="tableRight"><input type="button" value="Back" class="gradBtn" onclick="location.href'./UsrRefundReqListAction.do'" /></td>
          </tr>
          <%}%>
        </table>
			
		</form>
	</td>
  </tr>
  
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