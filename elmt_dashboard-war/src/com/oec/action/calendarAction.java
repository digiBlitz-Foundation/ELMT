/*******************************************************************************
 * * * Copyright: 2019 digiBlitz Foundation
 *  * * 
 *  * * License: digiBlitz Public License 1.0 (DPL) 
 *  * * Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
 *  * * 
 *  * * Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
 *  * * 
 *  * * Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
 *  * * 
 *  * * "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
 ******************************************************************************/
/*
 * calendarAction.java
 *
 * Created on October 29, 2007, 1:41 PM
 */
package com.oec.action;

//import bsh.Remote;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemote;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemoteHome;
import java.io.*;
import java.net.*;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Vector;
import javax.servlet.*;
import javax.servlet.http.*;
import com.hlcaccounts.util.Debug;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.naming.Context;
import javax.naming.InitialContext;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.util.MessageResources;
import com.hlcmeeting.session.*;
import org.apache.struts.actions.DispatchAction;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemote;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemoteHome;
import com.hlcutil.HLCCalendarVO;
import com.hlcutil.HLCEventRequestVO;
import com.hlcutil.HLCMemberVO;
import com.util.*;
import java.util.regex.Pattern;
import java.sql.*;
import java.math.*;
import java.util.Calendar;



/**
 *
 * @author Dhivya
 * @version
 */
public class calendarAction extends DispatchAction {

    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.close();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
    public ActionForward initCreate(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        return mapping.findForward("frmAddCalDetails");
    }

    public ActionForward insert(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HLCKrishnaStatelessRemote remote = initializeEJB(request);
        String calenderYear = request.getParameter("year");

        int compYear = 0;
        if (calenderYear != null && calenderYear.trim().length() != 0) {
            compYear = Integer.parseInt(calenderYear);
        }
        int presentYear = compYear - 1;

        if (calenderYear != null && calenderYear.trim().length() != 0) {
            boolean result = remote.calenderDetailsExist(calenderYear);
            if (result == true) {
                request.setAttribute("err", "st");
                return mapping.findForward("frmAddCalDetails");
            } else {
                ArrayList eventList = new ArrayList();
                ArrayList eventDet = new ArrayList();
                eventList = remote.getEventDetails(presentYear);
                if (eventList != null) {
                    if (eventList.size() != 0) {
                        Iterator itr = eventList.iterator();
                        int count = 1;
                        int maxEventId = remote.getMaxEventId();
                        int tempEve = 1 + maxEventId;
                        while (itr.hasNext()) {
                            HLCCalendarVO objCalVO = (HLCCalendarVO) itr.next();
                            String old_eventId = objCalVO.getEventId();
                            //int event_int_Id = Integer.parseInt(old_eventId);
                            // creating unique event id
                            //int event_int_newId = event_int_Id + remote.getMaxEventId();
                            int event_int_newId = 0;
                            Debug.print("count value:::::" + count);
                            if (count == 1) {
                                event_int_newId = count + maxEventId;
                                Debug.print("event_int_newId after count 1" + event_int_newId);
                            }
                            if (count > 1) {
                                event_int_newId = (count - 1) + tempEve;
                                Debug.print("event_int_newId after count >1" + event_int_newId);
                            }
                            //Debug.print("tempEve value:::::" + tempEve);                          
                            String new_EventId = Integer.toString(event_int_newId);
                            String orgId = objCalVO.getOrganizerId();
                            String eventTit = objCalVO.getEventTitle();
                            Date beginDat = objCalVO.getBeginDate();
                            Date endDat = objCalVO.getEndDate();
                            String areaId = objCalVO.getAreaId();
                            String stateId = objCalVO.getStateId();
                            int Year = objCalVO.getCompYear();

                            eventDet = remote.getEventDetailsBasedOnEventId(old_eventId);
                            Debug.print("eventDet size in CalendarAction 11111111 " + eventDet.size());
                            String eventLevelNames = "";
                            String eventTypeId = "";
                            String eventLevelId = "";
                            String eventTypeNames = "";
                            ArrayList hm = new ArrayList();
                            if (eventDet != null) {
                                if (eventDet.size() != 0) {
                                    Iterator itr1 = eventDet.iterator();
                                    int i = 0;
                                    int j = 0;

                                    while (itr1.hasNext()) {
                                        HLCCalendarVO objCalVO1 = (HLCCalendarVO) itr1.next();
                                        String evId = objCalVO1.getEventId();
                                        eventTypeId = objCalVO1.getEventTypeId();
                                        eventLevelId = objCalVO1.getEventLevelId();
                                        String eventLevel = objCalVO1.getEventLevel();
                                        String eventType = objCalVO1.getEventTypeNames();
                                        if (i == 0) {
                                            eventLevelNames = objCalVO1.getEventLevel();
                                        } else {
                                            eventLevelNames = eventLevelNames + "," + objCalVO1.getEventLevel();
                                        }
                                        if (!hm.contains(objCalVO1.getEventTypeNames())) {
                                            hm.add(objCalVO1.getEventTypeNames());
                                        }
                                        i++;
                                        j++;
                                    }
                                    Iterator itrType = hm.iterator();
                                    while (itrType.hasNext()) {
                                        String eventTypeStr = (String) itrType.next();
                                        eventTypeNames = eventTypeStr + "," + eventTypeNames;
                                    }
                                    eventTypeNames = eventTypeNames.substring(0, eventTypeNames.length() - 1);
                                }
                            }
                            //int Year1=2009;
                            Debug.print("eventTit before insert&&&&& " + eventTit);
                            if (old_eventId != null && old_eventId.trim().length() != 0 && orgId != null && orgId.trim().length() != 0 && eventTit != null && eventTit.trim().length() != 0 && beginDat != null && endDat != null && areaId != null && areaId.trim().length() != 0 && stateId != null && stateId.trim().length() != 0 && Year != 0 && eventTypeNames != null && eventTypeNames.trim().length() != 0 && eventLevelNames != null && eventLevelNames.trim().length() != 0) {
                                boolean output = remote.insertCalenderDetails(new_EventId, orgId, eventTit, beginDat, endDat, areaId, stateId, Year, eventTypeNames, eventLevelNames, old_eventId);

                            }
                            //String output=remote.insertCalenderDetails(eventId,orgId,eventTit,beginDat,endDat,areaId,stateId,Year,eventTypeNames,eventLevelNames);

                            if (eventDet != null) {
                                Debug.print("eventDet size in CalendarAction 222222 " + eventDet.size());
                                if (eventDet.size() != 0) {
                                    Iterator itr1 = eventDet.iterator();
                                    while (itr1.hasNext()) {
                                        HLCCalendarVO objCalVO1 = (HLCCalendarVO) itr1.next();
                                        String evId = objCalVO1.getEventId();
                                        //String proCalId =remote.getProvCalId(evId,compYear);
                                        String proCalId = remote.getProvCalId(new_EventId, compYear);
                                        Debug.print("compYear in championship " + compYear);
                                        Debug.print("proCalId in championship " + proCalId);
                                        eventTypeId = objCalVO1.getEventTypeId();
                                        eventLevelId = objCalVO1.getEventLevelId();
                                        String eventLevel = objCalVO1.getEventLevel();
                                        eventLevelNames = eventLevelNames + "," + objCalVO1.getEventLevel();
                                        if (proCalId != null && proCalId.trim().length() != 0 && new_EventId != null && new_EventId.trim().length() != 0 &&
                                                eventTypeId != null && eventTypeId.trim().length() != 0 && eventLevelId != null && eventLevelId.trim().length() != 0) {
                                            boolean champEventDet = remote.insertChampionshipDetails(proCalId, new_EventId, eventTypeId, eventLevelId);
                                        }
                                    //String champEventDet=remote.insertChampionshipDetails(proCalId,eventId,eventTypeId,eventLevelId);
                                    }
                                }
                            }
                            count++;
                        }
                    }
                }
                ArrayList proCalList = new ArrayList();
                proCalList = remote.getProvCalIdBasedOnYear(calenderYear);
                int pro = proCalList.size();
                int eve = eventList.size();
                Debug.print("pro size" + pro);
                Debug.print("eve size" + eve);
                if (proCalList != null) {
                    if (pro != eve) {
                        Iterator it = proCalList.iterator();
                        while (it.hasNext()) {
                            String sr[] = (String[]) it.next();
                            String calId = sr[0];
                            Debug.print("calId in while loop : " + calId);
                            boolean deleteResult = remote.deleteCalendarDetails(calId);
                            Debug.print("Successfully deleted in provisional calendar and championship table" + deleteResult);
                        }
                        request.setAttribute("insertStatus", "failed");
                        return mapping.findForward("frmCalDetailsSuccess");

                    } else {
                        request.setAttribute("insertStatus", "success");
                        return mapping.findForward("frmCalDetailsSuccess");
                    }
                }
                Debug.print("proCalList is null");
                request.setAttribute("insertStatus", "failed");
                return mapping.findForward("frmCalDetailsSuccess");
            }
        }
        return null;
    }

    public ActionForward initUpdate(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HLCKrishnaStatelessRemote remote = initializeEJB(request);
        String provisionalId = request.getParameter("provisionalId");
        HLCCalendarVO calVO = new HLCCalendarVO();

        if (provisionalId != null && provisionalId.trim().length() != 0) {
            calVO = remote.getSingleEventDetails(provisionalId);
        }
        request.setAttribute("singleEventDetails", calVO);

        ArrayList allEventDetails = new ArrayList();
        allEventDetails = remote.getAllEventLevels();
        request.setAttribute("allEventDetails", allEventDetails);

        ArrayList selectedEventDetails = new ArrayList();
        selectedEventDetails = remote.getSelectedEventLevels(provisionalId);
        request.setAttribute("selectedEventDetails", selectedEventDetails);

        ArrayList divisionDetails = new ArrayList();
        divisionDetails = remote.getEventDivision();
        Debug.print("divisionDetails in initUpdate: " + divisionDetails);
        Debug.print("divisionDetails in initUpdate: " + divisionDetails.size());
        request.setAttribute("divisionDetails", divisionDetails);

        ArrayList selectAreaDetails = new ArrayList();
        selectAreaDetails = remote.getAllAreaMasters();
        request.setAttribute("selectAreaDetails", selectAreaDetails);

        ArrayList selectStateDetails = new ArrayList();
        selectStateDetails = remote.getAllStateMasters();
        request.setAttribute("selectStateDetails", selectStateDetails);

        ArrayList selectDivisionDetails = new ArrayList();
        selectDivisionDetails = remote.getselectDivisionDetails(provisionalId);
        Debug.print("selectDivisionDetails in initUpdate: " + selectDivisionDetails);
        request.setAttribute("selectDivisionDetails", selectDivisionDetails);

        Vector allTypesVect = new Vector();
        allTypesVect = remote.getAllMapTyLe();

        Date startDate = calVO.getBeginDate();

        Date entryStDate = calVO.getEntryStrtDate();

        System.out.println("startDate....:" + startDate);
        System.out.println("entryStDate....:" + entryStDate);

        if (entryStDate == null) {
            System.out.println("In the subtract Operation");
            String DATE_FORMAT = "MM/dd/yyyy";
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(DATE_FORMAT);
            Calendar c1 = Calendar.getInstance();
            int date = startDate.getDate();
            int month = startDate.getMonth();
            int year = startDate.getYear();
            year = year + 1900;
            c1.set(year, month, date); //(year,month,date)
            int day = c1.get(Calendar.DAY_OF_WEEK);

            System.out.println("day : " + day);
            if (day == 1) {
                c1.add(Calendar.DATE, -47);
            } else if (day == 2) {
                c1.add(Calendar.DATE, -41);
            } else if (day == 3) {
                c1.add(Calendar.DATE, -42);
            } else if (day == 4) {
                c1.add(Calendar.DATE, -43);
            } else if (day == 5) {
                c1.add(Calendar.DATE, -44);
            } else if (day == 6) {
                c1.add(Calendar.DATE, -45);
            } else if (day == 7) {
                c1.add(Calendar.DATE, -46);
            }
            System.out.println("Date after subtraction is : " +
                    sdf.format(c1.getTime()));

            //SimpleDateFormat df=new SimpleDateFormat("MM/dd/yyyy");
            Date endDate = c1.getTime();
            Calendar c2 = Calendar.getInstance();
            int date1 = endDate.getDate();
            int month1 = endDate.getMonth();
            int year1 = endDate.getYear();
            year1 = year1 + 1900;
            c2.set(year1, month1, date1); //(year,month,date)
            c2.add(Calendar.DATE, 28);

            request.setAttribute("entryBeginDate", sdf.format(c1.getTime()));
            request.setAttribute("entryEndDate", sdf.format(c2.getTime()));
        } else {
            request.setAttribute("entryBeginDate", null);
            request.setAttribute("entryEndDate", null);
        }
        request.setAttribute("allTypesVect", allTypesVect);
        request.setAttribute("orgList", "orgList");

        return mapping.findForward("frmOnlineEventDetailsEdit");
    }

    public ActionForward initStaffUpdate(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HLCKrishnaStatelessRemote remote = initializeEJB(request);
        String provisionalId = request.getParameter("provisionalId");

        String eventId = request.getParameter("eveId");

        HLCCalendarVO calVO = new HLCCalendarVO();
        if (provisionalId != null && provisionalId.trim().length() != 0) {
            calVO = remote.getSingleEventDetails(provisionalId);
        }
        request.setAttribute("singleEventDetails", calVO);

        ArrayList allEventDetails = new ArrayList();
        allEventDetails = remote.getAllEventLevels();
        request.setAttribute("allEventDetails", allEventDetails);

        ArrayList selectedEventDetails = new ArrayList();
        selectedEventDetails = remote.getSelectedEventLevels(provisionalId);
        request.setAttribute("selectedEventDetails", selectedEventDetails);

        ArrayList divisionDetails = new ArrayList();
        divisionDetails = remote.getEventDivision();
        Debug.print("divisionDetails in initAreaChairUpdate: " + divisionDetails);
        Debug.print("divisionDetails in initAreaChairUpdate: " + divisionDetails.size());
        request.setAttribute("divisionDetails", divisionDetails);

        ArrayList selectAreaDetails = new ArrayList();
        selectAreaDetails = remote.getAllAreaMasters();
        request.setAttribute("selectAreaDetails", selectAreaDetails);

        ArrayList selectStateDetails = new ArrayList();
        selectStateDetails = remote.getAllStateMasters();
        request.setAttribute("selectStateDetails", selectStateDetails);

        ArrayList selectDivisionDetails = new ArrayList();
        selectDivisionDetails = remote.getselectDivisionDetails(provisionalId);
        Debug.print("selectDivisionDetails in initUpdate: " + selectDivisionDetails);
        request.setAttribute("selectDivisionDetails", selectDivisionDetails);


        boolean output1 = remote.eveDetailsExistsInEveTable(eventId);
        Debug.print("output1:" + output1);
        String eveSecreId = null;
        String LogName = "";
        if (output1 == true) {
            eveSecreId = remote.getEveSecretaryId(eventId);
            LogName = remote.getUserName(eveSecreId);
            request.setAttribute("eveSecreId", eveSecreId);
            request.setAttribute("LogName", LogName);
        } else {
            request.setAttribute("eveSecreId", eveSecreId);
            request.setAttribute("LogName", LogName);
        }
        ArrayList issueDetails = new ArrayList();
        issueDetails = remote.getAllIssues();
        Vector allTypesVect = new Vector();
        allTypesVect = remote.getAllMapTyLe();
        Date startDate = calVO.getBeginDate();
        Date entryStDate = calVO.getEntryStrtDate();

        System.out.println("startDate....:" + startDate);
        System.out.println("entryStDate....:" + entryStDate);

        if (entryStDate == null) {
            System.out.println("In the subtract Operation");

            String DATE_FORMAT = "MM/dd/yyyy";
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(DATE_FORMAT);
            Calendar c1 = Calendar.getInstance();
            int date = startDate.getDate();
            int month = startDate.getMonth();
            int year = startDate.getYear();
            year = year + 1900;
            c1.set(year, month, date); //(year,month,date)
            int day = c1.get(Calendar.DAY_OF_WEEK);
            System.out.println("day : " + day);
            if (day == 1) {
                c1.add(Calendar.DATE, -47);
            } else if (day == 2) {
                c1.add(Calendar.DATE, -41);
            } else if (day == 3) {
                c1.add(Calendar.DATE, -42);
            } else if (day == 4) {
                c1.add(Calendar.DATE, -43);
            } else if (day == 5) {
                c1.add(Calendar.DATE, -44);
            } else if (day == 6) {
                c1.add(Calendar.DATE, -45);
            } else if (day == 7) {
                c1.add(Calendar.DATE, -46);
            }
            System.out.println("Date after subtraction is : " +
                    sdf.format(c1.getTime()));

            //SimpleDateFormat df=new SimpleDateFormat("MM/dd/yyyy");
            Date endDate = c1.getTime();
            Calendar c2 = Calendar.getInstance();
            int date1 = endDate.getDate();
            int month1 = endDate.getMonth();
            int year1 = endDate.getYear();
            year1 = year1 + 1900;
            c2.set(year1, month1, date1); //(year,month,date)
            c2.add(Calendar.DATE, 28);
            request.setAttribute("entryBeginDate", sdf.format(c1.getTime()));
            request.setAttribute("entryEndDate", sdf.format(c2.getTime()));
        } else {
            request.setAttribute("entryBeginDate", null);
            request.setAttribute("entryEndDate", null);
        }

        request.setAttribute("allTypesVect", allTypesVect);
        request.setAttribute("staffList", "staffList");
        request.setAttribute("issueDetails", issueDetails);

        return mapping.findForward("frmOECStaffEdit");
    }

    public ActionForward initAreaChairUpdate(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HLCKrishnaStatelessRemote remote = initializeEJB(request);
        String provisionalId = request.getParameter("provisionalId");
        HLCCalendarVO calVO = new HLCCalendarVO();
        if (provisionalId != null && provisionalId.trim().length() != 0) {
            calVO = remote.getSingleEventDetails(provisionalId);
        }
        request.setAttribute("singleEventDetails", calVO);

        ArrayList allEventDetails = new ArrayList();
        allEventDetails = remote.getAllEventLevels();
        request.setAttribute("allEventDetails", allEventDetails);

        ArrayList selectedEventDetails = new ArrayList();
        selectedEventDetails = remote.getSelectedEventLevels(provisionalId);
        request.setAttribute("selectedEventDetails", selectedEventDetails);

        ArrayList divisionDetails = new ArrayList();
        divisionDetails = remote.getEventDivision();
        Debug.print("divisionDetails in initAreaChairUpdate: " + divisionDetails);
        Debug.print("divisionDetails in initAreaChairUpdate: " + divisionDetails.size());
        request.setAttribute("divisionDetails", divisionDetails);

        ArrayList selectAreaDetails = new ArrayList();
        selectAreaDetails = remote.getAllAreaMasters();
        request.setAttribute("selectAreaDetails", selectAreaDetails);

        ArrayList selectStateDetails = new ArrayList();
        selectStateDetails = remote.getAllStateMasters();
        request.setAttribute("selectStateDetails", selectStateDetails);

        ArrayList selectDivisionDetails = new ArrayList();
        selectDivisionDetails = remote.getselectDivisionDetails(provisionalId);
        Debug.print("selectDivisionDetails in initUpdate: " + selectDivisionDetails);
        request.setAttribute("selectDivisionDetails", selectDivisionDetails);

        Vector allTypesVect = new Vector();
        allTypesVect = remote.getAllMapTyLe();
        Date startDate = calVO.getBeginDate();
        Date entryStDate = calVO.getEntryStrtDate();

        System.out.println("startDate....:" + startDate);
        System.out.println("entryStDate....:" + entryStDate);

        if (entryStDate == null) {
            System.out.println("In the subtract Operation");

            String DATE_FORMAT = "MM/dd/yyyy";
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(DATE_FORMAT);
            Calendar c1 = Calendar.getInstance();
            int date = startDate.getDate();
            int month = startDate.getMonth();
            int year = startDate.getYear();
            year = year + 1900;
            c1.set(year, month, date); //(year,month,date)
            int day = c1.get(Calendar.DAY_OF_WEEK);
            System.out.println("day : " + day);
            if (day == 1) {
                c1.add(Calendar.DATE, -47);
            } else if (day == 2) {
                c1.add(Calendar.DATE, -41);
            } else if (day == 3) {
                c1.add(Calendar.DATE, -42);
            } else if (day == 4) {
                c1.add(Calendar.DATE, -43);
            } else if (day == 5) {
                c1.add(Calendar.DATE, -44);
            } else if (day == 6) {
                c1.add(Calendar.DATE, -45);
            } else if (day == 7) {
                c1.add(Calendar.DATE, -46);
            }
            System.out.println("Date after subtraction is : " +
                    sdf.format(c1.getTime()));

            //SimpleDateFormat df=new SimpleDateFormat("MM/dd/yyyy");
            Date endDate = c1.getTime();
            Calendar c2 = Calendar.getInstance();
            int date1 = endDate.getDate();
            int month1 = endDate.getMonth();
            int year1 = endDate.getYear();
            year1 = year1 + 1900;
            c2.set(year1, month1, date1); //(year,month,date)
            c2.add(Calendar.DATE, 28);
            request.setAttribute("entryBeginDate", sdf.format(c1.getTime()));
            request.setAttribute("entryEndDate", sdf.format(c2.getTime()));
        } else {
            request.setAttribute("entryBeginDate", null);
            request.setAttribute("entryEndDate", null);
        }

        request.setAttribute("allTypesVect", allTypesVect);
        request.setAttribute("areaChairList", "areaChairList");
        return mapping.findForward("frmOECAreaChairEdit");
    }

    public ActionForward updateOrg(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HLCKrishnaStatelessRemote remote = initializeEJB(request);
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        String provisionalId = request.getParameter("provisionId");
        HLCCalendarVO calVO = new HLCCalendarVO();
        if (provisionalId != null && provisionalId.trim().length() != 0) {
            calVO = remote.getSingleEventDetails(provisionalId);
        }

        String orgList = request.getParameter("temporgList");
        Debug.print("orgList in update" + orgList);
        //String staffList=request.getParameter("tempstaffList");
        //Debug.print("staffList in update"+staffList);
        //String areaChairList=request.getParameter("tempareaChairList");
        //Debug.print("areaChairList in update"+areaChairList);
        String eventTitle = request.getParameter("txtEventTitle");
        String stDate = request.getParameter("startDate1");
        String enDate = request.getParameter("endDate");
        String entyStrtDate = request.getParameter("entryBeginDate");
        String entyEndDate = request.getParameter("entryEndDate");
        String extDueDate = request.getParameter("extDueDate");
        System.out.println(extDueDate + "=extDueDate");
        String compYear = request.getParameter("compYear");
        request.setAttribute("compYear", compYear);

        Date startDate = null;
        if (stDate != null && stDate.trim().length() != 0) {
            startDate = (Date) sdf.parse(stDate);
            Debug.print("startDate in servlet" + startDate);
        }
        Date endDate = null;
        if (enDate != null && enDate.trim().length() != 0) {
            endDate = (Date) sdf.parse(enDate);
        }
        Date entStartDate = null;
        if (entyStrtDate != null && entyStrtDate.trim().length() != 0) {
            entStartDate = (Date) sdf.parse(entyStrtDate);
        }

        Date entEndDate = null;
        if (entyEndDate != null && entyEndDate.trim().length() != 0) {
            entEndDate = (Date) sdf.parse(entyEndDate);
        }

        Date extndDueDate = null;
        if (extDueDate != null && extDueDate.trim().length() != 0) {
            extndDueDate = (Date) sdf.parse(extDueDate);
        }
        String areaName = request.getParameter("selAreaId");
        String stateName = request.getParameter("selStateId");
        String orgComm = request.getParameter("txtOrgComm");

        java.sql.Date tempDate = new java.sql.Date((new java.util.Date()).getTime());
        String currentDate = String.valueOf(tempDate).substring(5, 7) + "/" + String.valueOf(tempDate).substring(8, 10) + "/" + String.valueOf(tempDate).substring(0, 4);
        String modifyBy = request.getParameter("modifyBy");
        String ipAddress = request.getRemoteAddr();
        String noDays = request.getParameter("noOfDays");
        String renStatus = request.getParameter("renStatus");
        Debug.print("renStatus :" + renStatus);
        boolean rStatus = Boolean.parseBoolean(renStatus);
        int noOfDays = 0;
        if (noDays != null) {
            noOfDays = Integer.parseInt(noDays);
        }
        if (eventTitle != null && eventTitle.trim().length() != 0) {
            calVO.setEventTitle(eventTitle);
        } else {
            calVO.setEventTitle(null);
        }
        if (startDate != null) {
            calVO.setBeginDate(startDate);
        } else {
            calVO.setBeginDate(null);
        }
        if (entStartDate != null) {
            calVO.setEntryStrtDate(entStartDate);
        } else {
            calVO.setEntryStrtDate(null);
        }
        if (entEndDate != null) {
            calVO.setEntryEndDate(entEndDate);
        } else {
            calVO.setEntryEndDate(null);
        }
        if (extndDueDate != null) {
            calVO.setExtDueDate(extndDueDate);
        } else {
            calVO.setExtDueDate(null);
        }
        if (endDate != null) {
            calVO.setEndDate(endDate);
        } else {
            calVO.setEndDate(null);
        }
        if (areaName != null && areaName.trim().length() != 0) {
            calVO.setAreaId(areaName);
        } else {
            calVO.setAreaId(null);
        }
        if (stateName != null && stateName.trim().length() != 0) {
            calVO.setStateId(stateName);
        } else {
            calVO.setStateId(null);
        }
        if (orgComm != null && orgComm.trim().length() != 0) {
            calVO.setOrgComments(orgComm);
        }

        if (tempDate != null) {
            calVO.setModifyDate(tempDate);
        } else {
            calVO.setModifyDate(null);
        }
        if (modifyBy != null && modifyBy.trim().length() != 0) {
            calVO.setModifyBy(modifyBy);
        } else {
            calVO.setModifyBy(null);
        }
        if (ipAddress != null && ipAddress.trim().length() != 0) {
            calVO.setIpAddress(ipAddress);
        } else {
            calVO.setIpAddress(null);
        }
        if (noOfDays != 0) {
            calVO.setNoDays(noOfDays);
        } else {
            calVO.setNoDays(0);
        }
        calVO.setRenewStat(new Boolean(rStatus));
        ArrayList ChampList = new ArrayList();

        /*eventName=request.getParameterValues("txtEvent");
        Debug.print("eventName in CalendarAction"+eventName);
        boolean champResult=false;
        boolean editResult=false;
        String count="";
        String tmpVal="";
        if(eventName!=null) {
        if(!(eventName.equals("null"))){
        Debug.print("eventName in CalendarAction"+eventName);
        for(int i = 0; i < eventName.length; i++) {
        Pattern pat=Pattern.compile("#");
        String str[]=pat.split(eventName[i]);
        String eventType=str[2];
        String eventLevel=str[0];
        String eventId=calVO.getEventId();
        String finalList[]={provisionalId,eventId,eventType,eventLevel};
        ChampList.add(finalList);
        if(i==0){
        tmpVal = str[1];
        }else{
        tmpVal = tmpVal + ","+ str[1];
        }
        }
        calVO.setEventLevel(tmpVal);
        count=request.getParameter("countVal");
        editResult=remote.updateEventDetByOrg(calVO);
        }
        }
        if(editResult==true){
        champResult=remote.updateChampionshipDetails(ChampList);
        if(champResult==true){
        int countVal=0;
        String tmpType = "";
        String tmpLevel = "";
        if(count!=null){
        countVal=Integer.parseInt(count);
        }
        for(int j=0; j<=countVal; j++){
        String champ=request.getParameter("champ"+j);
        Debug.print("champ :"+champ);
        if(champ!=null && !(champ.equalsIgnoreCase("no"))){
        Pattern pat=Pattern.compile("#");
        String str[]=pat.split(champ);
        tmpLevel=str[0];
        tmpType=str[1];
        boolean result=false;
        result=remote.updateChampStatus(tmpLevel,tmpType,provisionalId);
        }
        }
        request.setAttribute("provisionalId",provisionalId);
        request.setAttribute("orgList1",orgList);
        //request.setAttribute("staffList1",staffList);
        //request.setAttribute("areaChairList1",areaChairList);
        return mapping.findForward("frmEventDetailEditSuccess");
        } else{
        String err="st";
        request.setAttribute("err",err);
        return mapping.findForward("frmOnlineEventDetailsEdit");
        }
        }
        return null;
        }*/

        String eventId1 = calVO.getEventId();
        boolean deleteChamp = remote.deleteChampDetails(eventId1);
        Debug.print("deleteChamp :" + deleteChamp);
        int divSize1 = 0;
        String divisionSize1 = request.getParameter("allTypesVect");
        Debug.print("divisionSize1 in calender Action: " + divisionSize1);

        if (divisionSize1 != null && divisionSize1.trim().length() != 0) {
            divSize1 = Integer.parseInt(divisionSize1);
        }
        String txtEvent1 = "";
        String tmpVal = "";
        String tmpVal1 = "";
        String[] str = {};
        String tmpType = "";
        String tmpLevel = "";
        String[] str1 = {};
        String txtDiv = "";
        String eventId = null;
        boolean editResult = false;
        for (int i = 1; i <= divSize1; i++) {
            txtEvent1 = request.getParameter("txtEvent" + i);
            String champ = request.getParameter("champ" + i);
            if (txtEvent1 != null && txtEvent1.trim().length() != 0) {
                String champStatus = "false";
                Debug.print("champStatus in servlet" + champStatus);
                Debug.print("txtEvent1 in update" + txtEvent1);
                Pattern pat = Pattern.compile("#");
                str = pat.split(txtEvent1);
                String eventType = str[2];
                String eventLevel = str[0];
                eventId = calVO.getEventId();
                String eventTypeName = remote.getEventTypeName(eventType);
                if (i == 1) {
                    tmpVal1 = eventTypeName;
                    Debug.print("tmpVal1 in if loop:" + tmpVal1);
                } else if (tmpVal1 == "") {
                    tmpVal = eventTypeName;
                    Debug.print("tmpVal1 in empty loop:" + tmpVal1);
                } else {
                    tmpVal1 = tmpVal1 + "," + eventTypeName;
                    Debug.print("tmpVal1 in else loop:" + tmpVal1);
                }
                Debug.print("eventType in update if loop:" + eventType);
                Debug.print("eventLevel in update if loop:" + eventLevel);
                String finalList[] = {provisionalId, eventId, eventType, eventLevel};
                ChampList.add(finalList);
                if (i == 1) {
                    tmpVal = str[1];
                    Debug.print("tmpVal in if loop:" + tmpVal);
                } else if (tmpVal == "") {
                    tmpVal = str[1];
                    Debug.print("tmpVal in empty loop:" + tmpVal);
                } else {
                    tmpVal = tmpVal + "," + str[1];
                    Debug.print("tmpVal in else loop:" + tmpVal);
                }
                if (champ != null && !(champ.equalsIgnoreCase("no"))) {
                    Debug.print("champ in if loop&&&&&&&&:" + champ);
                    champStatus = "true";
                }
                boolean flag = true;
                Debug.print("champStatus in the final:" + champStatus);

                int divSize = 0;
                String allDivisions = request.getParameter("allDivisions");
                Debug.print("allDivisions in calender Action: " + allDivisions);

                if (allDivisions != null && allDivisions.trim().length() != 0) {
                    divSize = Integer.parseInt(allDivisions);
                    Debug.print("divSize in calender Action: " + divSize);
                }
                for (int j = 0; j <= divSize; j++) {
                    txtDiv = request.getParameter("txtDiv" + i + "_" + j);
                    Debug.print("txtDiv in update" + txtDiv);
                    if (txtDiv != null && txtDiv.trim().length() != 0) {
                        String divisionId = "";
                        String divisionName = "";
                        Pattern pat1 = Pattern.compile("#");
                        str1 = pat1.split(txtDiv);
                        Debug.print("str1 in update" + str1);
                        divisionId = str1[0];
                        divisionName = str1[1];
                        /* if(divisionName.equalsIgnoreCase("Open"))
                        {
                        divisionId = null;
                        Debug.print("divisionId in if" + divisionId);
                        }*/
                        Debug.print("divisionId in update" + divisionId);
                        boolean champRes = remote.updateChampDetails(provisionalId, eventId, eventType, eventLevel, champStatus, divisionId);


                        if (champRes == true) {
                            flag = true;
                        } else {
                            flag = false;
                        }
                    }
                }
            }

        }
        boolean output1 = remote.eveDetailsExistsInEveTable(eventId);
        Debug.print("output1:" + output1);
        if (output1 == true) {

            boolean delRes = remote.deleteEveTypeDets(eventId);
            Debug.print("existRes in update of Calendar Action of delRes" + delRes);
            ArrayList eveChampLevlDets = remote.getChampionEveLevelDets(eventId);
            String mapTypeId = null;
            if (eveChampLevlDets != null && eveChampLevlDets.size() != 0) {
                Iterator itrSub = eveChampLevlDets.iterator();
                while (itrSub.hasNext()) {
                    String[] subEntry = (String[]) itrSub.next();
                    String levelId = subEntry[1];
                    String eveTypId = subEntry[3];

                    mapTypeId = remote.getEveTypLevelMapId(eveTypId, levelId);
                    Debug.print("existRes in update of Calendar Action of mapTypeId" + mapTypeId);

                    boolean mapResult = remote.insertMapDets(eventId, mapTypeId);

                }
            }
        }
        //Debug.print("existRes in update of Calendar Action of organizer" + existRes);          





        Debug.print("tmpVal :" + tmpVal);
        Debug.print("tmpVal1 :" + tmpVal1);
        calVO.setEventLevel(tmpVal);
        calVO.setEventTypeNames(tmpVal1);
        editResult = remote.updateEventDetByOrg(calVO);

        if (output1 == true) {
            boolean output = remote.updateEveDetsInMeeEventTable(calVO);
        }

        boolean flag = true;
        if (flag == true) {
            return mapping.findForward("frmEventDetailEditSuccess");
        } else {
            String err = "st";
            request.setAttribute("err", err);
            return mapping.findForward("frmOnlineEventDetailsEdit");
        }

    }

    public ActionForward updateStaff(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HLCKrishnaStatelessRemote remote = initializeEJB(request);
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        String provisionalId = request.getParameter("provisionId");
        HLCCalendarVO calVO = new HLCCalendarVO();
        if (provisionalId != null && provisionalId.trim().length() != 0) {
            calVO = remote.getSingleEventDetails(provisionalId);
        }

       // String eveOrgId = request.getParameter("eveOrgId");

        String staffList = request.getParameter("tempstaffList");
        Debug.print("staffList in update" + staffList);
        String eventTitle = request.getParameter("txtEventTitle");
        String stDate = request.getParameter("startDate1");
        String enDate = request.getParameter("endDate");
        String entyStrtDate = request.getParameter("entryBeginDate");
        String entyEndDate = request.getParameter("entryEndDate");
        String extDueDate = request.getParameter("extDueDate");
        String compYear = request.getParameter("compYear");
        String uStaffStatus = request.getParameter("uStaffStatus");
        String selIssue = request.getParameter("selIssue");
        String memId = request.getParameter("ownerUseaNo2_id");
        String eveOrgId = request.getParameter("orgnaizerId");
        
        String eveSecreId = null;
        String regFor = request.getParameter("regFor");
        if (regFor != null && regFor.equalsIgnoreCase("mem1")) {

            eveSecreId = remote.getEveSecretaryIdBasedOnMemId(memId);

        } else if (regFor != null && regFor.equalsIgnoreCase("acc1")) {
            String usrName = request.getParameter("userNameId1");
            eveSecreId = remote.getEveSecretaryIdBasedOnUsr(usrName);

        }
        request.setAttribute("compYear", compYear);
        System.out.println("Event Secratary Id ====================" + eveSecreId);
        Date startDate = null;
        if (stDate != null && stDate.trim().length() != 0) {
            startDate = (Date) sdf.parse(stDate);
            Debug.print("startDate in servlet" + startDate);
        }
        Date endDate = null;
        if (enDate != null && enDate.trim().length() != 0) {
            endDate = (Date) sdf.parse(enDate);
        }
        Date entStartDate = null;
        if (entyStrtDate != null && entyStrtDate.trim().length() != 0) {
            entStartDate = (Date) sdf.parse(entyStrtDate);
        }

        Date entEndDate = null;
        if (entyEndDate != null && entyEndDate.trim().length() != 0) {
            entEndDate = (Date) sdf.parse(entyEndDate);
        }

        Date extndDueDate = null;
        if (extDueDate != null && extDueDate.trim().length() != 0) {
            extndDueDate = (Date) sdf.parse(extDueDate);
        }
        String areaName = request.getParameter("selAreaId");
        String stateName = request.getParameter("selStateId");
        String staffComm = request.getParameter("txtStaffComm");
        java.sql.Date tempDate = new java.sql.Date((new java.util.Date()).getTime());
        String currentDate = String.valueOf(tempDate).substring(5, 7) + "/" + String.valueOf(tempDate).substring(8, 10) + "/" + String.valueOf(tempDate).substring(0, 4);
        String modifyBy = request.getParameter("modifyBy");
        String ipAddress = request.getRemoteAddr();
        String noDays = request.getParameter("noOfDays");

        int noOfDays = 0;
        if (noDays != null) {
            noOfDays = Integer.parseInt(noDays);
        }
        if (eventTitle != null && eventTitle.trim().length() != 0) {
            calVO.setEventTitle(eventTitle);
        } else {
            calVO.setEventTitle(null);
        }
        if (startDate != null) {
            calVO.setBeginDate(startDate);
        } else {
            calVO.setBeginDate(null);
        }
        if (entStartDate != null) {
            calVO.setEntryStrtDate(entStartDate);
        } else {
            calVO.setEntryStrtDate(null);
        }
        if (entEndDate != null) {
            calVO.setEntryEndDate(entEndDate);
        } else {
            calVO.setEntryEndDate(null);
        }
        if (extndDueDate != null) {
            calVO.setExtDueDate(extndDueDate);
        } else {
            calVO.setExtDueDate(null);
        }
        if (endDate != null) {
            calVO.setEndDate(endDate);
        } else {
            calVO.setEndDate(null);
        }
        if (areaName != null && areaName.trim().length() != 0) {
            calVO.setAreaId(areaName);
        } else {
            calVO.setAreaId(null);
        }
        if (stateName != null && stateName.trim().length() != 0) {
            calVO.setStateId(stateName);
        } else {
            calVO.setStateId(null);
        }
        if (staffComm != null && staffComm.trim().length() != 0) {
            calVO.setStaffComments(staffComm);
        } else {
            calVO.setStaffComments(null);
        }
        if (tempDate != null) {
            calVO.setModifyDate(tempDate);
        } else {
            calVO.setModifyDate(null);
        }
        if (modifyBy != null && modifyBy.trim().length() != 0) {
            calVO.setModifyBy(modifyBy);
        } else {
            calVO.setModifyBy(null);
        }
        if (ipAddress != null && ipAddress.trim().length() != 0) {
            calVO.setIpAddress(ipAddress);
        } else {
            calVO.setIpAddress(null);
        }
        if (noOfDays != 0) {
            calVO.setNoDays(noOfDays);
        } else {
            calVO.setNoDays(0);
        }

        if (uStaffStatus != null) {
            calVO.setApprovalStatus(uStaffStatus);
        } else {
            calVO.setApprovalStatus(null);
        }

        if (selIssue != null && selIssue.trim().length() != 0) {
            calVO.setEveIssueId(selIssue);
        } else {
            calVO.setEveIssueId(null);
        }

        if (eveSecreId != null && eveSecreId.trim().length() != 0) {
            calVO.setEveSecreId(eveSecreId);
        } else {
            calVO.setEveSecreId(null);
        }

        if (eveOrgId != null && eveOrgId.trim().length() != 0) {
            calVO.setOrganizerId(eveOrgId);
        } else {
            calVO.setOrganizerId(null);
        }
        
        ArrayList ChampList = new ArrayList();

        /*String eventId1 = calVO.getEventId();
        boolean deleteChamp = remote.deleteChampDetails(eventId1);
        Debug.print("deleteChamp :" + deleteChamp);
        int divSize1 = 0;
        String divisionSize1 = request.getParameter("allTypesVect");
        Debug.print("divisionSize1 in calender Action: " + divisionSize1);
        if (divisionSize1 != null && divisionSize1.trim().length() != 0) {
        divSize1 = Integer.parseInt(divisionSize1);
        }
        String txtEvent1 = "";
        String tmpVal = "";
        String[] str = {};
        String tmpType = "";
        String tmpLevel = "";
        boolean editResult = false;
        for (int i = 1; i <= divSize1; i++) {
        txtEvent1 = request.getParameter("txtEvent" + i);
        String champ = request.getParameter("champ" + i);
        if (txtEvent1 != null && txtEvent1.trim().length() != 0) {
        String champStatus = "false";
        Debug.print("txtEvent1 in update" + txtEvent1);
        Pattern pat = Pattern.compile("#");
        str = pat.split(txtEvent1);
        String eventType = str[2];
        String eventLevel = str[0];
        String eventId = calVO.getEventId();
        Debug.print("eventType in update if loop:" + eventType);
        Debug.print("eventLevel in update if loop:" + eventLevel);
        String finalList[] = {provisionalId, eventId, eventType, eventLevel};
        ChampList.add(finalList);
        if (i == 1) {
        tmpVal = str[1];
        Debug.print("tmpVal in if loop:" + tmpVal);
        } else if (tmpVal == "") {
        tmpVal = str[1];
        Debug.print("tmpVal in empty loop:" + tmpVal);
        } else {
        tmpVal = tmpVal + "," + str[1];
        Debug.print("tmpVal in else loop:" + tmpVal);
        }
        if (champ != null && !(champ.equalsIgnoreCase("no"))) {
        Debug.print("champ in if loop:" + champ);
        champStatus = "true";
        }
        boolean flag = true;
        Debug.print("champStatus in the final:" + champStatus);
        String divisionId = "";
        boolean champRes = remote.updateChampDetails(provisionalId, eventId, eventType, eventLevel, champStatus, divisionId);
        if (champRes == true) {
        flag = true;
        } else {
        flag = false;
        }
        }
        }
        Debug.print("tmpVal :" + tmpVal);
        calVO.setEventLevel(tmpVal);
        editResult = remote.updateEventDetByStaff(calVO);
        boolean flag = true;
        if (flag == true) {
        return mapping.findForward("frmStaffEventDetailEditSuccess");
        } else {
        String err = "st";
        request.setAttribute("err", err);
        return mapping.findForward("frmOECStaffEdit");
        }*/
        String eventId1 = calVO.getEventId();
        boolean deleteChamp = remote.deleteChampDetails(eventId1);
        Debug.print("deleteChamp :" + deleteChamp);
        int divSize1 = 0;
        String divisionSize1 = request.getParameter("allTypesVect");
        Debug.print("divisionSize1 in calender Action: " + divisionSize1);

        if (divisionSize1 != null && divisionSize1.trim().length() != 0) {
            divSize1 = Integer.parseInt(divisionSize1);
        }
        String txtEvent1 = "";
        String tmpVal = "";
        String tmpVal1 = "";
        String[] str = {};
        String tmpType = "";
        String tmpLevel = "";
        String[] str1 = {};
        String txtDiv = "";
        String eventId = null;
        boolean editResult = false;
        for (int i = 1; i <= divSize1; i++) {
            txtEvent1 = request.getParameter("txtEvent" + i);
            String champ = request.getParameter("champ" + i);
            if (txtEvent1 != null && txtEvent1.trim().length() != 0) {
                String champStatus = "false";
                Debug.print("champStatus in servlet" + champStatus);
                Debug.print("txtEvent1 in update" + txtEvent1);
                Pattern pat = Pattern.compile("#");
                str = pat.split(txtEvent1);
                String eventType = str[2];
                String eventLevel = str[0];
                eventId = calVO.getEventId();
                String eventTypeName = remote.getEventTypeName(eventType);
                if (i == 1) {
                    tmpVal1 = eventTypeName;
                    Debug.print("tmpVal1 in if loop:" + tmpVal1);
                } else if (tmpVal1 == "") {
                    tmpVal = eventTypeName;
                    Debug.print("tmpVal1 in empty loop:" + tmpVal1);
                } else {
                    tmpVal1 = tmpVal1 + "," + eventTypeName;
                    Debug.print("tmpVal1 in else loop:" + tmpVal1);
                }
                Debug.print("eventType in update if loop:" + eventType);
                Debug.print("eventLevel in update if loop:" + eventLevel);
                String finalList[] = {provisionalId, eventId, eventType, eventLevel};
                ChampList.add(finalList);
                if (i == 1) {
                    tmpVal = str[1];
                    Debug.print("tmpVal in if loop:" + tmpVal);
                } else if (tmpVal == "") {
                    tmpVal = str[1];
                    Debug.print("tmpVal in empty loop:" + tmpVal);
                } else {
                    tmpVal = tmpVal + "," + str[1];
                    Debug.print("tmpVal in else loop:" + tmpVal);
                }
                if (champ != null && !(champ.equalsIgnoreCase("no"))) {
                    Debug.print("champ in if loop&&&&&&&&:" + champ);
                    champStatus = "true";
                }
                boolean flag = true;
                Debug.print("champStatus in the final:" + champStatus);

                int divSize = 0;
                String allDivisions = request.getParameter("allDivisions");
                Debug.print("allDivisions in calender Action: " + allDivisions);

                if (allDivisions != null && allDivisions.trim().length() != 0) {
                    divSize = Integer.parseInt(allDivisions);
                    Debug.print("divSize in calender Action: " + divSize);
                }
                for (int j = 0; j <= divSize; j++) {
                    txtDiv = request.getParameter("txtDiv" + i + "_" + j);
                    Debug.print("txtDiv in update" + txtDiv);
                    if (txtDiv != null && txtDiv.trim().length() != 0) {
                        String divisionId = "";
                        String divisionName = "";
                        Pattern pat1 = Pattern.compile("#");
                        str1 = pat1.split(txtDiv);
                        Debug.print("str1 in update" + str1);
                        divisionId = str1[0];
                        divisionName = str1[1];
                        /*if(divisionName.equalsIgnoreCase("Open"))
                        {
                        divisionId = null;
                        Debug.print("divisionId in if" + divisionId);
                        }*/
                        Debug.print("divisionId in update" + divisionId);
                        boolean champRes = remote.updateChampDetails(provisionalId, eventId, eventType, eventLevel, champStatus, divisionId);

                        if (champRes == true) {
                            flag = true;
                        } else {
                            flag = false;
                        }
                    }
                }
            }

        }

        boolean output1 = remote.eveDetailsExistsInEveTable(eventId);
        Debug.print("output1:" + output1);
        if (output1 == true) {

            boolean delRes = remote.deleteEveTypeDets(eventId);
            Debug.print("existRes in update of Calendar Action of delRes" + delRes);
            ArrayList eveChampLevlDets = remote.getChampionEveLevelDets(eventId);
            String mapTypeId = null;
            if (eveChampLevlDets != null && eveChampLevlDets.size() != 0) {
                Iterator itrSub = eveChampLevlDets.iterator();
                while (itrSub.hasNext()) {
                    String[] subEntry = (String[]) itrSub.next();
                    String levelId = subEntry[1];
                    String eveTypId = subEntry[3];

                    mapTypeId = remote.getEveTypLevelMapId(eveTypId, levelId);
                    Debug.print("existRes in update of Calendar Action of mapTypeId" + mapTypeId);

                    boolean mapResult = remote.insertMapDets(eventId, mapTypeId);

                }
            }
           
        }

        Debug.print("tmpVal :" + tmpVal);
        Debug.print("tmpVal1 :" + tmpVal1);
        calVO.setEventLevel(tmpVal);
        calVO.setEventTypeNames(tmpVal1);
        editResult = remote.updateEventDetByOrg(calVO);

        if (editResult == true) {

            Debug.print("Inside editResult of Admin Update for approval Process");
            ArrayList eveStatList = remote.getEventDetsApprovedByAll(provisionalId, eventId);
            String areaChApprovStat = "";
            String orgApprovStat = "";
            String uStaffApprovStat = "";
            String oldEventId = "";
            int compYear3 = 0;
            if (eveStatList != null && eveStatList.size() != 0) {
                Iterator itr = eveStatList.iterator();
                HLCCalendarVO calVO3 = new HLCCalendarVO();
                while (itr.hasNext()) {
                    calVO3 = (HLCCalendarVO) itr.next();
                    String provisionId = calVO3.getCalenderId();
                    System.out.println("provisionId in jsp" + provisionId);
                    String orgId = calVO3.getOrganizerId();
                    Date beginDate = calVO3.getBeginDate();
                    Date endDate3 = calVO3.getEndDate();
                    String eventTitle3 = calVO3.getEventTitle();
                    String areaCode3 = calVO3.getAreaCode();
                    String areaName3 = calVO3.getAreaName();
                    String stateName3 = calVO3.getStateName();
                    areaChApprovStat = calVO3.getOrgApprovalStatus();
                    String orgFirstName = calVO3.getOrgFName();
                    String orgLastName = calVO3.getOrgLName();
                    String userId = calVO3.getUserId();
                    orgApprovStat = calVO3.getOrgApprovalStatus();
                    uStaffApprovStat = calVO3.getApprovalStatus();
                    eventId = calVO3.getEventId();
                    oldEventId = calVO3.getOldEventId();
                    compYear3 = calVO3.getCompYear();
                }
                if (orgApprovStat != null && orgApprovStat.equalsIgnoreCase("Approved") && areaChApprovStat != null && areaChApprovStat.equalsIgnoreCase("Approved") && uStaffApprovStat != null && uStaffApprovStat.equalsIgnoreCase("Approved") && oldEventId != null && eventId != null) {
                    boolean output = remote.eveDetailsExistsInEveTable(eventId);
                    Debug.print("output:" + output);
                    if (output == false) {
                        ArrayList eveStatList1 = remote.getOldEventDetails(oldEventId);
                        ArrayList eveStatList2 = remote.getOldEventHistoryDetails(oldEventId);
                        boolean resultStat = false;
                        boolean resultHistStat = false;
                        if (eveStatList1 != null && eveStatList1.size() != 0) {
                            Iterator itr1 = eveStatList1.iterator();

                            if (itr1.hasNext()) {
                                HLCEventRequestVO objEventDetails = (HLCEventRequestVO) itr1.next();
                                String compLocation = objEventDetails.getCompetition_location();
                                Debug.print("compLocation in servlet:" + compLocation);
                                String compCity = objEventDetails.getCompetition_city();
                                String compCountry = objEventDetails.getCompetition_country();
                                String issueId = objEventDetails.getIssueId();
                                float entryFee = objEventDetails.getEntry_fee();
                                String otherEntryFee = objEventDetails.getOther_entry_fee();
                                String membApplicable = objEventDetails.getMembership_applicable();
                                String doubleEntryFee = objEventDetails.getDouble_entry_fee_status();
                                float offFee = objEventDetails.getOffice_fee();
                                String chkPayTo = objEventDetails.getCheck_payable_to();
                                float pinneyChrg = objEventDetails.getPinnies_charge();
                                int pinneyPos = objEventDetails.getPinnies_position();
                                String awdTrophy = objEventDetails.getAward_trophy();
                                String awdPrize = objEventDetails.getAward_prize();
                                String awdOthers = objEventDetails.getAward_others();
                                Date dateAvail = objEventDetails.getDate_available();
                                String availableFrom = objEventDetails.getAvailable_from();
                                String availFrmOther = objEventDetails.getAvailable_from_other();
                                int availPosition = objEventDetails.getAvailable_position();
                                boolean stabLimited = objEventDetails.isStabling_limited();
                                float stallPerNightPrice = objEventDetails.getStall_pernight_price();
                                float perStallPrice = objEventDetails.getPer_stall_price();
                                String perStallFrmTime = objEventDetails.getPer_stall_from_time();
                                Date perStallFrmDt = objEventDetails.getPer_stall_from_date();

                                String perStallToTime = objEventDetails.getPer_stall_to_time();
                                Date perStallToDt = objEventDetails.getPer_stall_to_date();
                                int noOfStalls = objEventDetails.getNo_of_stalls();
                                int noOfTempStalls = objEventDetails.getNo_of_temp_stalls();
                                int noOfTempPermantStalls = objEventDetails.getNo_of_temp_permanent_stalls();

                                String milesFrmEvent = objEventDetails.getMiles_from_event();
                                String vertName = objEventDetails.getVeterinarian_name();
                                String vertPhne = objEventDetails.getVeterinarian_phone();
                                String vertPlace = objEventDetails.getVeterinarian_place();
                                String accomCamp = objEventDetails.getAccomodation_camping();

                                String direct = objEventDetails.getDirections();
                                String footingDesc = objEventDetails.getFooting_desc();
                                String comments = objEventDetails.getComments();
                                String orgId = objEventDetails.getOrgId();
                                Debug.print("orgId in servlet:" + orgId);
                                String eveTitle = objEventDetails.getEventTitle();
                                Debug.print("eveTitle in servlet:" + eveTitle);
                                String compZip = objEventDetails.getCompetition_zip();
                                String eveSecId = objEventDetails.getEvent_secretary_id();


                                if (compLocation != null && compLocation.trim().length() != 0) {
                                    objEventDetails.setCompetition_location(compLocation);
                                } else {
                                    objEventDetails.setCompetition_location(null);
                                }

                                if (compCity != null && compCity.trim().length() != 0) {
                                    objEventDetails.setCompetition_city(compCity);
                                } else {
                                    objEventDetails.setCompetition_city(null);
                                }

                                if (compCountry != null && compCountry.trim().length() != 0) {
                                    objEventDetails.setCompetition_country(compCountry);
                                } else {
                                    objEventDetails.setCompetition_country(null);
                                }

                                if (issueId != null && issueId.trim().length() != 0) {
                                    objEventDetails.setIssueId(issueId);
                                } else {
                                    objEventDetails.setIssueId(null);
                                }
                                if (entryFee != 0) {
                                    objEventDetails.setEntry_fee(entryFee);
                                } else {
                                    objEventDetails.setEntry_fee(0);
                                }
                                if (otherEntryFee != null && otherEntryFee.trim().length() != 0) {
                                    objEventDetails.setOther_entry_fee(otherEntryFee);
                                } else {
                                    objEventDetails.setOther_entry_fee(null);
                                }

                                if (membApplicable != null && membApplicable.trim().length() != 0) {
                                    objEventDetails.setMembership_applicable(membApplicable);
                                } else {
                                    objEventDetails.setMembership_applicable(null);
                                }
                                if (doubleEntryFee != null && doubleEntryFee.trim().length() != 0) {
                                    objEventDetails.setDouble_entry_fee_status(doubleEntryFee);
                                } else {
                                    objEventDetails.setDouble_entry_fee_status(null);
                                }

                                if (offFee != 0) {
                                    objEventDetails.setOffice_fee(offFee);
                                } else {
                                    objEventDetails.setOffice_fee(0);
                                }
                                if (chkPayTo != null && chkPayTo.trim().length() != 0) {
                                    objEventDetails.setCheck_payable_to(chkPayTo);
                                } else {
                                    objEventDetails.setCheck_payable_to(null);
                                }
                                if (pinneyChrg != 0) {
                                    objEventDetails.setPinnies_charge(pinneyChrg);
                                } else {
                                    objEventDetails.setPinnies_charge(0);
                                }
                                if (pinneyPos != 0) {
                                    objEventDetails.setPinnies_position(pinneyPos);
                                } else {
                                    objEventDetails.setPinnies_position(0);
                                }
                                if (awdTrophy != null) {
                                    objEventDetails.setAward_trophy(awdTrophy);
                                } else {
                                    objEventDetails.setAward_trophy(null);
                                }
                                if (awdPrize != null) {
                                    objEventDetails.setAward_prize(awdPrize);
                                } else {
                                    objEventDetails.setAward_prize(null);
                                }
                                if (awdOthers != null) {
                                    objEventDetails.setAward_others(awdOthers);
                                } else {
                                    objEventDetails.setAward_others(null);
                                }
                                if (dateAvail != null) {
                                    objEventDetails.setDate_available(dateAvail);
                                } else {
                                    objEventDetails.setDate_available(null);
                                }
                                if (availableFrom != null) {
                                    objEventDetails.setAvailable_from(availableFrom);
                                } else {
                                    objEventDetails.setAvailable_from(null);
                                }
                                if (availFrmOther != null) {
                                    objEventDetails.setAvailable_from_other(availFrmOther);
                                } else {
                                    objEventDetails.setAvailable_from_other(null);
                                }
                                if (availPosition != 0) {
                                    objEventDetails.setAvailable_position(availPosition);
                                } else {
                                    objEventDetails.setAvailable_position(0);
                                }

                                objEventDetails.setStabling_limited(stabLimited);

                                if (stallPerNightPrice != 0) {
                                    objEventDetails.setStall_pernight_price(stallPerNightPrice);
                                } else {
                                    objEventDetails.setStall_pernight_price(0);
                                }

                                if (perStallPrice != 0) {
                                    objEventDetails.setPer_stall_price(perStallPrice);
                                } else {
                                    objEventDetails.setPer_stall_price(0);
                                }
                                if (perStallFrmTime != null) {
                                    objEventDetails.setPer_stall_from_time(perStallFrmTime);
                                } else {
                                    objEventDetails.setPer_stall_from_time(null);
                                }

                                if (perStallFrmDt != null) {
                                    objEventDetails.setPer_stall_from_date(perStallFrmDt);
                                } else {
                                    objEventDetails.setPer_stall_from_date(null);
                                }
                                if (perStallToTime != null) {
                                    objEventDetails.setPer_stall_to_time(perStallToTime);
                                } else {
                                    objEventDetails.setPer_stall_to_time(null);
                                }

                                if (perStallToDt != null) {
                                    objEventDetails.setPer_stall_to_date(perStallToDt);
                                } else {
                                    objEventDetails.setPer_stall_to_date(null);
                                }

                                if (noOfStalls != 0) {
                                    objEventDetails.setNo_of_stalls(noOfStalls);
                                } else {
                                    objEventDetails.setNo_of_stalls(0);
                                }
                                if (noOfTempStalls != 0) {
                                    objEventDetails.setNo_of_temp_stalls(noOfTempStalls);
                                } else {
                                    objEventDetails.setNo_of_temp_stalls(0);
                                }
                                if (noOfTempPermantStalls != 0) {
                                    objEventDetails.setNo_of_temp_permanent_stalls(noOfTempPermantStalls);
                                } else {
                                    objEventDetails.setNo_of_temp_permanent_stalls(0);
                                }
                                if (milesFrmEvent != null) {
                                    objEventDetails.setMiles_from_event(milesFrmEvent);
                                } else {
                                    objEventDetails.setMiles_from_event(null);
                                }
                                if (vertName != null) {
                                    objEventDetails.setVeterinarian_name(vertName);
                                } else {
                                    objEventDetails.setVeterinarian_name(null);
                                }
                                if (vertPhne != null) {
                                    objEventDetails.setVeterinarian_phone(vertPhne);
                                } else {
                                    objEventDetails.setVeterinarian_phone(null);
                                }
                                if (vertPlace != null) {
                                    objEventDetails.setVeterinarian_place(vertPlace);
                                } else {
                                    objEventDetails.setVeterinarian_place(null);
                                }
                                if (accomCamp != null) {
                                    objEventDetails.setAccomodation_camping(accomCamp);
                                } else {
                                    objEventDetails.setAccomodation_camping(null);
                                }

                                if (direct != null) {
                                    objEventDetails.setDirections(direct);
                                } else {
                                    objEventDetails.setDirections(null);
                                }
                                if (footingDesc != null) {
                                    objEventDetails.setFooting_desc(footingDesc);
                                } else {
                                    objEventDetails.setFooting_desc(null);
                                }
                                if (accomCamp != null) {
                                    objEventDetails.setComments(comments);
                                } else {
                                    objEventDetails.setComments(null);
                                }
                                if (eventId != null) {
                                    objEventDetails.setEvent_id(eventId);
                                } else {
                                    objEventDetails.setEvent_id(null);
                                }

                                if (orgId != null) {
                                    objEventDetails.setOrgId(orgId);
                                } else {
                                    objEventDetails.setOrgId(null);
                                }
                                if (eveTitle != null) {
                                    objEventDetails.setEventTitle(eveTitle);
                                } else {
                                    objEventDetails.setEventTitle(null);
                                }
                                if (compZip != null) {
                                    objEventDetails.setCompetition_zip(compZip);
                                } else {
                                    objEventDetails.setCompetition_zip(null);
                                }
                                if (eveSecreId != null && eveSecreId.trim().length() != 0) {
                                    objEventDetails.setEvent_secretary_id(eveSecreId);
                                } else {
                                    objEventDetails.setEvent_secretary_id(null);
                                }


                                resultStat = remote.insertProCalEveIntoEveDetails(objEventDetails);
                                Debug.print("resultStat:" + resultStat);
                                
         boolean output3 = remote.insertEveSecreRelationDets(eveOrgId, eveSecreId, eventId);
         Debug.print("output3 of Event Secretary Relation***" + output3);
                            }
                        }

                        if (resultStat == true) {

                            if (eveStatList2 != null && eveStatList2.size() != 0) {
                                Iterator itr2 = eveStatList2.iterator();
                                if (itr2.hasNext()) {
                                    HLCEventRequestVO objEventDetails = (HLCEventRequestVO) itr2.next();

                                    String orgId = objEventDetails.getOrgId();
                                    Debug.print("orgId in servlet:" + orgId);
                                    String eveTitle = objEventDetails.getEventTitle();
                                    Debug.print("eveTitle in servlet:" + eveTitle);

                                    //int compYr=objEventDetails.getCompYear();
                                    // Debug.print("compYr in servlet:" +compYr);                     


                                    if (compYear3 != 0) {
                                        objEventDetails.setCompYear(compYear3);
                                    } else {
                                        objEventDetails.setCompYear(0);
                                    }

                                    if (orgId != null) {
                                        objEventDetails.setOrgId(orgId);
                                    } else {
                                        objEventDetails.setOrgId(null);
                                    }
                                    if (eveTitle != null) {
                                        objEventDetails.setEventTitle(eveTitle);
                                    } else {
                                        objEventDetails.setEventTitle(null);
                                    }
                                    objEventDetails.setEvent_id(eventId);

                                    //compYear

                                    resultHistStat = remote.insertProCalEveIntoEveHistoryDetails(objEventDetails);
                                    Debug.print("resultHistStat:" + resultHistStat);
                                }
                            }

                        }

                        ArrayList provDets = new ArrayList();
                        if (resultStat == true) {
                            provDets = remote.getProvEventDetails(eventId);
                        }
                        if (provDets != null && provDets.size() != 0) {
                            String orgId = "";
                            String eveTitle = "";
                            Date eveBegDt = null;
                            Date eveEndDt = null;
                            Date oeBegDt = null;
                            Date oeEndDt = null;
                            Date oeExDueDt = null;
                            String state = null;
                            String area = null;

                            Iterator itr2 = provDets.iterator();
                            if (itr2.hasNext()) {
                                HLCCalendarVO calVO1 = (HLCCalendarVO) itr2.next();
                                orgId = calVO1.getOrganizerId();
                                eveTitle = calVO1.getEventTitle();
                                eveBegDt = calVO1.getBeginDate();
                                eveEndDt = calVO1.getEndDate();
                                oeBegDt = calVO1.getEntryStrtDate();
                                oeEndDt = calVO1.getEntryEndDate();
                                oeExDueDt = calVO1.getExtDueDate();
                                state = calVO1.getStateId();
                                area = calVO1.getAreaId();

                                if (orgId != null && orgId.trim().length() != 0) {
                                    calVO1.setOrganizerId(orgId);
                                } else {
                                    calVO1.setOrganizerId(null);
                                }
                                if (eveTitle != null && eveTitle.trim().length() != 0) {
                                    calVO1.setEventTitle(eveTitle);
                                } else {
                                    calVO1.setEventTitle(null);
                                }
                                if (eveBegDt != null) {
                                    calVO1.setBeginDate(eveBegDt);
                                } else {
                                    calVO1.setBeginDate(null);
                                }
                                if (eveEndDt != null) {
                                    calVO1.setEndDate(eveEndDt);
                                } else {
                                    calVO1.setEndDate(null);
                                }
                                if (oeBegDt != null) {
                                    calVO1.setEntryStrtDate(oeBegDt);
                                } else {
                                    calVO1.setEntryStrtDate(null);
                                }
                                if (oeEndDt != null) {
                                    calVO1.setEntryEndDate(oeEndDt);
                                } else {
                                    calVO1.setEntryEndDate(null);
                                }
                                if (oeExDueDt != null) {
                                    calVO1.setExtDueDate(oeExDueDt);
                                } else {
                                    calVO1.setExtDueDate(null);
                                }
                                if (state != null) {
                                    calVO1.setStateId(state);
                                } else {
                                    calVO1.setStateId(null);
                                }
                                if (area != null) {
                                    calVO1.setAreaId(area);
                                } else {
                                    calVO1.setAreaId(null);
                                }



                                boolean resultStat1 = remote.updateNewEveDets(orgId, eveTitle, eveBegDt, eveEndDt, oeBegDt, oeEndDt, oeExDueDt, state, area, eventId);
                                boolean resultStat2 = remote.updateOmnibusDetsInAllTables(eventId, oldEventId);
                                Debug.print("resultStat1:" + resultStat1);
                                Debug.print("resultStat2:" + resultStat2);

                            }

                        }
                    }
                } else if (orgApprovStat != null && orgApprovStat.equalsIgnoreCase("Approved") && areaChApprovStat != null && areaChApprovStat.equalsIgnoreCase("Approved") && uStaffApprovStat != null && uStaffApprovStat.equalsIgnoreCase("Approved") && oldEventId == null && eventId != null) {

                    boolean output3 = remote.eveDetailsExistsInEveTable(eventId);
                    Debug.print("output1:" + output1);
                    if (output3 == false) {
                        ArrayList eveList = remote.getApprovedEventDet(provisionalId, eventId);

                        HLCEventRequestVO proEveObj = new HLCEventRequestVO();

                        String areaChApprovStat1 = "";
                        String orgApprovStat1 = "";
                        String uStaffApprovStat1 = "";
                        String oldEventId1 = "";
                        int compYear1 = 0;
                        if (eveList != null && eveList.size() != 0) {
                            Iterator itr1 = eveList.iterator();

                            while (itr1.hasNext()) {
                                calVO = (HLCCalendarVO) itr1.next();
                                String provisionId = calVO.getCalenderId();
                                System.out.println("provisionId in jsp" + provisionId);
                                String orgId = calVO.getOrganizerId();
                                Date beginDate = calVO.getBeginDate();
                                Date endDate4 = calVO.getEndDate();
                                String eventTitle4 = calVO.getEventTitle();
                                String areaCode = calVO.getAreaCode();
                                String areaName4 = calVO.getAreaName();
                                String stateName4 = calVO.getStateName();
                                areaChApprovStat1 = calVO.getOrgApprovalStatus();
                                String orgFirstName = calVO.getOrgFName();
                                String orgLastName = calVO.getOrgLName();
                                String userId = calVO.getUserId();
                                orgApprovStat1 = calVO.getOrgApprovalStatus();
                                uStaffApprovStat1 = calVO.getApprovalStatus();
                                eventId = calVO.getEventId();
                                oldEventId1 = calVO.getOldEventId();
                                compYear1 = calVO.getCompYear();
                                Date oeBeginDate = calVO.getEntryStrtDate();
                                Date oeEndDate = calVO.getEntryEndDate();
                                Date oeExtndDate = calVO.getExtDueDate();
                                String areaId = calVO.getAreaId();
                                String StaId = calVO.getStateId();
                                String eveTypIds = calVO.getEventTypeId();
                                String eveLevIds = calVO.getEventLevelId();
                                String eveLocat = calVO.getEveLocation();
                                String eveCity = calVO.getEveCity();
                                String eveZip = calVO.getEveZip();
                                String eveIssId = calVO.getEveIssueId();

                                if (eventId != null) {
                                    proEveObj.setEvent_id(eventId);
                                } else {
                                    proEveObj.setEvent_id(null);
                                }

                                if (orgId != null) {
                                    proEveObj.setOrgId(orgId);
                                } else {
                                    proEveObj.setOrgId(null);
                                }

                                if (eventTitle4 != null) {
                                    proEveObj.setEventTitle(eventTitle4);
                                } else {
                                    proEveObj.setEventTitle(null);
                                }

                                if (beginDate != null) {
                                    proEveObj.setEveBegDate(beginDate);
                                } else {
                                    proEveObj.setEveBegDate(null);
                                }

                                if (endDate4 != null) {
                                    proEveObj.setEveEndDate(endDate4);
                                } else {
                                    proEveObj.setEveEndDate(null);
                                }

                                if (oeBeginDate != null) {
                                    proEveObj.setEveOeBegDate(oeBeginDate);
                                } else {
                                    proEveObj.setEveOeBegDate(null);
                                }

                                if (oeEndDate != null) {
                                    proEveObj.setEveOeEndDate(oeEndDate);
                                } else {
                                    proEveObj.setEveOeEndDate(null);
                                }

                                if (oeExtndDate != null) {
                                    proEveObj.setEveOeExtnDate(oeExtndDate);
                                } else {
                                    proEveObj.setEveOeExtnDate(null);
                                }

                                if (areaId != null) {
                                    proEveObj.setChampionship_area(areaId);
                                } else {
                                    proEveObj.setChampionship_area(null);
                                }

                                if (StaId != null) {
                                    proEveObj.setCompetition_state(StaId);
                                } else {
                                    proEveObj.setCompetition_state(null);
                                }

                                if (eveLocat != null) {
                                    proEveObj.setCompetition_location(eveLocat);
                                } else {
                                    proEveObj.setCompetition_location(null);
                                }

                                if (eveCity != null) {
                                    proEveObj.setCompetition_city(eveCity);
                                } else {
                                    proEveObj.setCompetition_city(null);
                                }

                                if (eveZip != null) {
                                    proEveObj.setCompetition_zip(eveZip);
                                } else {
                                    proEveObj.setCompetition_zip(null);
                                }

                                if (eveIssId != null) {
                                    proEveObj.setIssueId(eveIssId);
                                } else {
                                    proEveObj.setIssueId(null);
                                }

                                if (eveSecreId != null && eveSecreId.trim().length() != 0) {
                                    proEveObj.setEvent_secretary_id(eveSecreId);
                                } else {
                                    proEveObj.setEvent_secretary_id(null);
                                }

                            }

                        }
                        boolean eveResult = remote.insertEveDetails(proEveObj);


                        if (eveResult == true) {
                            
  boolean output6 = remote.insertEveSecreRelationDets(eveOrgId, eveSecreId, eventId);
         Debug.print("output6 of Event Secretary Relation***" + output6);
                            ArrayList eveTypLevelsList = remote.getEveTyLevIdDet(provisionalId, eventId);

                            if (eveTypLevelsList != null && eveTypLevelsList.size() != 0) {
                                Iterator itrObj = eveTypLevelsList.iterator();
                                while (itrObj.hasNext()) {
                                    HLCCalendarVO typeLevelObj = (HLCCalendarVO) itrObj.next();
                                    String eveTypeId = typeLevelObj.getEventTypeId();
                                    String eveLevId = typeLevelObj.getEventLevelId();

                                    String mapTypeId = remote.getEveTypLevelMapId(eveTypeId, eveLevId);

                                    boolean mapResult = remote.insertMapDets(eventId, mapTypeId);
                                    Debug.print("mapResult *****" + mapResult);
                                }

                            }
                        }

                    }
                }
            }
        }
         boolean updateEveRes=false;
         
        if (output1 == true) {
             updateEveRes = remote.updateEveDetsInMeeEventTableByAdmin(calVO); 
             
             if(updateEveRes==true){
               boolean output5 = remote.insertEveSecreRelationDets(eveOrgId, eveSecreId, eventId);
         Debug.print("output5 of Event Secretary Relation***" + output5);  
             }
        }
                   
        boolean flag = true;
        if (flag == true) {
            return mapping.findForward("frmStaffEventDetailEditSuccess");
        } else {
            String err = "st";
            request.setAttribute("err", err);
            return mapping.findForward("frmOECStaffEdit");
        }
    }

    public ActionForward updateAreaChair(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HLCKrishnaStatelessRemote remote = initializeEJB(request);
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        String provisionalId = request.getParameter("provisionId");
        HLCCalendarVO calVO = new HLCCalendarVO();
        if (provisionalId != null && provisionalId.trim().length() != 0) {
            calVO = remote.getSingleEventDetails(provisionalId);
        }

        String areaChairList = request.getParameter("tempareaChairList");
        Debug.print("areaChairList in update" + areaChairList);
        String eventTitle = request.getParameter("txtEventTitle");
        String stDate = request.getParameter("startDate1");
        String enDate = request.getParameter("endDate");
        String entyStrtDate = request.getParameter("entryBeginDate");
        String entyEndDate = request.getParameter("entryEndDate");
        String extDueDate = request.getParameter("extDueDate");
        String compYear = request.getParameter("compYear");
        request.setAttribute("compYear", compYear);

        Date startDate = null;
        if (stDate != null && stDate.trim().length() != 0) {
            startDate = (Date) sdf.parse(stDate);
            Debug.print("startDate in servlet" + startDate);
        }
        Date endDate = null;
        if (enDate != null && enDate.trim().length() != 0) {
            endDate = (Date) sdf.parse(enDate);
        }
        Date entStartDate = null;
        if (entyStrtDate != null && entyStrtDate.trim().length() != 0) {
            entStartDate = (Date) sdf.parse(entyStrtDate);
        }

        Date entEndDate = null;
        if (entyEndDate != null && entyEndDate.trim().length() != 0) {
            entEndDate = (Date) sdf.parse(entyEndDate);
        }

        Date extndDueDate = null;
        if (extDueDate != null && extDueDate.trim().length() != 0) {
            extndDueDate = (Date) sdf.parse(extDueDate);
        }
        String areaName = request.getParameter("selAreaId");
        String stateName = request.getParameter("selStateId");
        String acComm = request.getParameter("txtACComm");
        java.sql.Date tempDate = new java.sql.Date((new java.util.Date()).getTime());
        String currentDate = String.valueOf(tempDate).substring(5, 7) + "/" + String.valueOf(tempDate).substring(8, 10) + "/" + String.valueOf(tempDate).substring(0, 4);
        String modifyBy = request.getParameter("modifyBy");
        String ipAddress = request.getRemoteAddr();
        String noDays = request.getParameter("noOfDays");

        int noOfDays = 0;
        if (noDays != null) {
            noOfDays = Integer.parseInt(noDays);
        }
        if (eventTitle != null && eventTitle.trim().length() != 0) {
            calVO.setEventTitle(eventTitle);
        } else {
            calVO.setEventTitle(null);
        }
        if (startDate != null) {
            calVO.setBeginDate(startDate);
        } else {
            calVO.setBeginDate(null);
        }
        if (entStartDate != null) {
            calVO.setEntryStrtDate(entStartDate);
        } else {
            calVO.setEntryStrtDate(null);
        }
        if (entEndDate != null) {
            calVO.setEntryEndDate(entEndDate);
        } else {
            calVO.setEntryEndDate(null);
        }
        if (extndDueDate != null) {
            calVO.setExtDueDate(extndDueDate);
        } else {
            calVO.setExtDueDate(null);
        }
        if (endDate != null) {
            calVO.setEndDate(endDate);
        } else {
            calVO.setEndDate(null);
        }
        if (areaName != null && areaName.trim().length() != 0) {
            calVO.setAreaId(areaName);
        } else {
            calVO.setAreaId(null);
        }
        if (stateName != null && stateName.trim().length() != 0) {
            calVO.setStateId(stateName);
        } else {
            calVO.setStateId(null);
        }

        if (acComm != null && acComm.trim().length() != 0) {
            calVO.setAreaChairCommt(acComm);
        } else {
            calVO.setAreaChairCommt(null);
        }

        if (tempDate != null) {
            calVO.setModifyDate(tempDate);
        } else {
            calVO.setModifyDate(null);
        }
        if (modifyBy != null && modifyBy.trim().length() != 0) {
            calVO.setModifyBy(modifyBy);
        } else {
            calVO.setModifyBy(null);
        }
        if (ipAddress != null && ipAddress.trim().length() != 0) {
            calVO.setIpAddress(ipAddress);
        } else {
            calVO.setIpAddress(null);
        }
        if (noOfDays != 0) {
            calVO.setNoDays(noOfDays);
        } else {
            calVO.setNoDays(0);
        }

        ArrayList ChampList = new ArrayList();
        /* String[] eventName = null;
        String eventId1 = calVO.getEventId();
        boolean deleteChamp = remote.deleteChampDetails(eventId1);
        Debug.print("deleteChamp :" + deleteChamp);
        int divSize1 = 0;
        String divisionSize1 = request.getParameter("allTypesVect");
        Debug.print("divisionSize1 in calender Action: " + divisionSize1);
        if (divisionSize1 != null && divisionSize1.trim().length() != 0) {
        divSize1 = Integer.parseInt(divisionSize1);
        }
        String txtEvent1 = "";
        String tmpVal = "";
        String[] str = {};
        String tmpType = "";
        String tmpLevel = "";
        boolean editResult = false;
        for (int i = 1; i <= divSize1; i++) {
        txtEvent1 = request.getParameter("txtEvent" + i);
        String champ = request.getParameter("champ" + i);
        if (txtEvent1 != null && txtEvent1.trim().length() != 0) {
        String champStatus = "false";
        Debug.print("champStatus in servlet" + champStatus);
        Debug.print("txtEvent1 in update" + txtEvent1);
        Pattern pat = Pattern.compile("#");
        str = pat.split(txtEvent1);
        String eventType = str[2];
        String eventLevel = str[0];
        String eventId = calVO.getEventId();
        Debug.print("eventType in update if loop:" + eventType);
        Debug.print("eventLevel in update if loop:" + eventLevel);
        String finalList[] = {provisionalId, eventId, eventType, eventLevel};
        ChampList.add(finalList);
        if (i == 1) {
        tmpVal = str[1];
        Debug.print("tmpVal in if loop:" + tmpVal);
        } else if (tmpVal == "") {
        tmpVal = str[1];
        Debug.print("tmpVal in empty loop:" + tmpVal);
        } else {
        tmpVal = tmpVal + "," + str[1];
        Debug.print("tmpVal in else loop:" + tmpVal);
        }
        if (champ != null && !(champ.equalsIgnoreCase("no"))) {
        Debug.print("champ in if loop:" + champ);
        champStatus = "true";
        }
        boolean flag = true;
        Debug.print("champStatus in the final:" + champStatus);
        String divisionId = "";
        boolean champRes = remote.updateChampDetails(provisionalId, eventId, eventType, eventLevel, champStatus, divisionId);
        if (champRes == true) {
        flag = true;
        } else {
        flag = false;
        }
        }
        }
        Debug.print("tmpVal :" + tmpVal);
        calVO.setEventLevel(tmpVal);
        editResult = remote.updateEventDetByAreaChair(calVO);
        boolean flag = true;
        if (flag == true) {
        return mapping.findForward("frmAreaChairEventDetailEditSuccess");
        } else {
        String err = "st";
        request.setAttribute("err", err);
        return mapping.findForward("frmOECAreaChairEdit");
        }*/
        String eventId1 = calVO.getEventId();
        boolean deleteChamp = remote.deleteChampDetails(eventId1);
        Debug.print("deleteChamp :" + deleteChamp);
        int divSize1 = 0;
        String divisionSize1 = request.getParameter("allTypesVect");
        Debug.print("divisionSize1 in calender Action: " + divisionSize1);

        if (divisionSize1 != null && divisionSize1.trim().length() != 0) {
            divSize1 = Integer.parseInt(divisionSize1);
        }
        String txtEvent1 = "";
        String tmpVal = "";
        String tmpVal1 = "";
        String[] str = {};
        String tmpType = "";
        String tmpLevel = "";
        String[] str1 = {};
        String txtDiv = "";
        String eventId = null;
        boolean editResult = false;
        for (int i = 1; i <= divSize1; i++) {
            txtEvent1 = request.getParameter("txtEvent" + i);
            String champ = request.getParameter("champ" + i);
            if (txtEvent1 != null && txtEvent1.trim().length() != 0) {
                String champStatus = "false";
                Debug.print("champStatus in servlet" + champStatus);
                Debug.print("txtEvent1 in update" + txtEvent1);
                Pattern pat = Pattern.compile("#");
                str = pat.split(txtEvent1);
                String eventType = str[2];
                String eventLevel = str[0];
                eventId = calVO.getEventId();
                String eventTypeName = remote.getEventTypeName(eventType);
                if (i == 1) {
                    tmpVal1 = eventTypeName;
                    Debug.print("tmpVal1 in if loop:" + tmpVal1);
                } else if (tmpVal1 == "") {
                    tmpVal = eventTypeName;
                    Debug.print("tmpVal1 in empty loop:" + tmpVal1);
                } else {
                    tmpVal1 = tmpVal1 + "," + eventTypeName;
                    Debug.print("tmpVal1 in else loop:" + tmpVal1);
                }
                Debug.print("eventType in update if loop:" + eventType);
                Debug.print("eventLevel in update if loop:" + eventLevel);
                String finalList[] = {provisionalId, eventId, eventType, eventLevel};
                ChampList.add(finalList);
                if (i == 1) {
                    tmpVal = str[1];
                    Debug.print("tmpVal in if loop:" + tmpVal);
                } else if (tmpVal == "") {
                    tmpVal = str[1];
                    Debug.print("tmpVal in empty loop:" + tmpVal);
                } else {
                    tmpVal = tmpVal + "," + str[1];
                    Debug.print("tmpVal in else loop:" + tmpVal);
                }
                if (champ != null && !(champ.equalsIgnoreCase("no"))) {
                    Debug.print("champ in if loop&&&&&&&&:" + champ);
                    champStatus = "true";
                }
                boolean flag = true;
                Debug.print("champStatus in the final:" + champStatus);

                int divSize = 0;
                String allDivisions = request.getParameter("allDivisions");
                Debug.print("allDivisions in calender Action: " + allDivisions);

                if (allDivisions != null && allDivisions.trim().length() != 0) {
                    divSize = Integer.parseInt(allDivisions);
                    Debug.print("divSize in calender Action: " + divSize);
                }
                for (int j = 0; j <= divSize; j++) {
                    txtDiv = request.getParameter("txtDiv" + i + "_" + j);
                    Debug.print("txtDiv in update" + txtDiv);
                    if (txtDiv != null && txtDiv.trim().length() != 0) {
                        String divisionId = "";
                        String divisionName = "";
                        Pattern pat1 = Pattern.compile("#");
                        str1 = pat1.split(txtDiv);
                        Debug.print("str1 in update" + str1);
                        divisionId = str1[0];
                        divisionName = str1[1];
                        /*if(divisionName.equalsIgnoreCase("Open"))
                        {
                        divisionId = null;
                        Debug.print("divisionId in if" + divisionId);
                        }*/
                        Debug.print("divisionId in update" + divisionId);
                        boolean champRes = remote.updateChampDetails(provisionalId, eventId, eventType, eventLevel, champStatus, divisionId);

                        if (champRes == true) {
                            flag = true;
                        } else {
                            flag = false;
                        }
                    }
                }
            }

        }

        boolean output1 = remote.eveDetailsExistsInEveTable(eventId);
        Debug.print("output1:" + output1);
        if (output1 == true) {

            boolean delRes = remote.deleteEveTypeDets(eventId);
            Debug.print("existRes in update of Calendar Action of delRes" + delRes);
            ArrayList eveChampLevlDets = remote.getChampionEveLevelDets(eventId);
            String mapTypeId = null;
            if (eveChampLevlDets != null && eveChampLevlDets.size() != 0) {
                Iterator itrSub = eveChampLevlDets.iterator();
                while (itrSub.hasNext()) {
                    String[] subEntry = (String[]) itrSub.next();
                    String levelId = subEntry[1];
                    String eveTypId = subEntry[3];

                    mapTypeId = remote.getEveTypLevelMapId(eveTypId, levelId);
                    Debug.print("existRes in update of Calendar Action of mapTypeId" + mapTypeId);

                    boolean mapResult = remote.insertMapDets(eventId, mapTypeId);

                }
            }
        }
        Debug.print("tmpVal :" + tmpVal);
        Debug.print("tmpVal1 :" + tmpVal1);
        calVO.setEventLevel(tmpVal);
        calVO.setEventTypeNames(tmpVal1);
        editResult = remote.updateEventDetByOrg(calVO);

        if (output1 == true) {

            boolean output = remote.updateEveDetsInMeeEventTable(calVO);
        }

        boolean flag = true;
        if (flag == true) {
            return mapping.findForward("frmAreaChairEventDetailEditSuccess");
        } else {
            String err = "st";
            request.setAttribute("err", err);
            return mapping.findForward("frmOECAreaChairEdit");
        }

    }

    public ActionForward initSearch(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HLCKrishnaStatelessRemote remote = initializeEJB(request);
        ArrayList selectAreaDetails = new ArrayList();
        selectAreaDetails = remote.getAllAreaMasters();
        request.setAttribute("selectAreaDetails", selectAreaDetails);
        return mapping.findForward("frmOECSearchEvents");
    }

    public ActionForward search(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HLCKrishnaStatelessRemote remote = initializeEJB(request);
        HLCMembershipQualificationMatrixRemote qremote = initializeEJB1(request);
        String eventId = request.getParameter("txtEventId");
        String eventTitle = request.getParameter("txtEventTitle");
        String areaId = request.getParameter("selArea");
        String compYear = request.getParameter("year");
        int tempYear = 0;
        String orgId = "";
        String orgFirstName = "";
        String orgLastName = "";
        if (compYear != null && compYear.trim().length() != 0) {
            tempYear = Integer.parseInt(compYear);
        }
        ArrayList selectEventDetails = new ArrayList();
        HLCCalendarVO objCalVO = new HLCCalendarVO();
        if (eventId != null && eventId.trim().length() != 0 || eventTitle != null && eventTitle.trim().length() != 0 || areaId != null && areaId.trim().length() != 0 || tempYear != 0) {
            selectEventDetails = remote.searchEventDetailsListAdmin(eventId, eventTitle, areaId, tempYear);
        }
        if (selectEventDetails != null && selectEventDetails.size() != 0) {
            Iterator itr = selectEventDetails.iterator();
            while (itr.hasNext()) {
                objCalVO = (HLCCalendarVO) itr.next();
                orgId = objCalVO.getOrganizerId();
                if (orgId != null && orgId.trim().length() != 0) {
                    HLCMemberVO meVO = qremote.getMemberDetails(orgId);
                    orgFirstName = meVO.getFirstName();
                    orgLastName = meVO.getLastName();
                    objCalVO.setOrgFName(orgFirstName);
                    objCalVO.setOrgLName(orgLastName);
                }
            }
        }

        request.setAttribute("selectEventDetails", selectEventDetails);

        ArrayList selectAreaDetails = new ArrayList();
        selectAreaDetails = remote.getAllAreaMasters();
        request.setAttribute("selectAreaDetails", selectAreaDetails);
        request.setAttribute("eventId", eventId);
        request.setAttribute("eventTitle", eventTitle);
        request.setAttribute("areaId", areaId);
        request.setAttribute("compYear", compYear);
        return mapping.findForward("frmOECSearchEvents");
    }

    public ActionForward searchView(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HLCKrishnaStatelessRemote remote = initializeEJB(request);
        String eventId = request.getParameter("eventId");
        HLCCalendarVO objCalVO = new HLCCalendarVO();
        if (eventId != null && eventId.trim().length() != 0) {
            objCalVO = remote.getSingleEventDetailsByEventId(eventId);
        }
        ArrayList eventDet = new ArrayList();
        eventDet = remote.getEventDetailsBasedOnEventId(eventId);
        String eventLevelNames = "";
        String eventTypeId = "";
        String eventLevelId = "";
        String eventTypeNames = "";
        ArrayList hm = new ArrayList();
        String eventLevel = "";
        String eventType = "";
        if (eventDet != null) {
            if (eventDet.size() != 0) {
                Iterator itr1 = eventDet.iterator();
                int j = 0;
                int i = 0;

                while (itr1.hasNext()) {
                    HLCCalendarVO objCalVO1 = (HLCCalendarVO) itr1.next();
                    String evId = objCalVO1.getEventId();
                    eventTypeId = objCalVO1.getEventTypeId();
                    eventLevelId = objCalVO1.getEventLevelId();
                    eventType = objCalVO1.getEventTypeNames();
                    eventLevel = objCalVO1.getEventLevel();
                    if (!hm.contains(objCalVO1.getEventTypeNames())) {
                        hm.add(objCalVO1.getEventTypeNames());
                    }
                    if (i == 0) {
                        eventLevelNames = objCalVO1.getEventLevel();
                    } else {
                        eventLevelNames = eventLevelNames + "," + objCalVO1.getEventLevel();
                    }
                    j++;
                    i++;
                }
                Iterator itrType = hm.iterator();
                while (itrType.hasNext()) {
                    String eventTypeStr = (String) itrType.next();
                    eventTypeNames = eventTypeStr + "," + eventTypeNames;
                }
                eventTypeNames = eventTypeNames.substring(0, eventTypeNames.length() - 1);
            }
        }
        request.setAttribute("objCalVO", objCalVO);
        request.setAttribute("eventLevelNames", eventLevelNames);
        request.setAttribute("eventTypeNames", eventTypeNames);
        return mapping.findForward("frmOECSearchEventsView");
    }

    public ActionForward eventView(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HLCKrishnaStatelessRemote remote = initializeEJB(request);
        String eventId = request.getParameter("eventId");
        HttpSession session = request.getSession(true);
        String compYear = (String) session.getAttribute("compYear");
        ArrayList eventDetails = new ArrayList();
        HLCCalendarVO objCalVO = new HLCCalendarVO();
        if (eventId != null && eventId.trim().length() != 0) {
            eventDetails = remote.searchEventDetailsListAdmin(eventId, null, null, Integer.parseInt(compYear));
        }
        if (eventDetails != null && eventDetails.size() != 0) {
            Iterator itr = eventDetails.iterator();
            while (itr.hasNext()) {
                objCalVO = (HLCCalendarVO) itr.next();
            }
        }
        request.setAttribute("objCalVO", objCalVO);
        return mapping.findForward("frmOECSearchEventsView");
    }

    public ActionForward searchEventView(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HLCKrishnaStatelessRemote remote = initializeEJB(request);
        HLCMembershipQualificationMatrixRemote qremote = initializeEJB1(request);
        HttpSession session = request.getSession(true);
        String eventId = request.getParameter("eventId");
        String organizerId = request.getParameter("orgId");
        String orgFirstName = "";
        String orgLastName = "";
        if (organizerId != null && organizerId.trim().length() != 0) {
            HLCMemberVO meVO = qremote.getMemberDetails(organizerId);
            orgFirstName = meVO.getFirstName();
            orgLastName = meVO.getLastName();
        }
        ArrayList eventDetails = new ArrayList();
        HLCCalendarVO objCalVO = new HLCCalendarVO();
        if (eventId != null && eventId.trim().length() != 0) {
            eventDetails = remote.searchEventDetailsListAdmin(eventId, null, null, 0);
        }
        if (eventDetails != null && eventDetails.size() != 0) {
            Iterator itr = eventDetails.iterator();
            while (itr.hasNext()) {
                objCalVO = (HLCCalendarVO) itr.next();
            }
        }
        request.setAttribute("objCalVO", objCalVO);
        request.setAttribute("oFirstName", orgFirstName);
        request.setAttribute("oLastName", orgLastName);
        session.removeAttribute("orgFirstName");
        session.removeAttribute("orgLastName");
        return mapping.findForward("frmOECSearchEventsView");
    }

// for Deleting Calendar Details
    public ActionForward initDelete(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        return mapping.findForward("frmDeleteCalDetails");
    }

    public ActionForward deleteCalendar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HLCKrishnaStatelessRemote remote = initializeEJB(request);
        String year = request.getParameter("year");
        Debug.print("year in deleteCalendar :" + year);
        boolean deleteResult = false;
        if (year != null && year.trim().length() != 0) {
            ArrayList calIds = new ArrayList();
            calIds = remote.getProvCalIdBasedOnYear(year);
            if (calIds != null && calIds.size() != 0) {
                if (calIds != null && calIds.size() != 0) {
                    Iterator itr = calIds.iterator();
                    while (itr.hasNext()) {
                        String[] str = (String[]) itr.next();
                        String calId = str[0];
                        deleteResult = remote.deleteCalendarDetails(calId);
                    }
                }
            }
        }
        if (deleteResult == true) {
            request.setAttribute("status", "success");
            request.setAttribute("selectedYear", year);
            return mapping.findForward("frmDeleteCalDetails");
        } else {
            request.setAttribute("status", "failure");
            request.setAttribute("selectedYear", year);
            return mapping.findForward("frmDeleteCalDetails");
        }

    }

    private HLCKrishnaStatelessRemote initializeEJB(HttpServletRequest request) throws Exception {
        MessageResources mr = getResources(request);
        String namingfactory = mr.getMessage("ejbclient.namingfactory");
        String contextfactory = mr.getMessage("ejbclient.contextfactory");
        String urlprovider = mr.getMessage("ejbclient.urlprovider");
        String lookupip = mr.getMessage("ejbclient.ip");
        String jndiname = mr.getMessage("jndi.pc");

        System.setProperty(namingfactory, contextfactory);
        System.setProperty(urlprovider, lookupip);

        Context jndiContext = new InitialContext();
        Object objref = jndiContext.lookup(jndiname);
        HLCKrishnaStatelessRemoteHome home = (HLCKrishnaStatelessRemoteHome) javax.rmi.PortableRemoteObject.narrow(objref, HLCKrishnaStatelessRemoteHome.class);
        HLCKrishnaStatelessRemote remote = home.create();

        return remote;
    }
private HLCMembershipQualificationMatrixRemote initializeEJB1(HttpServletRequest request) throws Exception {
        MessageResources mr = getResources(request);
        String namingfactory = mr.getMessage("ejbclient.namingfactory");
        String contextfactory = mr.getMessage("ejbclient.contextfactory");
        String urlprovider = mr.getMessage("ejbclient.urlprovider");
        String lookupip = mr.getMessage("ejbclient.ip");
        String jndiname = mr.getMessage("jndi.mqm");

        System.setProperty(namingfactory, contextfactory);
        System.setProperty(urlprovider, lookupip);

        Context jndiContext = new InitialContext();
        Object objref = jndiContext.lookup(jndiname);
        HLCMembershipQualificationMatrixRemoteHome home = (HLCMembershipQualificationMatrixRemoteHome) javax.rmi.PortableRemoteObject.narrow(objref, HLCMembershipQualificationMatrixRemoteHome.class);
        HLCMembershipQualificationMatrixRemote remote = home.create();

        return remote;
    }
    
}
