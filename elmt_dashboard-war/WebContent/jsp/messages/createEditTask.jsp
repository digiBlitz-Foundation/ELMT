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
    Document   : createEditTask.jsp
    Created on : Dec 23, 2008
    Author     : Rupinder
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title><%=(String)session.getAttribute("title")%></title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <script src="javascripts/basic.js" type="text/javascript" ></script>
        <script src="javascripts/calendar2.js" type="text/javascript"></script>
        <!--<link href="css/core-ie.css" type="text/css" rel="stylesheet" />-->
        <script language="javascript">
            
            function validate(){
                if(document.createEditTask.taskTitle.value=="" || document.createEditTask.taskTitle.value.indexOf(' ')==0){
                    alert("Enter the Task Title");
                    document.createEditTask.taskTitle.focus();
                    return false;
                }
                
                if(document.createEditTask.projectId.value=="na"){
                    alert("Select the Project");
                    document.createEditTask.projectId.focus();
                    return false;
                }
                
                if(document.createEditTask.taskDesc.value.length==0 || document.createEditTask.taskDesc.value.indexOf(' ')==0){
                    alert("Enter the Task Description");
                    document.createEditTask.taskDesc.focus();
                    return false;
                }
                
                if(document.createEditTask.assignTo.value=="na"){
                    alert("Please select the user to assign the task");
                    document.createEditTask.assignTo.focus();
                    return false;
                }
                
                
                
                if(document.createEditTask.dueDate.value=="" || document.createEditTask.dueDate.value.indexOf(' ')==0){
                    alert("Please select Due Date");
                    document.createEditTask.dueDate.focus();
                    return false;
                }
                
                return true;
            }
            
            
        </script>
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
                         <!--< %@ include file = "../../include/menu-messages-member.jsp" % >-->
                         <%@ include file = "../../include/menu-roles-leftmenu.jsp" %>
                         <!-- LEFT MENU ENDS HERE -->
                                
                            </td>
                            <td width="500" class="subDeptTablePad">
                                <!-- CONTENTS START HERE -->
                                <table width="70%" border="0" cellpadding="0" cellspacing="0" class="formLayout">
                                    <!-- <tr>
                                         <td colspan="2" class="tblMainHead"><strong>Create</strong> Project: <span class="styleBoldTwo">Compose a Message </span></td>
                                   </tr> -->
                                    <tr>
                                        <% if (request.getParameter("taskId") != null) {%>
                                        <td colspan="2" class="tblDescrp">
                                            <!--<img src="images/usea_logo.jpg" class="imgFloatLeft" /><br />-->
                                            <span class="msgHead">Edit A Task </span>
                                            <br /><br />
                                            Use the section below to edit a Task
                                            
                                        </td>
                                        <% } else {%>
                                        <td colspan="2" class="tblDescrp">
                                            <!--<img src="images/usea_logo.jpg" class="imgFloatLeft" /><br />-->
                                            <span class="msgHead">Create A Task </span>
                                            <br /><br />
                                            Use the section below to create a new Task
                                            
                                        </td>
                                        <% }%>
                                        
                                    </tr>
                                    <tr>
                                        <td>
                                            <form name="createEditTask" method="post" enctype="multipart/form-data" action="task.do" onsubmit="return validate();">
                                                <% if (request.getParameter("taskId") != null) {%>
                                                <input type="hidden" name="task" value="editTask" />
                                                <input type="hidden"  name="taskId" value=<%=(String) request.getParameter("taskId") %> /> 
                                                       <% } else {%>
                                                       <input type="hidden" name="task" value="createTask" />
                                                <% }%>
                                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInnerContainer" id="mainTbl">
                                                    
                                                    <tr>
                                                        <td height="25" >
                                                            
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="1" id="inboxTbl">
                                                                
                                                                <!--
                                                                                   <tr class="tblMainHead">
                                                                                         <td height="25" colspan="2" class="textCommon">&nbsp;
                                                                                                 <a href="#" class="linkFour">Insert Address</a> |
                                                                                                 <a href="#" class="linkFour">Add Cc</a> | 
                                                                                                 <a href="#" class="linkFour">Add BCc</a>
                                                                                                 
                                                                                         </td>
                                                                                   </tr>
                                                                -->
                                                                <tr>
                                                                    <th width="25%" height="25" class="tblMainHead">Task Title:</th>
                                                                    <td width="81%" class="listCellBg">
                                                                        <input type="text" id="taskTitle" name="taskTitle" value='<%=request.getParameter("taskTitle") != null ? (String) request.getParameter("taskTitle") : "" %>' class="textboxOne"  size="45"/><span class="asterisk">*</span>
                                                                        
                                                                        <div id="statusId"></div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th height="25" class="tblMainHead"><span class="fonts">Project:</span></th>
                                                                    <td colspan="2" height="142" class="listCellBg">
                                                                    <select  name="projectId" class="selectboxOne" >
                                                                        <option value="na">--Select Project--</option>
                                                                        <%
            List projectsList = (List) request.getAttribute("projectsList");
            Iterator projectIterator = projectsList.iterator();
            HashMap projectMap = null;
            while (projectIterator.hasNext()) {
                projectMap = (HashMap) projectIterator.next();
                // Will be true if project Title is not null and blank, 
                // if it is null and blank, donot display blank values in the select box.
                if (projectMap.get("projectTitle") != null && !(projectMap.get("projectTitle").toString()).equals("")) {
                                                                        %>
                                                                        
                                                                        <option value="<%=projectMap.get("projectId")%>" <% if (request.getParameter("projectId") != null && request.getParameter("projectId").equals(projectMap.get("projectId"))) {
                                                                                    out.write("selected");
                                                                                }%> > <%=projectMap.get("projectTitle")%></option>
                                                                        <% }
            }%>
                                                                    </select><span class="asterisk">*</span>
                                                                </tr>
                                                                <tr>
                                                                    <th height="25" class="tblMainHead">Task Description:</th>
                                                                    <td height="25" class="listCellBg">
                                                                    <textarea  name="taskDesc" id="taskDesc"  rows="5"  cols="28" ><%=request.getParameter("taskDesc") != null ? (String) request.getParameter("taskDesc") : "" %></textarea><span class="asterisk">*</span> </td>
                                                                </tr>
                                                                <tr>
                                                                    <th height="25" class="tblMainHead"><span class="fonts">Assign To:</span></th>
                                                                    <td colspan="2" height="142" class="listCellBg">
                                                                    <select  name="assignTo" class="selectboxOne" >
                                                                        <option value="na">--Select User--</option>
                                                                        <%
            List usersList = (List) request.getAttribute("usersList");
            Iterator usersIterator = usersList.iterator();
            HashMap userMap = null;
            while (usersIterator.hasNext()) {
                userMap = (HashMap) usersIterator.next();
                // Will only be true if either the first name or last name is not null and blank. 
                // If both are null and blank, donot display blank values in the select box.
                if ((userMap.get("firstName") != null && !userMap.get("firstName").toString().equals("")) || (userMap.get("lastName") != null && !userMap.get("lastName").toString().equals(""))) {
                                                                        %>
                                                                        
                                                                        <option value="<%=userMap.get("userId")%>" <% if (request.getParameter("userId") != null && request.getParameter("userId").equals(userMap.get("userId"))) {
                                                                                    out.write("selected");
                                                                                }%> ><%=userMap.get("firstName") != null ? userMap.get("firstName") : ""%> <%=userMap.get("lastName") != null ? userMap.get("lastName") : ""%> </option>
                                                                        <% }
            }%>
                                                                    </select><span class="asterisk">*</span>
                                                                </tr>
                                                                <tr>
                                                                    <th height="25" class="tblMainHead"><span class="fonts">Due Date:</span></th><td height="25" class="listCellBg">
                                                                    <input type="text"  name="dueDate"  value='<%=request.getParameter("dueDate") != null ? (String) request.getParameter("dueDate") : "" %>' class="textboxOne" size="25" readonly="true" /><a href="javascript:cal.popup();"><img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0" /></a><span class="asterisk">*</span>
                                                                </tr>
                                                                
                                                                
                                                                <tr>
                                                                    <th height="25" class="tblMainHead"><span class="fonts">Task Status:</span></th>
                                                                    <td colspan="2" height="142" class="listCellBg">
                                                                    <select  name="taskStatus" class="selectboxOne" >
                                                                        <option  value="Pending" <%
            // In case if request is for of Editing of Task. 
            if (request.getParameter("taskStatus") != null && request.getParameter("taskStatus").equals("Pending")) {
                out.println("selected");
            }%> 
                                                                                 >Pending</option>
                                                                        <option value="Current" <%
            // In case if request is for of Editing of Task. 
            if (request.getParameter("taskStatus") != null && request.getParameter("taskStatus").equals("Current")) {
                out.println("selected");
            }%> 
                                                                                >Current</option>
                                                                        <option value="Completed" <%
            // In case if request is for of Editing of Task. 
            if (request.getParameter("taskStatus") != null && request.getParameter("taskStatus").equals("Completed")) {
                out.println("selected");
            }%>
                                                                                >Completed</option>
                                                                    </select>
                                                                </tr>
                                                                <tr>
                                                                    <th height="25" class="tblMainHead"><span class="fonts">Task Priority:</span></th>
                                                                    <td colspan="2" height="142" class="listCellBg">
                                                                    <select  name="taskPriority" class="selectboxOne" >
                                                                        <option  value="Low" <%
            // In case if request is for of Editing of Task.                                                                 
            if (request.getParameter("taskPriority") != null && request.getParameter("taskPriority").equals("Low")) {
                out.println("selected");
            }
                                                                                 %> >Low</option>
                                                                        <option value="Medium" <%
            // In case of New Task, set "Medium" value as default
            if (request.getParameter("taskPriority") == null) {
                out.write("selected");
            // In case if request is for of Editing of Task.     
            } else if (request.getParameter("taskPriority") != null && request.getParameter("taskPriority").equals("Medium")) {
                out.println("selected");
            }
                                                                                %>
                                                                                >Medium</option>
                                                                        <option value="High" <%
            // In case if request is for of Editing of Task.
            if (request.getParameter("taskPriority") != null && request.getParameter("taskPriority").equals("High")) {
                out.println("selected");
            }%>
                                                                                >High</option>
                                                                    </select>
                                                                </tr>
                                                                <tr>
                                                                    <th height="25" class="tblMainHead"><span class="fonts">Attachment:</span></th>
                                                                    <td height="25" class="listCellBg">
                                                                        <input type="file" name="attachment" class="textboxOne" /> 
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" class="tblRowHead">
                                                                        
                                                                        <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0" id="tableHead">
                                                                            <tr>
                                                                                <td width="11%"  >
                                                                                    <% if (request.getParameter("projectId") != null) {%>
                                                                                    <input type="submit" name="Update" value="Update" class="gradTwoBtn" />
                                                                                    <% } else {%>
                                                                                    <input type="submit" name="Submit" value="Send" class="gradTwoBtn" />
                                                                                    <% } %>
                                                                                </td>
                                                                                
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="20">&nbsp; <!-- DO NOT DELETE THIS ROW --></td>
                                                    </tr>
                                                </table>
                                                
                                                
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
                         <%@ include file = "../../include/footer.jsp" %>
                    <!-- FOOTER ENDS HERE -->
                </td>
            </tr>
        </table>
    </body>
</html>
<script language="javascript">
    
    var cal = new calendar2(document.forms['createEditTask'].elements['dueDate']);
    cal.year_scroll = true;
    cal.time_comp = false;
    
    </script>