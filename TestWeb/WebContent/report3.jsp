<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Report 2 </title>


<script src="report.js"></script>
</head>
<body>
<FORM method="post" action="ReportController" name="Report" target="_self">
<INPUT type="hidden" name="methodName" value="getReport">

<%
String contextType = (String)request.getAttribute("contextType");
if (contextType == null)
	contextType = "text/html";
response.setContentType(contextType);

%>

	Welcome 3
/*----------------------------------------------------------------------------------------------*/
/* Document Description: 	This stylesheet is used to bolt onto the primary css with additional*/ 
/*						 	formatting used specifically for the annual compensation process.	*/
/* Created By:  		 	Stephen Garcia SG4759												*/
/* Create Date: 		 	7/12/2010															*/
/* 																								*/
/*----------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------*/
/* Known CSS Issues:         																	*/
/* 1. IE6 margin Bug:		If you float a block and try to apply a to the same side of the    	*/
/*							float then IE 6 will double the margin.  In order to combat this 	*/
/*							flaw, try to use padding on a parent container.  Or you can affix 	*/
/*							* html #IDOffloated_margined_Object {display:inline;} to your CSS.	*/
/*							Also, you can 1/2 the margins you use.								*/
/*																								*/
/* 2. IE6 min-height bug:	IE 6 does not recognize the min-height property; therefore, in    	*/
/*							order to establish a min-height on our pages we will need to use 	*/
/*							the following hack: * html #ID_of__Object {height: XXXpx;} where	*/
/*							XXX is an integer value determining the height						*/
/*----------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------*/
/* Modification Log:																			*/
/*----------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------*/
/* CSS Ordering:	         																	*/
/* Section Description: 	Once a style sheet begins to grow, I have found that searching 	    */ 
/*						 	through the various attributes can be quite cumbersome; therefore,	*/
/*						 	we have decided upon an ordering scheme to help us navigate this	*/
/*						 	document.  The philosophy we employed is structure/layout first 	*/
/*						 	followed by alignment, border, backgrounds, fonts and various 		*/
/*						 	other elements. Try to think of outside in (e.g. border ->			*/
/*						 	background -> fonts ->... Also, when using top, right, bottom, left */
/*						 	keep it in that order, clockwise. These are not absolutes; rather,  */
/*						 	they are guidelines, which will help us navigate CSS elements 		*/
/*						 	efficiently.														*/
/*							1.	display															*/
/*							2. 	position 														*/
/*							3. 	float															*/
/*							4. 	clear															*/
/*							5. 	height															*/
/*							6. 	min-height														*/
/*							7. 	width															*/
/*							8. 	min-width														*/
/*							9. 	overflow														*/
/*							10.	top, right, bottom, left										*/
/*							11.	margin (top, right, bottom, left)								*/
/*							12.	padding (top, right, bottom, left)								*/
/*							13. align															*/
/*							14.	vertical-align													*/
/*							15.	border (top, right, bottom, left)								*/
/*							16. border attributes												*/
/*							17.	background														*/
/*							18. background attributes											*/
/*							19.	font															*/
/*							20.	font attributes													*/
/*							21.	color															*/
/*----------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------*/
/* Section 1: 				Header Styles. 														*/
/* Section Description: 	AC has a number of data display elements, which are					*/
/*							located at the top of the page, those areas need framed areas to 	*/
/*							reside.																*/
/*----------------------------------------------------------------------------------------------*/
table.comp_letter_decide
	{
	padding: 2px;
	border: none;		
	background-color: #fff;
 	text-align: left;
	vertical-align: top;
	font: 12px Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	/*color: #808080;*/
	/*SG4759 06/28/2011 Removed above Inserted Below*/
	color: #000;
	}

thead th.comp_letter_decide
	{
	background-color: #fff;		
 	text-align: left;
	vertical-align: bottom;
	font: 12px Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	/*color: #808080;*/
	/*SG4759 06/28/2011 Removed above Inserted Below*/
	color: #000;
	}
	
.ac_head_full_uline
	{
	float: left;
	width: 895px;
	margin-right: 5px;
	border-bottom: 1px solid #808080;
	font: 11px Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	text-align: center;
	}
/* Margin Hack			*/
* html .ac_head_full_uline {display:inline;}

.ac_head_left_uline
	{
	float: left;
	width: 445px;
	margin-right: 5px;
	border-bottom: 1px solid #808080;
	font: 11px Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	text-align: center;
	}
/* Margin Hack			*/
* html .ac_head_left_uline {display:inline;}

.ac_head_right_uline
	{
	float: left;
	width: 445px;
	margin-left: 5px;
	border-bottom: 1px solid #808080;
	font: 11px Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;	
	text-align: center;	
	}
/* Margin Hack			*/
* html .ac_head_right_uline {display:inline;}

/* CSS Document */
.ac_head_left_full
	{
	float: left;
	width: 895px;
	margin-right: 5px;
	font: 10px Verdana, Arial, Helvetica, sans-serif;
	text-align: left;
	}
/* Margin Hack			*/
* html .ac_head_left_full {display:inline;}

/* CSS Document */
.ac_head_left
	{
	float: left;
	width: 445px;
	margin-right: 5px;
	font: 10px Verdana, Arial, Helvetica, sans-serif;
	text-align: left;
	}
/* Margin Hack			*/
* html .ac_head_left {display:inline;}

.ac_head_right
	{
	float: left;
	width: 445px;
	margin-left: 5px;
	border-bottom: 2px solid #000;
	font: 10px Verdana, Arial, Helvetica, sans-serif;
	text-align: center;	
	}
/* Margin Hack			*/
* html .ac_head_right {display:inline;}

.ac_head_right_split_left
	{
	float: left;
	width: 345px;
	margin-left: 5px;
	font: 10px Verdana, Arial, Helvetica, sans-serif;
	text-align: right;
	}
/* Margin Hack			*/
* html .ac_head_right_split_left {display:inline;}

.ac_head_right_split_right
	{
	float: left;
	width: 90px;
	font: 10px Verdana, Arial, Helvetica, sans-serif;
	text-align: right;
	}
/* Margin Hack			*/
* html .ac_head_right_split_right {display:inline;}

/*----------------------------------------------------------------------------------------------*/
/* Section 2: 				Input Styles 														*/
/* Section Description: 	AC uses a number of different input fields to display, hold, and 	*/
/*							alter user input.  This section controls those input fields. 		*/
/*----------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------*/
/* IE 6 Issue: 				attribute selectors 												*/
/* Section Description: 	Unforunetely, ie6 does not understand attribute selectors.  You will*/
/*							see below that input has an attribute selector of type=text. Since  */
/*							input has many types, I wanted to use the attribute selector to 	*/
/*							steamline the number of properties set by defining the higher level */
/*							css definitions to the base input object.  Once we are all running	*/
/*							ie7 or higher we can streamline this section						*/
/*----------------------------------------------------------------------------------------------*/
input[type=text]
	{
	padding: 0px;
	vertical-align: bottom;	
	background: inherit;
	font: 10px Verdana, Arial, Helvetica, sans-serif;
	/*color: #808080;*/
	/*SG4759 06/28/2011 Removed above Inserted Below*/
	color: #000;
	}

/*Small Currency Input*/
input.ac_small_currency
	{
	width: 63px;
	border: 1px solid #000;
	padding: 0px;
	vertical-align: bottom;	
	background: inherit;
	font: 10px Verdana, Arial, Helvetica, sans-serif;	
	text-align: right;
	color: #000;
	}
	
input.ac_small_currency_ro
	{
	width: 63px;
	border: medium none;
	padding: 0px;
	vertical-align: bottom;	
	background: inherit;
	font: 10px Verdana, Arial, Helvetica, sans-serif;
	text-align: right;	
	/*color: #808080;*/
	/*SG4759 06/28/2011 Removed above Inserted Below*/
	color: #000;
	}

/*Regular Currency Input*/
input.ac_currency
	{
	width: 70px;
	border: 1px solid #000;
	padding: 0px;
	vertical-align: bottom;	
	background: inherit;
	font: 10px Verdana, Arial, Helvetica, sans-serif;
	text-align: right;	
	color: #000;	
	}

input.ac_currency_ro
	{
	width: 70px;
	border: medium none;
	padding: 0px;
	vertical-align: bottom;	
	background: inherit;
	font: 10px Verdana, Arial, Helvetica, sans-serif;
	text-align: right;	
	/*color: #808080;*/
	/*SG4759 06/28/2011 Removed above Inserted Below*/
	color: #000;
	}

input.ac_tsr_ro
	{
	width: 110px;
	border: medium none;
	padding: 0px;
	vertical-align: bottom;	
	background: inherit;
	font: 10px Verdana, Arial, Helvetica, sans-serif;
	text-align: right;	
	/*color: #808080;*/
	/*SG4759 06/28/2011 Removed above Inserted Below*/
	color: #000;
	}

/*Regular Percent Input*/
input.ac_percent_ro
	{
	width: 45px;
	border: medium none;
	padding: 0px;
	vertical-align: bottom;	
	background: inherit;
	font: 10px Verdana, Arial, Helvetica, sans-serif;
	text-align: right;	
	/*color: #808080;*/
	/*SG4759 06/28/2011 Removed above Inserted Below*/
	color: #000;
	}
	
/*Regular ePerf Input*/
input.ac_ranks
	{
	width: 30px;
	border: 1px solid #000;
	padding: 0px;
	vertical-align: bottom;	
	background: inherit;
	font: 10px Verdana, Arial, Helvetica, sans-serif;
	text-align: right;	
	color: #000;
	}
	
input.ac_ranks_ro
	{
	width: 30px;
	border: medium none;
	padding: 0px;
	vertical-align: bottom;	
	background: inherit;
	font: 10px Verdana, Arial, Helvetica, sans-serif;
	text-align: right;	
	/*color: #808080;*/
	/*SG4759 06/28/2011 Removed above Inserted Below*/
	color: #000;
	}	
/*----------------------------------------------------------*/


/*----------------------------------------------------------------------------------------------*/
/* Section 2: 				Link Styles 														*/
/* Section Description: 	Self explanatory.												 	*/
/*----------------------------------------------------------------------------------------------*/	
thead th a:visited,
thead th a:active,
thead th a:link
	{
	font: 10px Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	color: #fff;
	}

/*----------------------------------------------------------------------------------------------*/
/* Section 2: 				Notes		 														*/
/* Section Description: 	Controls the display of notes used through out the application. 	*/
/*----------------------------------------------------------------------------------------------*/	
#BudgetNote,
#BonusShiftNote,
#AggregateNote,
#FooterNotes,
#SalesNote,
#Mode,
#txtLTFooterNote,
#AltRecNote,
#txtKCAFooterNote,
#NoteDisplay
	{
	margin-left: 15px;
	}
/*----------------------------------------------------------------------------------------------*/
/* Section 2: 				History Display 													*/
/* Section Description: 	We display various historical data through out the site.  This  	*/
/*							section controls the various portions of that functionality 		*/
/*----------------------------------------------------------------------------------------------*/		
#history
	{
	z-index: 5;
	position: absolute;
	top: 0px;
	left: 0px;
	visibility: hidden;
	background-color: #fff;
	}
	
#NewRationale
	{
	z-index:10000;
	position: absolute;
	top: 0px;
	left: 0px;
	width: 600px;
	height: 275px;
	visibility: hidden;
	background-color: #fff;
	border: 1px solid #000;
	}
	
#DragBar
	{
	position: relative;
	width: 600px;
	height: 40px;
	background: url(../images/rationaleBG.jpg);
	background-color: #ff7200;
	cursor: move;
	}

#RationaleContent
	{
	width: 600px;
	height: 195px;
	}
	
#RationaleButtons
	{
	width: 600;
	height: 35px;
	text-align: right;
	}
	
#ACMainButtons
	{
	width: 885px;
	margin-left: 15px;
	text-align: right;
	}

#FinalizeMessage
	{
	text-align: right;
	}
	
table.clear
	{
	clear:both;
	}
	
#sttitle,
#abtitle
	{
	display: block;
	position:relative;
	width: 890px;
	margin: 0px 0px 20px 0px;
	padding: 5px;
	font-size: 11px;
	font-weight: bold;
	text-align: center;
	color: #000;
	}

#AjaxMessage,
#FinalizeMessage,
#RationaleMessage
	{	
	position: absolute;
	top: 35px;
	left: 512px;
	width: 400px;
	height: 20px;
	font: 12px/20px Verdana, Arial, Helvetica, sans-serif;
	text-align: right;
	vertical-align: bottom;
	font-weight: bold;
	color: #FF7200;
	}
	
input.tcbutton
	{
	font: 10px/16px Verdana, Arial, Helvetica, sans-serif;
	width:225px;
	}
	
.shade
	{
	background-color:#80c242;
	}
	
input.shade
	{
	background-color:#80c242;
	}
#imgHRVPEntry
	{
	position: absolute;
	top: 177px;
	left: 170px;
	}

</FORM>
</body>
</html>