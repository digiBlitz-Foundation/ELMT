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
<%-- 
    Document   : createEventReports
    Created on : Aug 3, 2009, 3:41:26 PM
    Author     : parteek
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Integrated Enterprise Dashboard</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <script src="javascripts/basic.js" type="text/javascript" ></script>
        <script src="javascripts/calendar2.js" type="text/javascript"></script>
        <!--<link href="css/core-ie.css" type="text/css" rel="stylesheet" />-->
        <script language="javascript">
            function validate(type){
                var flag=true;
                if(document.generateEventsReport.fromDate.value==""){
                    alert("Select From Date");
                    document.generateEventsReport.fromDate.focus();
                    flag=false;
                    return flag;
                }
                
                if(document.generateEventsReport.toDate.value==""){
                    alert("Select To Date");
                    document.generateEventsReport.toDate.focus();
                    flag=false;
                    return flag;
                }
                
                if(flag)
                    {
                        popUp_report(type);  
                    }
                }  
                function popUp_report(type){
                    var val =null; var status=null;var membership=null;var area=null;var donation=null,event_type_id=null;
                    var fromDate =document.getElementById("fromDate").value;
                    var toDate =document.getElementById("toDate").value;
                    if(type=='eventsYearWise')
                        {
                            val=  window.open("eventReportsGeneration.do?process=eventsYearWise&fromDate="+fromDate+"&toDate="+toDate
                                ,'EventReports',
                                'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
                        }
                        if(type=='eventsAreaWise')
                            {
                                val=  window.open("eventReportsGeneration.do?process=eventsAreaWise&fromDate="+fromDate+"&toDate="+toDate
                                    ,'EventReports',
                                    'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
                                
                            }  
                            if(type=='eventsTypeWise')
                                {
                                    val=  window.open("eventReportsGeneration.do?process=eventsTypeWise&fromDate="+fromDate+"&toDate="+toDate
                                        ,'EventReports',
                                        'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
                                    
                                } 
                                if(type=='eventsAreaWiseForEventType')
                                    {
                                        event_type_id=document.getElementById("eventType").value;
                                        val=  window.open("eventReportsGeneration.do?process=eventsAreaWiseForEventType&fromDate="+fromDate+"&toDate="+toDate+"&eventType="+event_type_id
                                            ,'EventReports',
                                            'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
                                        
                                    } 
                                    if(type=='humanMembersParticipatedInEvents')
                                        {
                                            val=  window.open("eventReportsGeneration.do?process=humanMembersParticipatedInEvents&fromDate="+fromDate+"&toDate="+toDate
                                                ,'EventReports',
                                                'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
                                            
                                        }
                                        if(type=='humanMembersParticipatedForAllHumanMemberships')
                                            {
                                                val=  window.open("eventReportsGeneration.do?process=humanMembersParticipatedForAllHumanMemberships&fromDate="+fromDate+"&toDate="+toDate
                                                    ,'EventReports',
                                                    'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')    
                                                
                                            }
                                            if(type=='getHumanMembersParticipatedEventTypeWise')
                                                {
                                                    val=  window.open("eventReportsGeneration.do?process=getHumanMembersParticipatedEventTypeWise&fromDate="+fromDate+"&toDate="+toDate
                                                        ,'EventReports',
                                                        'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')    
                                                    
                                                } 
                                                if(type=='getHumanMembersParticipatedAreaWise')
                                                    {
                                                        val=  window.open("eventReportsGeneration.do?process=getHumanMembersParticipatedAreaWise&fromDate="+fromDate+"&toDate="+toDate
                                                            ,'EventReports',
                                                            'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')    
                                                    } 
                                                    
                                                    if(type=='getHumanMembersParticipatedBasedOnMembTypeAreaWise')
                                                        {
                                                            area=document.getElementById("area").value; 
                                                            val=  window.open("eventReportsGeneration.do?process=getHumanMembersParticipatedBasedOnMembTypeAreaWise&fromDate="+fromDate+"&toDate="+toDate+"&area="+area
                                                                ,'EventReports',
                                                                'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')    
                                                            
                                                        } 
                                                        
                                                        
                                                        if(val == null) {
                                                            alert("Please Enable Site Popup Allowed");
                                                        }
                                                        
                                                        
                                                    }
                                                    
                                                    
        </script>
    </head>
    <body>
        <table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab">
            <tr>
                <td class="alignTop">
                    <!-- HEADER STARTS HERE -->
               <%@ include file = "/../include/header.jsp" %>
                    <!-- HEADER ENDS HERE -->
                </td>
            </tr>
            <tr>
                <td class="infoBar">
                    <!-- INFO BAR STARTS HERE -->
                 <%@ include file = "/../include/infobar.jsp" %>
                    <!-- INFO BAR ENDS HERE -->	
                </td>
            </tr>
            <tr>
                <td class="tableCommonBg">
                    
                    <table width="760" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
                        
                        <tr>
                            <td width="230" class="menuTablePad">
                                <!-- LEFT MENU STARTS HERE -->
                         <!--< %@ include file = "../../include/menu-messages-member.jsp" % >-->
                         <%@ include file = "/../include/menu-roles-leftmenu.jsp" %>
                         <!-- LEFT MENU ENDS HERE -->
                                
                            </td>
                            <td width="500" class="subDeptTablePad">
                                <!-- CONTENTS START HERE -->
                                <table width="70%" border="0" cellpadding="0" cellspacing="0" class="formLayout">
                                    <!-- <tr>
                                         <td colspan="2" class="tblMainHead"><strong>Create</strong> Project: <span class="styleBoldTwo">Compose a Message </span></td>
                                   </tr> -->
                                    <tr>
                                        
                                        <td colspan="2" class="tblDescrp">
                                            <!--<img src="images/usea_logo.jpg" class="imgFloatLeft" /><br />--><br />
                                            <br />
                                            <%  if (request.getParameter("type").equalsIgnoreCase("eventsYearWise")) {%>
                                            Number Of Events Conducted Year Wise   
                                            <%  } else if (request.getParameter("type").equalsIgnoreCase("eventsAreaWise")) {%>
                                            Number of Events Conducted Area Wise
                                            <% } else if (request.getParameter("type").equalsIgnoreCase("eventsTypeWise")) {%>
                                            Number of Events Conducted Event Type Wise 
                                            <% } else if (request.getParameter("type").equalsIgnoreCase("eventsAreaWiseForEventType")) {%>
                                            Number of Events Conducted Area Wise For Specific Event Type
                                            <% } else if (request.getParameter("type").equalsIgnoreCase("humanMembersParticipatedInEvents")) {%>
                                            Number of Human Members Participated in Event Competitions
                                            <% } else if (request.getParameter("type").equalsIgnoreCase("humanMembersParticipatedForAllHumanMemberships")) {%>
                                            Number of Human Members Participated in Event Competitions based on All Human MemberShips
                                            <% } else if (request.getParameter("type").equalsIgnoreCase("getHumanMembersParticipatedEventTypeWise")) {%>
                                            Number of Human Members Participated in Event Competitions based on Event Types
                                            <%} else if (request.getParameter("type").equalsIgnoreCase("getHumanMembersParticipatedAreaWise")) {%>
                                            Number of Human Members Participated in Event Competitions based on Area wises
                                            <%} else if (request.getParameter("type").equalsIgnoreCase("getHumanMembersParticipatedBasedOnMembTypeAreaWise")) {%>
                                            Number Of Human Mambers participated in the Event competitions Based on All Human Memebership Types and Area Wise 
                                            <% }%>
                                        </td>
                                        
                                        
                                    </tr>
                                    <tr>
                                        <td>
                                            
                                            <form   name="generateEventsReport" method="post"    onsubmit="return validate('<%=(String) request.getParameter("type") %>')">
                                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInnerContainer" id="mainTbl">
                                                    
                                                    <tr>
                                                        <td height="25" >
                                                            
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="1" id="inboxTbl">
                                                                <tr> 
                                                                    <td class="tableLeft">From Date: </td>
                                                                    <td class="tableRight"><input type="text" name="fromDate" id="fromDate" class="textboxOne" size="25" readonly="true"/><a href="javascript:cal1.popup();"><img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a><span class="asterisk">*</span></td>
                                                                </tr>
                                                                <tr> 
                                                                    <td class="tableLeft">To date: </td>
                                                                    <td class="tableRight"><input type="text" name="toDate" id="toDate" class="textboxOne" size="25" readonly="true"/><a href="javascript:cal2.popup();"><img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a><span class="asterisk">*</span></td>
                                                                </tr>
                                                                <% if (request.getParameter("type").equalsIgnoreCase("eventsAreaWiseForEventType")) {%>
                                                                <tr> 
                                                                <tr> 
                                                                    <td class="tableLeft">Event Types: </td>
                                                                    <td class="tableRight"><select  name="eventType" id="eventType">
                                                                            <option value="b2b77c0b-ffe0-484b-9d77-1e4ebe3d7517">YEH</option>
                                                                            <option value="2833a332-3af3-4d98-b8fc-46263448385d">TEST</option>
                                                                            <option value="90afd446-d139-44c5-8f37-4eec8358eb1e">HT</option>
                                                                            <option value="445c7c02-49fe-402f-a1cf-ac1fb3e51d77">3D</option>
                                                                            <option value="6845ba45-ab6c-48c3-964c-b3c7a6571513">CT</option>
                                                                            <option value="1eb79456-e38e-4e04-b67d-b7296c5ce64b">FEH</option>
                                                                            <option value="ac6e6d2a-c80a-4fce-8fa0-d02d087fb118">2D</option>
                                                                        </select>
                                                                    <span class="asterisk">*</span> </td>
                                                                </tr>
                                                                <% }%>
                                                                <% if (request.getParameter("type").equalsIgnoreCase("getHumanMembersParticipatedBasedOnMembTypeAreaWise")) {%>                          
                                                                <tr> 
                                                                    <td class="tableLeft">Area: </td>
                                                                    <td class="tableRight"><select  name="area" id="area">
                                                                            <option value="09133F6D-48B0-4F07-846D-B44599A7D570">Area I</option>
                                                                            <option value="440AC928-187D-4F6E-ADB7-4B2435B22104">Area II</option>
                                                                            <option value="FD39E89E-7806-4332-A7D1-09736886E194">Area III</option>
                                                                            <option value="A41186F2-717A-4042-89BA-90AE4160A1F7">Area IV</option>
                                                                            <option value="F627A4EA-FD66-4419-AC4E-AF9CAEF2F587">Area V</option>
                                                                            <option value="FCEFCF4F-DB92-42F8-B005-B4C7F2650EC6">Area VI</option>
                                                                            <option value="D12543D7-CB00-43BA-87F5-594CD6E32BD5">Area VII</option>
                                                                            <option value="C830B545-6ADB-4260-9AD1-DD36F663ED4B">Area VIII</option>
                                                                            <option value="C9DB9ED2-C5D6-4671-8B44-87D34C72251C">Area IX</option>
                                                                            <option value="33E1594B-E12A-4652-9279-B85A741D4D05">Area X</option>
                                                                        </select>
                                                                    <span class="asterisk">*</span> </td>
                                                                </tr>
                                                                
                                                                <%} %>
                                                                <tr>
                                                                    <th height="25" class="tblMainHead">&nbsp;</th>
                                                                    <td  height="25" class="listCellBg">
                                                                </tr>
                                                                <tr>
                                                                    <th height="25" class="tblMainHead">&nbsp;</th>
                                                                    <td colspan="2" height="142" class="listCellBg">
                                                                </tr>
                                                                
                                                                <tr>
                                                                    <td colspan="2" class="tblRowHead">
                                                                        
                                                                        <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0" id="tableHead">
                                                                            <tr>
                                                                                <td width="11%"  >
                                                                                    
                                                                                    <input type="submit" name="Submit" value="Submit" class="gradTwoBtn" />
                                                                                    
                                                                                    
                                                                                </td>
                                                                            </tr>
                                                                    </table>                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="20">&nbsp; <!-- DO NOT DELETE THIS ROW --></td>
                                                    </tr>
                                                </table>
                                                <input type="hidden" name="message" value="xlsToGraph" />
                                                
                                            </form>
                                            
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
                         <%@ include file = "/../include/footer.jsp" %>
                    <!-- FOOTER ENDS HERE -->
                </td>
            </tr>
        </table>
    </body>
</html>
<script language="javascript">
    var cal1 = new calendar2(document.forms['generateEventsReport'].elements['fromDate']);
    cal1.year_scroll = true;
    cal1.time_comp = false;
    
    var cal2 = new calendar2(document.forms['generateEventsReport'].elements['toDate']);
    cal2.year_scroll = true;
    cal2.time_comp = false;
    </script>
