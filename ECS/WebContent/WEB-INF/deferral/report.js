function setMethod(methodName, index)
{
	document.forms[index].methodName.value = methodName;
	document.forms[index].submit();
}

//index denotes which form index to pull values from
function navigateMe(formindex)
{
	var undefined;
	var index = document.forms[formindex].cbReport.selectedIndex;
	var req = document.forms[formindex].cbReport[index].value;

	//depletion report
	if (req == 'dep_new')
		setMethod("toDepletionReport", formindex);
	else if (req == 'dep_full')
		setMethod("getFullDepletionReport", formindex);
	else if (req == 'dep_sum')
		setMethod("getDepletionSummary", formindex);

	//return to main window
	else if (req == 'main')
		CloseWindow();
	
	//homepage
	else if (req == 'home')
		setMethod("toHomePage", formindex);
}
function download(formindex)
{
	var index = document.forms[formindex].cbDownload.selectedIndex;
	var req = document.forms[formindex].cbDownload[index].value;
	alert("download_" + req);
	
	if (req == 'full_excel')
		setMethod("exportFullDepletionExcel", formindex);
	else if (req == 'full_word')
		setMethod("exportFullDepletionWord", formindex);
	else if (req == 'full_pdf')
		setMethod("exportFullDepletionPDF", formindex);


	else if (req == 'sum_excel')
		setMethod("exportDepletionSumExcel", formindex);
	else if (req == 'sum_word')
		setMethod("exportDepletionSumWord", formindex);
	else if (req == 'sum_pdf')
		setMethod("exportDepletionSumPDF", formindex);


	else if (req == 'detail_excel')
		setMethod("exportDepletionDetailExcel", formindex);
	else if (req == 'detail_word')
		setMethod("exportDepletionDetailWord", formindex);
	else if (req == 'detail_pdf')
		setMethod("exportDepletionDetailPDF", formindex);

}

//**************************************************************************
//**************************************************************************
//predefine NewWindow so that a focus or close is possible 
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