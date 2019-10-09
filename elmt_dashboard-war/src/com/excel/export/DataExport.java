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
package com.excel.export;

import java.io.File;
import java.io.OutputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCell;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class DataExport {
    /** excel template file */
    private String templatefile = null;
    
    /** data to export */
    private ArrayList  datasource = null;
    
    /** 
     * column names, excel columns should be in 
     * the same order (and number) of table fields. 
    */
    private String[] columnnames = null;
    
    /** response to write to */
    private HttpServletResponse response = null;
    
    /** output file name */
    private String outputfile;
    
    /** row number begin to write data */
    private int rowno;
    
    public void setColumnnames(String[] columnnames) {
        this.columnnames = columnnames;
    }
    
    public void setOutputfile(String outputfile) {
        this.outputfile = outputfile;
    }
    
    public void setDatasource(ArrayList datasource) {
        this.datasource = datasource;
    }
    
    public void setTemplatefile(String templatefile) {
        this.templatefile = templatefile;
    }
    
    public void setResponse(HttpServletResponse response) {
        this.response = response;
    }
    
 public void setRowno(int rowno) {
  this.rowno = rowno;
 }
 
    /**
     * get file saved in WEB-INF/classes directory.
     * 
     * @param fileName file name to be retrieved
     * @return File or null if the file is not exist
     */
    public File getResource(String fileName) { 
        URL url = this.getClass().getResource("/" + fileName); 
        return url != null ? new File(url.getFile()): null; 
    } 
    
    /**
     * Export data to excel file
     */
    public void export() {
        Workbook workbook;
        WritableWorkbook w;
        Label label;
        int currentRow = rowno;
        try {
         OutputStream out = null;
            response.reset();
            response.setContentType("application/vnd.ms-excel");
           response.setHeader("Content-Disposition", "attachment; filename=" + outputfile);
           
           // creates a readable spreadsheet using the excel template
           workbook = Workbook.getWorkbook(getResource(templatefile));
           
           // obtain a writable version of this spreadsheet
           out = response.getOutputStream();
            w = Workbook.createWorkbook(out, workbook);
            WritableSheet sheet = w.getSheet(0); 
            
            WritableFont font = new WritableFont(WritableFont.createFont("Arial"), 10); 
            WritableCellFormat format = new WritableCellFormat(font);
            format.setAlignment(Alignment.RIGHT);
            format.setVerticalAlignment(VerticalAlignment.JUSTIFY);
            format.setBorder(Border.ALL, BorderLineStyle.THIN);
            
            // write data to excel
            Iterator iterator = datasource.iterator();
            Map map = null;
            int cols = columnnames.length;
            int rowCount = 0;
            while (iterator.hasNext()) {
                sheet.insertRow(currentRow);
                map = (Map)iterator.next();
                if(rowCount==0) {
                    WritableFont  headFont = new WritableFont(WritableFont.createFont("Arial"), 10,WritableFont.BOLD);
                    WritableCellFormat headFormat = new WritableCellFormat(headFont); 
                    headFormat.setAlignment(Alignment.LEFT);               
                    for (int i = 0; i < cols; i++) {
                       label = new Label(i, currentRow, "" + columnnames[i]);
                       label.setCellFormat(headFormat); 
                       sheet.addCell(label);                      
                     }
                      currentRow++;
               } 
                for (int i = 0; i < cols; i++) {
                    label = new Label(i, currentRow, "" + map.get(columnnames[i]).toString());
                    label.setCellFormat(format);
                    sheet.addCell(label);
                }
                currentRow++;
            }
           w.write();
           w.close();
           if (out != null) out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
