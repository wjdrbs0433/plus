<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.table td{
	height:60px;
	line-height: 60px;
}
</style>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:10% auto; ">
				<div class="body-main">
				
				<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
					<i class="bi bi-question-diamond"></i> 1:1 문의
					
					<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/inquiryAd/list';" title="새로고침" style="float:right;">
						<i class="bi bi-arrow-counterclockwise"></i>
					</button>
					
					<button type="button" class="btn btn-success me-3" onclick="location.href='${pageContext.request.contextPath}/inquiryAd/write';" style="float:right;">질문등록</button>
				</h3>
				
				<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
					<table class="table">
						<tr>
						<td align="left" width="50%">
								총 <font style="color:green; font-weight:bold; text-decoration:underline">${dataCount}개</font> (${page}/${total_page} 페이지)
							</td>
							<td align="right">
								&nbsp;
							</td>
						</tr>
					</table>
		
					<div class="card mb-5 w-80 text-center" style="margin:0 auto; border:none;">
						<table class="table table-border table-list table-hover">
							<thead>
								<tr>
									<th width="60">번호</th>
									<th>제목</th>
									<th width="70">작성자</th>
									<th width="150">문의일자</th>
									<th width="230">처리일자</th>
									<th width="90">처리결과</th>
								</tr>
							</thead>
					
							<tbody>
								<c:forEach var="dto" items="${list}" varStatus="status">
									<tr>
										<td>${dataCount - (page-1) * size - status.index}</td>
										<td class="left">
											<a href="${articleUrl}&inquiryNum=${dto.inquiryNum}">${dto.subject}</a>
										</td>
										<td>${dto.userName}</td>
										<td>${dto.inquiryDate}</td>
										<td>${dto.reInquiryDate}</td>
										<td>${(empty dto.reInquiryDate)?"답변대기":"답변완료"}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
				
						<table class="table">
							<tr>
								<td align="center">
									<form name="searchForm" action="${pageContext.request.contextPath}/inquiryAd/list" method="post" style="width:300px; margin-left:100px">
										<div class="input-group mb-1">
											<select name="schType" class="form-select">
												<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
												<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
												<option value="userName" ${schType=="userName"?"selected":""}>작성자</option>
												<option value="content" ${schType=="content"?"selected":""}>내용</option>
											</select>
											<input type="text" name="kwd" value="${kwd}" class="form-control">
											<button type="button" class="btn btn-success" onclick="searchList()"> <i class="bi bi-search"></i> </button>
										</div>
									</form>
								</td>
								<td align="right" width="120"></td>
							</tr>
						</table>
						
						<div class="page-navigation text-center mb-3">
							${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</main>
