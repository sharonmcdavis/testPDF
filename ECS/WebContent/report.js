// report.js

//**************************************************************************
// General Functions
//**************************************************************************
function getPage(pageid, referer, refererTitle)
{
	document.headerForm.pageId.value = pageid;
	document.headerForm.referer.value = referer;
	document.headerForm.refererTitle.value = refererTitle;
	document.headerForm.methodName.value = "getPage";
	document.headerForm.submit();
}

function setMethod(methodName, index)
{
	document.forms[index].methodName.value = methodName;
	document.forms[index].submit();
	alert("finished setMethod - should submit form now - " + methodName); 
}

//index denotes which form index to pull values from

function download(formindex)
{
	alert("in download" + formindex);
	var index = document.forms[formindex].cbDownload.selectedIndex;
	var req = document.forms[formindex].cbDownload[index].value;
	alert("index = " + index);
	alert("req = " + req);
	
	if (req == 'full_excel')
		setMethod("exportFullDepletionExcel", formindex);
	else if (req == 'full_word')
		setMethod("exportFullDepletionWord", formindex);
	else if (req == 'full_pdf')
		setMethod("exportPDF", formindex);
}

//**************************************************************************
// DepletionFullReport.jsp
//**************************************************************************
function pageLoad()
{
	if (document.forms[0].State.value != "" &&
		document.forms[0].Warehouse.length <= 1)
		setupWhse();
	else if (document.forms[0].Warehouse.length <= 1)
		document.forms[0].Warehouse.options[0].selected = true;
}
//**************************************************************************
// predefine NewWindow so that a focus or close is possible 
newWindow = null

function OpenWindow(pageName)
{
	newWindow = window.open(pageName);
}

function CloseWindow()
{

    this.close();
	opener.focus();
}

function loadReport(pageName)
{
	OpenWindow(pageName);
}
