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
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="headerTab">
		  <tr>
			<td bgcolor="#FFFFFF" class="alignTop">
				<!-- top navibar Starts Here -->
				<table width="740" border="0" align="center" cellpadding="0" cellspacing="0" id="topNavibarTab">
				  <tr>
					<td width="78" class="alignTop"><img src="images/btn_MainNavHome.jpg" width="78" height="17" border="0" usemap="#Map" class="imgFloatLeftTwo"/></td>
					<td width="10" class="alignTop"><span class="divider">|</span></td>
					<td width="78" class="alignTop"><img src="images/btn_MainNavAbout.jpg" width="78" height="17" border="0" usemap="#Map2" class="imgFloatLeftTwo"/></td>
					<td width="245" class="alignTop">&nbsp;</td>
					<td width="230" class="alignTop">
						<div class="alignRight"> 
														
							<span class="welcome">Welcome Guest!</span> 
							<span class="divider">|</span> 
							<a href="./login.jsp" class="linkOne">LOGOUT</a> 
							<span class="divider">|</span>
							
							
						</div>
					</td>
					<td width="110" class="alignLeft">
						<span class="date">&nbsp;
							<SCRIPT LANGUAGE="JavaScript">
								if(navigator.appName == "Netscape") {
									document.write(isnDays[today.getDay()+1]+", "+isnMonths[today.getMonth()+1]+" "+today.getDate()+", "+ (today.getYear()+1900));
								}else{
								document.write(isnDays[today.getDay()+1]+", "+isnMonths[today.getMonth()+1]+" "+today.getDate()+", "+today.getYear());
								}  
							</SCRIPT>
						</span>
					</td>
				  </tr>
				</table>
				<!-- top navibar Ends Here -->
			</td>
		  </tr>
		  <tr>
		    <td class="logoRow">
			<table width="758" border="0" align="center" cellpadding="0" cellspacing="0" id="logoTimeHolderTab">
              <tr>
                <td width="280" class="logo"><a href="index.jsp">
                <div class="tabPad">&nbsp;</div>
                </a></td>
                <td class="alignRight">
				<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="133" height="41">
                  <param name="movie" value="swf/time-piece-store.swf" />
                  <param name="quality" value="high" />
				  <param name="showmenu" value="false" />
                  <embed src="swf/time-piece-store.swf" menu="false" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="133" height="41"></embed>
                </object>
				</td>
              </tr>
            </table></td>
	      </tr>
		  <tr>
			<td class="searchBar">
				<!-- INFO BAR STARTS HERE -->	
				<table width="75%" border="0" align="center" cellpadding="0" cellspacing="0" id="searchTab">
                  <tr>
                    <td align="right" class="styleBoldThree">Product Search: </td>
                    <td class="alignCenter">
                      <select name="prodCat" id="prodCat_sel" class="selectboxOne">
						  <option selected="selected" value="">Select One</option>
						  <option value="">Product Category One</option>
						  <option value="">Product Category Two</option>
                    </select>                    </td>
                    <td width="20%" class="alignLeft"><input name="prodSearch" type="text" class="textboxOne" size="35" /></td>
                    <td class="alignLeft"><input type="button" name="Submit" value="SEARCH" class="gradTwoBtn" /></td>
                  </tr>
              </table>
				<!-- INFO BAR ENDS HERE -->
			</td>
		  </tr>


</table>

<map name="Map" id="Map">
<area shape="rect" coords="2,0,77,15" href="http://www.useventing.com" alt="EID Home" />
</map>

<map name="Map2" id="Map2">
<area shape="rect" coords="2,0,77,15" href="#" alt="About EID" />
</map>