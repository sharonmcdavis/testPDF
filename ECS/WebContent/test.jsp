<!DOCTYPE html>
<html lang="en">
	<head>
		<%
			String pageName = (String) request.getAttribute("pageName");
			String pageTitle = (String) request.getAttribute("pageTitle");
			if (pageName == null) {
				pageName = "default.jsp";
			}
			if (pageTitle == null) {
				pageTitle = "Executive Compensation";
			}
			System.out.println("pageName = " + pageName);
			System.out.println("pageTitle = " + pageTitle);
		%>
		<meta charset="utf-8">
		<title><%= pageTitle %></title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="Description" lang="en" content="ADD SITE DESCRIPTION">
		<meta name="author" content="ADD AUTHOR INFORMATION">
		<meta name="robots" content="index, follow">

		<!-- icons -->
		<link rel="shortcut icon" href="favicon.ico">

		<!-- Bootstrap Core CSS file -->
		<link rel="stylesheet" href="bootstrap.min.css">

		<!-- Override CSS file - add your own CSS rules -->
		<link rel="stylesheet" href="styles.css">

	</head>
	<body>

		<!-- Navigation -->
	    <nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
			<div class="container-fluid">

				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Executive Compensation</a>
				</div>
				<!-- /.navbar-header -->

			</div>
			<!-- /.container-fluid -->
		</nav>
		<!-- /.navbar -->

		<!-- Page Content -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-8 col-sm-push-4">
					<jsp:include page="/WEB-INF/common/header.jsp"></jsp:include> 
				</div>
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-sm-8 col-sm-push-4">

					<div class="well">
						<jsp:include page="<%= pageName %>"></jsp:include> 
					</div>

					<hr>

				</div>
				<div class="col-sm-4 col-sm-pull-8">
					<!-- list group -->
					<div class="list-group margin-b-3">
    					<jsp:include page="/WEB-INF/common/menu.jsp"></jsp:include> 
					</div>


				</div>
			</div>
			<!-- /.row -->

			<hr>
			<footer class="margin-tb-3">
				<div class="row">
					<div class="col-lg-12">
						<jsp:include page="/WEB-INF/common/ECSIAContentFooter.jsp"></jsp:include> 
					</div>
				</div>
			</footer>
		</div>
		<!-- /.container-fluid -->

  </body>
</html>


