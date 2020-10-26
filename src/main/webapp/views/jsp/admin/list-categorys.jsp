
<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Category</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>Admin Category</title>
</head>


<body>


	<%@include file="../admin/dashboard/side-bar.jsp"%>
	
	
	<div id="right-panel" class="right-panel">

        <!-- Header-->
        <header id="header" class="header">
            <div class="top-left">
                <div class="navbar-header">
                    <a class="navbar-brand" href="./">TECHZONE ADMIN</a>
                    <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a>
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                </div>
            </div>
        </header><!-- /header -->
        <!-- Header-->

        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>Dashboard</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">Dashboard</a></li>
                                    <li><a href="#">Table</a></li>
                                    <li class="active">Category</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">Data Table</strong>
                                
                                
                                	<a href="<c:url value='/admin/category/showForm'/>">
									<button type="button" class="btn btn-success">
										<img id="img-slide"
											src="${pageContext.request.contextPath}/resources/icon/plus.png"
											alt="icon">
									</button>
								</a>
                                
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th>Update</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <c:forEach var="tempCategory" items="${categorys}">
											<tr>
												<td>${tempCategory.id}</td>
												<td>${tempCategory.name}</td>
												<td><c:url var="updateLink" value="/admin/category/update">
														<c:param name="categoryId" value="${tempCategory.id}" />
													</c:url> <a href="${updateLink}">
														<button type="button" class="btn btn-outline">
															<img id="img-slide" src="${pageContext.request.contextPath}/resources/icon/edit.png" alt="icon">
														</button>
												</a></td>
												<td><c:url var="deleteLink" value="/admin/category/delete">
														<c:param name="categoryId" value="${tempCategory.id}" />
													</c:url> <a href="${deleteLink}"
													onclick="if (!(confirm('Are you sure you want to delete this category?'))) return false">
														<button type="button" class="btn btn-outline">
															<img id="img-slide" src="${pageContext.request.contextPath}/resources/icon/delete.png" alt="icon">
														</button>
												</a></td>
											</tr>
										</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


                </div>
            </div><!-- .animated -->
        </div><!-- .content -->


        <div class="clearfix"></div>

        <footer class="site-footer">
            <div class="footer-inner bg-white">
                <div class="row">
                    <div class="col-sm-6">
                        Copyright &copy; 2018 Ela Admin
                    </div>
                    <div class="col-sm-6 text-right">
                        Designed by <a href="https://colorlib.com">Colorlib</a>
                    </div>
                </div>
            </div>
        </footer>

    </div><!-- /#right-panel -->

    <!-- Right Panel -->



</body>
</html>
