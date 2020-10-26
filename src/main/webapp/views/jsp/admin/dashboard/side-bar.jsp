<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>


<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Admin TechZone</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
    <link href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css" rel="stylesheet" />
    
    <link rel="stylesheet" href="<c:url value="/resources/style/admin/cs-skin-elastic.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/style/admin/style.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/style/admin/dataTables.bootstrap.min.css" />">


</head>

<body>
	
	<!-- Left Panel -->
    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="<c:url value='/admin/managerment' />"><i class="menu-icon fa fa-laptop"></i>Dashboard</a>
                    </li>
                    <li class="menu-title">UI elements</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>Components</a>
                        <ul class="sub-menu children dropdown-menu">
                        
                        	<li><i class="fa fa-puzzle-piece"></i><a href="#">Buttons</a></li>
                            <li><i class="fa fa-id-badge"></i><a href="#">Badges</a></li>
                            <li><i class="fa fa-bars"></i><a href="#">Tabs</a></li>

                            <li><i class="fa fa-id-card-o"></i><a href="#">Cards</a></li>
                            <li><i class="fa fa-exclamation-triangle"></i><a href="#">Alerts</a></li>
                            <li><i class="fa fa-spinner"></i><a href="#">Progress Bars</a></li>
                            <li><i class="fa fa-fire"></i><a href="#">Modals</a></li>
                            <li><i class="fa fa-book"></i><a href="#">Switches</a></li>
                            <li><i class="fa fa-th"></i><a href="#">Grids</a></li>
                            <li><i class="fa fa-file-word-o"></i><a href="#">Typography</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>Tables</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-table"></i><a href="<c:url value='/admin/product/' />">Product</a></li>
                            <li><i class="fa fa-table"></i><a href="<c:url value='/admin/category/' />">Category</a></li>
                            <li><i class="fa fa-table"></i><a href="<c:url value='/admin/brand/' />">Brand</a></li>
                            <li><i class="fa fa-table"></i><a href="<c:url value='/admin/sale/' />">Sale</a></li>
                            <li><i class="fa fa-table"></i><a href="<c:url value='/admin/user/' />">User</a></li>
                            <li><i class="fa fa-table"></i><a href="<c:url value='/admin/cartdb' />">CartDB Customer</a></li>
                            <li><i class="fa fa-table"></i><a href="<c:url value='/admin/bill' />">Bill Order</a></li>
                            <li><i class="fa fa-table"></i><a href="<c:url value='/admin/billDetail' />">BillDetail Order</a></li>
                            <li><i class="fa fa-table"></i><a href="<c:url value='/admin/billConfirm' />">Confirm Delivery</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Forms</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-th"></i><a href="#">Basic Form</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="#">Advanced Form</a></li>
                        </ul>
                    </li>

                    <li class="menu-title">Icons</li><!-- /.menu-title -->

                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-tasks"></i>Icons</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-fort-awesome"></i><a href="#">Font Awesome</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="#">Themefy Icons</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"> <i class="menu-icon ti-email"></i>Widgets </a>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>Charts</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-line-chart"></i><a href="#">Chart JS</a></li>
                            <li><i class="menu-icon fa fa-area-chart"></i><a href="#">Flot Chart</a></li>
                            <li><i class="menu-icon fa fa-pie-chart"></i><a href="#">Peity Chart</a></li>
                        </ul>
                    </li>

                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-area-chart"></i>Maps</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-map-o"></i><a href="#">Google Maps</a></li>
                            <li><i class="menu-icon fa fa-street-view"></i><a href="#">Vector Maps</a></li>
                        </ul>
                    </li>
                    <li class="menu-title">Extras</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>Pages</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="<c:url value='/showMyLoginPage' />">Login</a></li>
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="<c:url value='/registration' />">Register</a></li>
                            <li><i class="menu-icon fa fa-paper-plane"></i><a href="<c:url value='/recoveryPassword' />">Forget Pass</a></li>
                            <li><i class="menu-icon fa fa-store"></i><a href="<c:url value='/' />">Shop</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
    <!-- /#left-panel -->



	<!-- BE IMPORT BY CONTENT DASHBOAR -->


	<!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>

	<script src="<c:url value="/resources/style/admin/main.js" />"></script>
	<script src="<c:url value="/resources/style/admin/datatables.min.js" />"></script>
	<script src="<c:url value="/resources/style/admin/dataTables.bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/style/admin/dataTables.buttons.min.js" />"></script>
	<script src="<c:url value="/resources/style/admin/buttons.bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/style/admin/jszip.min.js" />"></script>
	<script src="<c:url value="/resources/style/admin/vfs_fonts.js" />"></script>
	<script src="<c:url value="/resources/style/admin/buttons.html5.min.js" />"></script>
	<script src="<c:url value="/resources/style/admin/buttons.print.min.js" />"></script>
	<script src="<c:url value="/resources/style/admin/buttons.colVis.min.js" />"></script>
	<script src="<c:url value="/resources/style/admin/datatables-init.js" />"></script>
 

</body>
</html>
