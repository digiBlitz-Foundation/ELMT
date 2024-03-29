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
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/validate.js" type="text/javascript" ></script>
<script src="javascripts/frmMembRegi.js" type="text/javascript" ></script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
</head>

<body>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab">
  <tr>
    <td class="alignTop">
		<!-- HEADER STARTS HERE -->
		<%@ include file = "include/header.jsp" %>
		<!-- HEADER ENDS HERE -->
	</td>
  </tr>
  <tr>
    <td class="infoBar">
		<!-- INFO BAR STARTS HERE -->
		<%@ include file = "include/infobar.jsp" %>
		<!-- INFO BAR ENDS HERE -->	
	</td>
  </tr>
  <tr>
    <td class="tableCommonBg">
		
		<table width="760" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
		  
		  <tr>
			<td width="230" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
			<%@ include file = "include/menu.jsp" %>
			<!-- LEFT MENU ENDS HERE -->

		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				<div class="cmmnForm">
						<div class="colspan">
							<strong>Membership</strong>: <span class="styleBoldTwo">User Registration Form</span> 
						</div>
						<div id="commonBG" class="textCommon" style="height:100px;">
							<img src="images/usea_logo.jpg" class="imgFloatLeft" /><strong>User, please take your time and register to avail the privileges that accompanies with it. <br />
							<br />
							Note:<span class="textCommon" style="height:100px;">This registration process does not make you a member.</span><br />
							You may   become an Member by filling up the Membership Application form towards the end of this registration process.<br />
							</strong><br />
						</div>
					
						<form name="frmMembRegi" id="myform" class="formcss" action="">
					
								<div id="parta" >	
								<!-- **************************************** Part A of the form starts here *********************************************** -->
											
											
												<div class="rowHead">
													Basic Information:
												</div>
														<div class="row">
															<span class="label">Salutation:</span>
															<span class="formX">
															<select name="select" id="select" class="selectboxOne">
															  <option selected="selected">Select One</option>
															  <option>Mr.</option>
															  <option>Mrs.</option>
															  <option>Miss.</option>
															  <option>Ms.</option>
															</select>
															</span>
														</div>
														<div class="row">
															<span class="label">First Name:</span>
															<span class="formX"><input type="text" class="textboxOne" size="20" /></span>
														</div>
														<div class="row">
															<span class="label">Middle Name:</span>
															<span class="formX"><input type="text" class="textboxOne" size="20" /></span>
														</div>
														<div class="row">
															<span class="label">Last Name:</span>
															<span class="formX"><input type="text" class="textboxOne" size="20" /></span>
														</div>
														<div class="row">
															<span class="label">Suffix:</span>
															<span class="formX"><input type="text" class="textboxOne" size="20" /></span>
														</div>
														<div class="row">
															<span class="label">Date of Birth :</span>
															<span class="formX">
																	<select name="birthmonth" id="select" class="selectboxOne">
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
																	<select name="birthday" id="select" class="selectboxOne">
																	  <option value="" selected="selected">Day</option>
																	  <option value="01">01</option>
																	  <option value="02">02</option>
																	  <option value="03">03</option>
																	  <option value="04">04</option>
																	  <option value="05">05</option>
																	  <option value="06">06</option>
																	  <option value="07">07</option>
																	  <option value="08">08</option>
																	  <option value="09">09</option>
																	  <option value="10">10</option>
																	  <option value="11">11</option>
																	  <option value="12">12</option>
																	  <option value="13">13</option>
																	  <option value="14">14</option>
																	  <option value="15">15</option>
																	  <option value="16">16</option>
																	  <option value="17">17</option>
																	  <option value="18">18</option>
																	  <option value="19">19</option>
																	  <option value="20">20</option>
																	  <option value="21">21</option>
																	  <option value="22">22</option>
																	  <option value="23">23</option>
																	  <option value="24">24</option>
																	  <option value="25">25</option>
																	  <option value="26">26</option>
																	  <option value="27">27</option>
																	  <option value="28">28</option>
																	  <option value="29">29</option>
																	  <option value="30">30</option>
																	  <option value="31">31</option>
					
																	</select>
																	<select name="birthyear" id="select" class="selectboxOne">
																		  <option value="" selected="selected" >Year</option>
																		  <option  value="1960">1960</option>
																		  <option  value="1961">1961</option>
																		  <option  value="1962">1962</option>
																		  <option  value="1963">1963</option>
																		  <option  value="1964">1964</option>
																		  <option  value="1965">1965</option>
																		  <option  value="1966">1966</option>
																		  <option  value="1967">1967</option>
																		  <option  value="1968">1968</option>
																		  <option  value="1969">1969</option>
																		  <option  value="1969">1970</option>
																	</select>
															
															
															</span>
														</div>
														<div class="row">
															<span class="label">Gender:</span>
															<span class="floatLeft">
															<input type="radio" size="10" name="gender" value="male" /> Male
															<input type="radio" size="10" name="gender" value="female" /> Female
															</span>
														</div>
														<div class="row">
															<span class="label">Phone:</span>
															<span class="formX"><input type="text" class="textboxOne" size="15" /></span>
														</div>
														<div class="row">
															<span class="label">Mobile:</span>
															<span class="formX"><input type="text" class="textboxOne" size="15" /></span>
														</div>
														<div class="row">
															<span class="label">Fax:</span>
															<span class="formX"><input type="text" class="textboxOne" size="15" /></span>
														</div>
														<div class="row">
															<span class="label">EMail (Login ID):</span>
															<span class="formX"><input type="text" class="textboxOne" size="25" /></span>
														</div>
														<div class="row">
															<span class="label">Choose Your Password:</span>
															<span class="formX"><input type="Password" class="textboxOne" size="25" />
															</span>
														</div>
														<div class="row">
															<span class="label">Re-Type Password:</span>
															<span class="formX"><input type="Password" class="textboxOne" size="25" />
															</span>
														</div>
														<div class="row">
															<span class="label">Choose A Secret Question:</span>
															<span class="formX">
															<select name="myselect" id="select" class="selectboxOne">
															  <option selected="selected">Select One</option>
															  <option>What is your favorite passtime?</option>
															  <option>What is your pet's name?</option>
															  <option>What was your first car?</option>
															  <option>What is your mother's first name?</option>
															  <option>Which is your favorite vacation spot?</option>
															</select>
															</span>
														</div>
														<div class="row">
															<span class="label">Your Answer To This Question:</span>
															<span class="formX"><input type="text" class="textboxOne" size="30" /></span>
														</div>
														<div class="row">
															<span class="label">Address Types:</span>
															<span class="formX">
																<div class="floatLeft"><input type="checkbox" id="priAdd_cbx" size="10" checked="checked" onclick="defaultPriAdd();"/> Primary Address</div>
															</span>
															<span class="formX">
																<div class="floatLeft"><input type="checkbox" id="secAdd_cbx" size="10" onclick="return hide_switchDiv();"/> Secondary Address</div>
															</span>
														</div>
														
												<div id="pAdd">
														
														<div class="colspan">
															<strong>Primary Address </strong> 
														</div>
																<div class="row">
																	<span class="label">Address:</span>
																	<span class="formX"> <input type="text" id="pAdd_txt" class="textboxOne" size="35" /></span>
																</div>
																<div class="row">
																	<span class="label">Country:</span>
																	<span class="formX">
																	<select name="myselect" id="pCountry_sel" class="selectboxOne">
																	  <option selected="selected">Select One</option>
																	  <option value="United States of America">United States of America</option>
																	</select>
																	</span>
																</div>
																<div class="row">
																	<span class="label">State:</span>
																	<span class="formX">
																	<select name="myselect" id="pState_sel" class="selectboxOne">
																	  <option selected="selected">Select One</option>
																	  <option value="FL">FL</option>
																	  <option value="VA">VA</option>
																	</select>
																	</span>
																</div>
																<div class="row">
																	<span class="label">City:</span>
																	<span class="formX">
																	<input type="text" id="pCity_txt" class="textboxOne" size="20" />
																	</span>
																</div>
																<div class="row">
																	<span class="label">Zipcode:</span>
																	<span class="formX"><input type="text" id="pZip_txt" class="textboxOne" size="8" /></span>
																</div>
												</div>
												
												<div id="sAdd">
														
														<div class="colspan">
															<strong>Secondary Address </strong> 
														</div>
														<div class="row">
															<div class="floatLeft"><input type="checkbox" id="priSecAdd_cbx" size="10"  onclick="return verify_address();"/> Check if Primary Address is same as Secondary Address.</div> 
														</div>
																<div class="row">
																	<span class="label">Address:</span>
																	<span class="formX"> <input type="text" id="sAdd_txt" class="textboxOne" size="35" /></span>
																</div>
																<div class="row">
																	<span class="label">Country:</span>
																	<span class="formX"><input type="text" id="sCountry_txt" class="textboxOne" size="30" /></span>
																</div>
																<div class="row">
																	<span class="label">State:</span>
																	<span class="formX"><input type="text" id="sState_txt" class="textboxOne" size="25" /></span>
																</div>
																<div class="row">
																	<span class="label">City:</span>
																	<span class="formX"><input type="text" id="sCity_txt" class="textboxOne" size="20" /></span>
																</div>
																<div class="row">
																	<span class="label">Zipcode:</span>
																	<span class="formX"><input type="text" id="sZip_txt" class="textboxOne" size="8" /></span>
																</div>
																
												</div>
												
														<div class="row">
															<span class="label">preferred Communication Address:</span>
															<span class="formX">
															<select name="myselect" id="comAdd_sel" class="selectboxOne" onchange="return hideTwo_switchDiv();">
															  <option selected="selected" value="1">Primary Address</option>
															  <option value="2">Secondary Address</option>
															</select>
															</span>
														</div>
														<!-- spacer starts-->
														<div class="spacer">&nbsp;</div>	
														<!-- spacer ends-->
												
					
													<div class="row">
														<span class="label">&nbsp;</span>
														<span class="formX"><input type="button" value="Register Now" class="gradBtn" /></span>
													</div>
												
														<!-- spacer starts-->
														<div class="spacer">&nbsp;</div>	
														<!-- spacer ends-->
														<!-- spacer starts-->
														<div class="spacer">&nbsp;</div>	
														<!-- spacer ends-->
												
											<!-- **************************************** Part A of the form Ends here *********************************************** -->	
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
			<%@ include file = "include/footer.jsp" %>
		<!-- FOOTER ENDS HERE -->
	</td>
  </tr>
</table>


 

</body>
</html>
