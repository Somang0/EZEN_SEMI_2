<%@page import="com.semi2.listGroup.model.ListGroupService"%>
<%@page import="com.semi2.list.model.ListVO"%>
<%@page import="com.semi2.listGroup.model.ListGroupVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<ListVO> list = (List<ListVO>)request.getAttribute("list");
	List<ListVO> listList = (List<ListVO>)request.getAttribute("listList");
	
	List<ListGroupVO> groupList = (List<ListGroupVO>)request.getAttribute("groupList");
	
	

%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <title>이젠 먹으러 갑니다</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
	<script src="js/jquery-3.6.0.min.js"></script>
		<script>
			$(function(){
				$('#searchBtn').click(function(){
					var key = $('#keyword').val();
					location.href="project.do?keyword="+key;
				});
			})
	</script>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->
    
    <!-- Navbar Start -->
	<%@include file="navbar.jsp"%>
	<!-- Navbar End -->


    <!-- 상단 배너 -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
        	<br><br>
            <h1 class="display-3 text-white mb-3 animated slideInDown">이젠 먹으러 갑니다</h1>
            <br><br>
            <div class="position-relative mx-auto" style="max-width: 400px;">
                <input class="form-control border-0 w-100 py-3 ps-4 pe-5" type="text" placeholder="지역, 식당 또는 음식" name="keyword" id="keyword">
                <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2" id="searchBtn">검색</button>
            </div>
            <br><br>
        </div>
    </div>
    <!-- 상단 배너 끝 -->


    <!-- 탑식스 -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h6 class="text-primary">맛집 리스트</h6>
                <h1 class="mb-4">특별한 날,당신을 위한 맛집리스트 TOP6</h1>
            </div>
            <div class="row g-4">
                
                <%
 				for(int i=0; i<6; i++){
                	ListVO vo = list.get(i);%>
               	<div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="service-item rounded overflow-hidden">
                        <img class="img-fluid" src="<%=vo.getList_pic() %>" alt="">
                        <div class="position-relative p-4 pt-0">
                            <br><br>
                            <h4 class="mb-3"><%=vo.getList_name() %></h4>
                            <p><%=vo.getList_comment()%> </p>
                            <a class="small fw-medium" href="project.do?keyword=<%=vo.getList_name()%>">더보기<i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                    </div>
                </div>
 					
 					
                <%}	%>
                <br>
               <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
			        <div class="container text-center">
			            <div class="row justify-content-center">
			                <div class="col-lg-6">
			                    
			                    <a class="btn btn-primary rounded-pill py-3 px-5" href="regionList.do">맛집 리스트 더보기</a>
			                </div>
			            </div>
			        </div>
			    </div>
            </div>
             
        </div>
    </div>
    <!-- 탑식스 -->
    
    
    <!-- 리스트 그룹별 -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h6 class="text-primary">테마별 리스트</h6>
                <h1 class="mb-4">테마별로 모은 맛집 리스트</h1>
            </div>
            <div class="row mt-n2 wow fadeInUp" data-wow-delay="0.3s">
                <div class="col-12 text-center">
                    <ul class="list-inline mb-5" id="portfolio-flters">
                    	<%for(int i=0; i<groupList.size(); i++){
                    		ListGroupVO groupVo = groupList.get(i);%>
                        	<li class="mx-2" data-filter=".group<%=groupVo.getGroup_no()%>"><%=groupVo.getGroup_name() %></li>
                    	<% }%>
                    </ul>
                </div>
            </div>
            <div class="row g-4 portfolio-container wow fadeInUp" data-wow-delay="0.5s">
                <%for(int i=0; i<listList.size();i++){
                	ListVO vo = listList.get(i);
                %>
                <div class="col-lg-4 col-md-6 portfolio-item group<%=vo.getGroup_no()%>">
                    <div class="portfolio-img rounded overflow-hidden">
                        <img class="img-fluid" src="<%=vo.getList_pic() %>" alt="">
                        <div class="portfolio-btn">
                            <a class="btn btn-lg-square btn-outline-light rounded-circle mx-1" href="<%=vo.getList_pic() %>" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                            <a class="btn btn-lg-square btn-outline-light rounded-circle mx-1" href="project.do?keyword=<%=vo.getList_no()%>"><i class="fa fa-link"></i></a>
                        </div>
                    </div>
                    <div class="pt-3">
                        <p class="text-primary mb-0"><%=vo.getList_comment()%></p>
                        <hr class="text-primary w-25 my-2">
                        <h5 class="lh-base"><%=vo.getList_name() %></h5>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </div>
    <!-- 리스트 그룹별 -->
        

    <!-- Footer Start -->
    <%@include file="footer.jsp"%>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/isotope/isotope.pkgd.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
