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
package com.hlcmsg.groups;

import com.hlccommon.util.Debug;
import javax.naming.Context;
import java.util.Properties;
import java.util.*;

public class HLCTestClient {
    public static void main( String [] args )   {
        try {
            Context jndiContext = getInitialContext();
            Object obj=jndiContext.lookup("ejb/HLCMessageSessionEJBJNDI");
            HLCMessageSessionRemoteHome msgHome = (HLCMessageSessionRemoteHome)
            javax.rmi.PortableRemoteObject.narrow(obj,HLCMessageSessionRemoteHome.class);
            HLCMessageSessionRemote msgRemote = msgHome.create();
   
            Debug.print("Started() Called:");
  
           // ======= Msg Composing =======//
       /*    boolean result = msgRemote.composeMessage("45acee3b-493e-4fe7-b523-3db914bb00cd","manas@digiblitz.com","Test Msg  harmohan","This is from harmohan");
           Debug.print("Result:"+ result);
           
            result = msgRemote.composeMessage("ff093ecd-e823-4e36-acb9-cef71534dd74","manas@digiblitz.com","Test Msg from Manas","this is from Manas");
            Debug.print("Result:"+ result);


            result = msgRemote.composeMessage("3df4a76e-d0ac-4795-b760-8ac45898ea9d","manas@digiblitz.com","Test Msg sathish","This is from Sathish");
            Debug.print("Result:"+ result);


            result = msgRemote.composeMessage("9c19ea88-8c8d-4f23-a749-c5dd251094eb","manas@digiblitz.com","Test Msg raja","This is from raja");
            Debug.print("Result:"+ result);
*/
           
            // ======= Show Inbox =======//
        /*   ArrayList li = (ArrayList)msgRemote.showInbox("3df4a76e-d0ac-4795-b760-8ac45898ea9d",1,2);
           Iterator its = li.iterator();
           while(its.hasNext()){
                MessageVO msgVO = (MessageVO)its.next();
                Debug.print("Result:" + msgVO);
            }
          */  
             // ======= Delete Inbox msg =======//
          // boolean result = msgRemote.deleteMessages("e037d309-e1fc-45a4-a633-d8b96cdeaf55#1d8c33b0-4731-46a5-aa39-917c0f3c0a15");
         //  Debug.print("Result:"+ result);
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
    public static Context getInitialContext()
        throws javax.naming.NamingException {
        Properties p =new Properties();
        p.setProperty( "java.naming.factory.initial", "org.jnp.interfaces.NamingContextFactory" );
        p.setProperty( "java.naming.factory.url.pkgs", "org.jboss.naming:org.jnp.interfaces" );
        p.setProperty( "java.naming.provider.url", "localhost:11199" );
        return new javax.naming.InitialContext(p);
    }
}