<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	function view(arg){
	$(".time1, .time2, .time3, .time4, .ad1, .ad2, .ad3, .ad4").css("display","none");
	if(arg=="0") {
		$(".time2, .ad2").css("display","block");
		viewcount = 1;
	}
	else if(arg=="1") {
		$(".time3, .ad3").css("display","block");
		viewcount = 2;
	}
	else if(arg=="2") {
		$(".time4, .ad4").css("display","block");
		viewcount = 3;
	}
	else if(arg=="3") {
		$(".time1, .ad1").css("display","block");
		viewcount = 0;
	}
	}
	var viewcount = 0;
	var rtcarousel = setInterval(function(){ view(viewcount) },5000);
	
	$("#best_search").mouseenter(function() {
		clearInterval(rtcarousel);
	});
	
	$("#best_search").mouseleave(function() {
		rtcarousel = setInterval(function(){ view(viewcount) },5000);
	});
	
	function searchList() {
		const f = document.searchForm;
		f.submit();
	}
</script>

<style>
	#txt{
	   display:flex;
	   align-items:center;
	   float:left;
	   flex:1;
	   font-family:sans-serif;
	   letter-spacing:3.5px;
	   font-size:2.0rem;
	   font-weight:700;
	   position:relative;

	}
	#txt>b{
	   height:2.0rem;
	   box-shadow:0 .4rem .3rem -.3rem #aaa;
	   color:#979c9f;
	   background:linear-gradient(#aaf,#acf,#afc);
	   background-clip:text;
	   text-fill-color:transparent;
	   -webkit-background-clip:text;
	   -webkit-text-fill-color:transparent;
	   transform-origin:bottom;
	   transform:rotateX(-85deg);
	   -webkit-transform-origin:bottom;
	   -webkit-transform:rotateX(-85deg);
	   animation:getUp 5s infinite;
	}
	#txt>b:nth-child(2){
	   animation-delay:.25s;
	}
	#txt>b:nth-child(3){
	   animation-delay:.5s;
	}
	#txt>b:nth-child(4){
	   animation-delay:.75s;
	}
	#txt>b:nth-child(5){
	   animation-delay:1s;
	}
	#txt>b:nth-child(6){
	   animation-delay:1.25s;
	}
	#txt>b:nth-child(7){
	   animation-delay:1.5s;
	}
	#txt>b:nth-child(8){
	   animation-delay:1.75s;
	}
	@keyframes getUp{
	   10%,50%{
	      transform:rotateX(0);
	   }
	   0%,60%,100%{
	      transform:rotateX(-85deg);
	   }
	}
	.tltle{
		font-weight: bold;
		font-size: 200%;
	}
	.bar:focus{
		text-decoration: underline;
		text-underline-position : under;
		text-decoration-color: #47a3da;
		text-decoration-thickness: 2px;
		color: #47a3da;	
	}
	.menu:hover{
		text-decoration: underline;
		text-underline-position : under;
		text-decoration-thickness: 2px;
		text-decoration-color: #47a3da;
		font-weight: 900;
		color: #47a3da;
	}
	.menu:focus{
		color: #47a3da;
		text-decoration: underline;
		text-underline-position : under;
	}
	.go-ahead{
		text-decoration: underline; 
		text-underline-position : under; 
		font-size: 18px;
		color: #FFA98F;
	}
	.go-ahead:hover{
		font-size: 18px;
		color: #FF7F50;
	}
	.go-ahead:focus{
		font-size: 18px;
		color: #FF7F50;
	}
	
	
	
	
	
	.hover-content {
	    position: absolute;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background-color: #47a3da;
	    color: white;
	    font-weight: bold;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    opacity: 0;
	    transition: opacity 0.3s ease;
	    border-radius: 15px;
	}
	
	.checkbox-button:hover .hover-content,
	.checkbox-container input[type="button"]:checked + .checkbox-button .hover-content {
	    opacity: 1;
	}
	
	.checkbox-container {
	    display: inline-block;
	    margin: 5px;
	    padding: 10px;
	    border-radius: 5px;
	    cursor: pointer;
	    position: relative;
	    border: 2px solid transparent;
	}
	
	input[type="button"] {
	    display: none;
	}
	
	.checkbox-container label {
	    display: block;
	    cursor: pointer;
	}
	
	
	
</style>


<!-- header start-->
			<header class="clearfix">
				<span>원데이 클래스 추천 </span>
				<div class="txt" id="txt">
				        <b>원</b>
				        <b>데</b>
				        <b>이</b>
				        <b>플</b>
				        <b>러</b>
				        <b>스</b>
				        <b>+</b>
				</div>
				
			<form action="${pageContext.request.contextPath}/lesson/main" name="searchForm" method="post">
				<div class="search">
					<i class="bi bi-search-heart" style="padding: 10px;"></i>
					<input type="text" name="kwd" placeholder="검색어를 입력하세요." class="searchbox">
					<button type="button" class="btn search-button " onclick="searchList()">검색</button>
				</div>
				
				<nav>
				<c:choose>
					<c:when test="${empty sessionScope.member}">
						<a href="${pageContext.request.contextPath}/member/member" class="icon-drop bi bi-person" data-info="회원가입">회원가입</a>
						<a href="javascript:dialogLogin();" class="icon-arrow-left bi bi-person-fill-gear" data-info="로그인">로그인</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/note/receive/list" class="icon-arrow-left bi bi-cart4" data-info="쪽지">쪽지</a>
						<a href="${pageContext.request.contextPath}/member/logout" class="icon-drop bi bi-person" data-info="로그아웃"></a>
						<c:if test="${sessionScope.member.membership > 90}">
							<a href="${pageContext.request.contextPath}/admin" class="icon-drop bi bi-gear-wide-connected" data-info="관리자 페이지"></a>
						</c:if>
						<c:if test="${sessionScope.member.membership > 50 && sessionScope.member.membership < 90}">
							<a href="${pageContext.request.contextPath}/pluszone" class="icon-drop bi bi-gear-wide-connected" data-info="사업자 페이지"></a>
						</c:if>
					</c:otherwise>
				</c:choose>
				</nav>
			</form>
		</header>
			
			
			
						
								
									
							
											
								
			
			
			
			
			
			
			
			

			<ul id="best_search" style="margin-left: 30px;">
				<li><p>인기검색어</p></li>
				<li>
					<dl class="time1">
						<dd><a class="t" href="#"><div class="num">1</div>공예</a></dd>
						<dd><a class="t" href="#"><div class="num">2</div>다이어트</a></dd>
						<dd><a class="t" href="#"><div class="num">3</div>향수</a></dd>
						<dd><a class="t" href="#"><div class="num">4</div>새로운 경험</a></dd>
						<dd><a class="t" href="#"><div class="num">5</div>데이트</a></dd>
					</dl>
					<dl class="time2" style="display:none;">
						<dd><a class="t" href="#"><div class="num">6</div>선물</a></dd>
						<dd><a class="t" href="#"><div class="num">7</div>뷰티</a></dd>
						<dd><a class="t" href="#"><div class="num">8</div>스트레스 해소</a></dd>
						<dd><a class="t" href="#"><div class="num">9</div>핸드메이드</a></dd>
						<dd><a class="t" href="#"><div class="num">10</div>드로잉</a></dd>
					</dl>
					<dl class="time3" style="display:none;">
						<dd><a class="t" href="#"><div class="num">11</div>음악</a></dd>
						<dd><a class="t" href="#"><div class="num">12</div>쿠킹</a></dd>
						<dd><a class="t" href="#"><div class="num">13</div>미용</a></dd>
						<dd><a class="t" href="#"><div class="num">14</div>학업</a></dd>
						<dd><a class="t" href="#"><div class="num">15</div>도예</a></dd>
					</dl>
					<dl class="time4" style="display:none;">
						<dd><a class="t" href="#"><div class="num">16</div>사진</a></dd>
						<dd><a class="t" href="#"><div class="num">17</div>미술</a></dd>
						<dd><a class="t" href="#"><div class="num">18</div>아크릴화</a></dd>
						<dd><a class="t" href="#"><div class="num">19</div>칵테일</a></dd>
						<dd><a class="t" href="#"><div class="num">20</div>금속공예</a></dd>
					</dl>
				</li>
				<li>
					<a class="best_add ad1" style="cursor:pointer" onClick="javascript:view('0')">&#62;</a>
					<a class="best_add ad2" onClick="javascript:view('1')" style="display:none;cursor:pointer" >&#62;</a>
					<a class="best_add ad3" onClick="javascript:view('2')" style="display:none;cursor:pointer" >&#62;</a>
					<a class="best_add ad4" onClick="javascript:view('3')" style="display:none;cursor:pointer" >&#60;</a>
				</li>
			</ul>	
			<div class="main">
				<nav id="cbp-hrmenu" class="cbp-hrmenu">
					<ul>
						<li>
							<a href="#" class="bar">원데이 클래스</a><span class="border-end"></span>
							<div class="cbp-hrsub">
								<div class="cbp-hrsub-inner"> 
									<div>
										<h4 class="tltle">베스트 &amp; 클래스<hr class="my-hr1"></h4>
										<ul>
											<li><a href="#" class="menu">향수 공방</a></li>
											<li><a href="#" class="menu">쿠킹 클래스</a></li>
											<li><a href="#" class="menu">드로잉 클래스</a></li>
											<li><a href="#" class="menu">다이어트 클래스</a></li>
											<li><a href="#" class="menu">보컬 클래스</a></li>
											<li><a href="#" class="menu">댄스 클래스</a></li>
											<li><a href="#" class="menu">도예 클래스</a></li>
										</ul>
									</div>
									
									<div>
										<h4 class="tltle">SALE<hr class="my-hr1"></h4>
										<ul>
											<li><a href="#" class="menu">전통공예 클래스</a></li>
											<li><a href="#" class="menu">플라워 공예 클래스</a></li>
											<li><a href="#" class="menu">가죽 공예 클래스</a></li>
										</ul>
										<h4 class="tltle">이벤트 클래스<hr class="my-hr1"></h4>
										<ul>
											<li><a href="#" class="menu">드럼 클래스</a></li>
											<li><a href="#" class="menu">수채화 클래스</a></li>
										</ul>
									</div>

									<div>
										<h4 class="tltle">NEW 클래스<hr class="my-hr1"></h4>
										<ul>
											<li><a href="#" class="menu">댄스 클래스</a></li>
											<li><a href="#" class="menu">쿠킹 클래스</a></li>
											<li><a href="#" class="menu">목공예 클래스</a></li>
											<li><a href="#" class="menu">네일아트 클래스</a></li>
											<li><a href="#" class="menu">프로듀싱 클래스</a></li>
											<li>&nbsp;</li>
											<li>&nbsp;</li>
											<li><a href="${pageContext.request.contextPath}/lesson/main" class="go-ahead">
											&gt;&gt;모든 원데이 클래스 보러가기&nbsp;<i class="bi bi-calendar2-plus"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</li>
						<li>
							<a href="#" class="bar">원데이 플러스</a><span class="border-end"></span>
							<div class="cbp-hrsub">
								<div class="cbp-hrsub-inner">
									<div>
										<h4 class="tltle">인기 콘텐츠<hr class="my-hr1"></h4>
										<ul>
											<li><a href="#" class="menu">핸드 메이드</a></li>
											<li><a href="#" class="menu">필라테스</a></li>
											<li><a href="#" class="menu">스포츠</a></li>
										</ul>
										<h4 class="tltle">추천 콘텐츠<hr class="my-hr1"></h4>
										<ul>
											<li><a href="#" class="menu">플라워 가드닝</a></li>
											<li><a href="#" class="menu">쿠킹</a></li>
										</ul>
									</div>
									<div>
										<h4 class="tltle">추천 키워드<hr class="my-hr1"></h4>
										<ul>
											<li><a href="#" class="menu">#재미</a></li>
											<li><a href="#" class="menu">#추억</a></li>
											<li><a href="#" class="menu">#데이트</a></li>
											<li><a href="#" class="menu">#이색데이트</a></li>
											<li><a href="#" class="menu">#가족</a></li>
											<li><a href="#" class="menu">#단체</a></li>
											<li><a href="#" class="menu">#음악</a></li>
										</ul>
									</div>
									<div>
										<h4 class="tltle">원데이 추천 플러스<hr class="my-hr1"></h4>
										<ul>
											<img src="${pageContext.request.contextPath}/resources/images/center.jpg"  
												style="width: 400px; border-radius: 20px; 
												box-shadow: -5px -3px 3px  3px black inset, 3px 2px 3px 3px white;">
										</ul>
									</div>
								</div>
							</div>
						</li>
						<li>
							<a href="#" class="bar">이벤트</a><span class="border-end"></span>
							<div class="cbp-hrsub">
								<div class="cbp-hrsub-inner"> 
									<div>
										<h4 class="tltle">첫 구매 이벤트<hr class="my-hr1"></h4>
										<ul>
											<li class="mt-3"><img src="${pageContext.request.contextPath}/resources/images/cupon.jpg" style="width: 300px; height: 200px; background-size: cover; border-radius: 20px;"></li>
											<li><a href="#" class="menu">- 첫 구매시 쿠폰 지급</a></li>
											<li><a href="#" class="go-ahead">&gt;&gt;
												원데이 클래스 보러가기&nbsp;<i class="bi bi-calendar2-minus"></i></a></li>
										</ul>
										
									</div>
									<div>
										<h4 class="tltle">리뷰 이벤트<hr class="my-hr1"></h4>
										<ul>
											<li class="mt-3"><img src="${pageContext.request.contextPath}/resources/images/review.jpg" style="width: 300px; height: 200px; background-size: cover; border-radius: 20px;"></li>
											<li><a href="#" class="menu">- 리뷰 작성 시 포인트 지급</a></li>
											<li><a href="#" class="go-ahead">
												&gt;&gt; 리뷰 게시판 바로가기&nbsp;<i class="bi bi-pencil"></i></a></li>
										</ul>
										
									</div>
									<div>
										<h4 class="tltle">추가 쿠폰 이벤트<hr class="my-hr1"></h4>
										<ul>
											<li class="mt-3"><img src="${pageContext.request.contextPath}/resources/images/cupon.jpg" style="width: 300px; height: 200px; background-size: cover; border-radius: 20px;"></li>
											<li><a href="#" class="menu">- 오늘만 추가 쿠폰 지급</a></li>
											<li><a href="${pageContext.request.contextPath}/event/progress/list" class="go-ahead">
												&gt;&gt; 이벤트 페이지 바로가기&nbsp;<i class="bi bi-balloon-heart"></i></a></li>
										</ul>
										
									</div>
								</div>
							</div>
						</li>
						
						<li>
							<a href="#" class="bar">고객센터</a><span class="border-end"></span>
							<div class="cbp-hrsub">
								<div class="cbp-hrsub-inner"> 
									<div>
										<h4 class="tltle">문의<hr class="my-hr1"></h4>
										<ul>
											<li><a href="${pageContext.request.contextPath}/faq/main" class="menu">자주 묻는 질문</a></li>
											<li><a href="${pageContext.request.contextPath}/notice/list" class="menu">공지사항</a></li>
											<li><a href="${pageContext.request.contextPath}/declaration/article" class="menu">신고하기</a></li>
											<li><a href="${pageContext.request.contextPath}/suggest/article" class="menu">제안하기</a></li>
											<li><a href="${pageContext.request.contextPath}/inquiryAd/list" class="menu">1:1 문의</a></li>
											<li><a href="${pageContext.request.contextPath}/etc/list" class="menu">연락처/위치 안내</a></li>
										</ul>
									</div>
									<div>
										<h4 class="tltle">공지사항<hr class="my-hr1"></h4>
										<ul>
										<c:forEach var="nlist" items="${noticeList}">
											<li><a href="#" class="menu">${nlist.subject}</a></li>
										</c:forEach>
										</ul>
										
									</div>
									<div>
										<h4 class="tltle">고객센터 바로가기<hr class="my-hr1"></h4>
										<ul>
											<li>
											<label class="checkbox-container">
												<input type="button" onclick="location.href='${pageContext.request.contextPath}/faq/main'"></button>
											 	<div class="checkbox-button">
													<img src="${pageContext.request.contextPath}/resources/images/center.jpg" width="300px;" 
													style="border-radius: 20px; box-shadow: -5px -3px 3px  3px black inset, 3px 2px 3px 3px white;">
												 	<div class="hover-content">고객센터 바로가기</div>
												</div>
												</label>
											</li>
										</ul>

									</div>
								</div>
							</div>
						</li>
						
						<li>
						    <li onclick="urlOk('/bbs/list')" class="menubtn bar">커뮤니티</li><span class="border-end"></span>
						</li>
						
						<li>
							<li onclick="urlOk('/sitemap/sitemap')" class="menubtn bar">사이트맵</li><span class="border-end"></span>
						</li>
						
						<c:choose>
							<c:when test="${empty sessionScope.member}">
								<li>
									<li onclick="urlOk('/pluszone/member/member')" class="menubtn bar">플러스존 가입</li>
								</li>
							</c:when>
							<c:otherwise>
								<c:if test="${sessionScope.member.membership == 49}">
									<li>
										<li onclick="urlOk('/pluszone/question/list')" class="menubtn bar">플러스존 요청</li>
									</li>
								</c:if>
								<c:if test="${sessionScope.member.membership > 50}">
									<li>
										<li onclick="urlOk('/pluszone')" class="menubtn bar">플러스존</li>
									</li>
								</c:if>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>

		
		<script src="${pageContext.request.contextPath}/resources/js/menu.js"></script>
		<script>
			function urlOk(url) {
			    window.location.href = "${pageContext.request.contextPath}" + url;
			  }
		
			$(function() {
				cbpHorizontalMenu.init();
			});
		</script>

	<!-- header end-->