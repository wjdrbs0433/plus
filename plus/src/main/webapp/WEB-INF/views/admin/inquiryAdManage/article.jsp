<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
function deleteInquiryAd() {
	if(confirm("문의를 삭제 하시겠습니까 ?")) {
		let query = "inquiryNum=${dto.inquiryNum}&${query}";
		let url = "${pageContext.request.contextPath}/admin/inquiryAdManage/deleteInquiryAd?"+query;
		location.href = url;
	}
}

function deleteReContentAd() {
	if(confirm("답변을 삭제 하시겠습니까 ?")) {
		let query = "inquiryNum=${dto.inquiryNum}&${query}";
		let url = "${pageContext.request.contextPath}/admin/inquiryAdManage/deleteReContentAd?"+query;
		location.href = url;
	}
}

function sendReContentAd() {
	const f = document.reContentForm;
	if(! f.reContent.value.trim()) {
		alert("답변을 입력 하세요.");
		f.reContent.focus();
		return;
	}
	
	f.action = "${pageContext.request.contextPath}/admin/inquiryAdManage/sendReContentAd";
	f.submit();
}
</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-question-diamond"></i> 1:1 문의 </h3>
		</div>
		
		<div class="body-main">

			<table class="table mt-5 mb-0">
				<tbody>
					<tr>
						<td colspan="2" class="px-0 pb-0">
							<div class="row gx-0">
								<div class="col-sm-1 bg-primary me-1">
									<p class="form-control-plaintext text-white text-center">Q.</p>
								</div>
								<div class="col bg-primary">
									<p class="form-control-plaintext text-white ps-2">${dto.subject}</p>
								</div>
							</div>
						</td>
					</tr>				
				
					<tr>
						<td align="right">
							작성자 : ${dto.userName}
						</td>
					</tr>

					<tr>
						<td width="50%">
							문의일자 : ${dto.inquiryDate}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" valign="top" height="200">
							${dto.content}
						</td>
					</tr>
				</tbody>
			</table>
			
			<c:if test="${not empty dto.reContent}">
				<table class="table mb-0">
					<tbody>
						<tr>
							<td colspan="2" class="p-0">
								<div class="row gx-0">
									<div class="col-sm-1 bg-success me-1">
										<p class="form-control-plaintext text-white text-center">A.</p>
									</div>
									<div class="col bg-success">
										<p class="form-control-plaintext text-white ps-2">[답변] ${dto.subject}</p>
									</div>
								</div>
							</td>
						</tr>
					
						<tr>
							<td width="50%">
								담당자 : 관리자
							</td>
							<td align="right">
								답변일자 : ${dto.reInquiryDate}
							</td>
						</tr>
						
						<tr>
							<td colspan="2" valign="top" height="150">
								${dto.reContent}
							</td>
						</tr>
					</tbody>
				</table>
			</c:if>
			
			<table class="table table-borderless mb-2">
				<tr>
					<td width="50%" align="left">
						<button type="button" class="btn" onclick="deleteInquiryAd('${dto.inquiryNum}');">질문삭제</button>
						<c:if test="${not empty dto.reContent}">
							<button type="button" class="btn" onclick="deleteReContentAd('${dto.inquiryNum}')">답변삭제</button>
						</c:if>
					</td>
					
					<td align="right">
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/inquiryAdManage/list?${query}';">리스트</button>
					</td>
				</tr>
			</table>
			
			<c:if test="${empty dto.reContent}">
				<div class="reply">
					<form name="reContentForm" method="post">
						<div class="form-header">
							<span class="bold">답변달기</span><span> - 문의에 대한 답변을 입력 하세요.</span>
						</div>
						
						<table class="table reply-form">
							<tr>
								<td>
									<textarea class="form-control" name="reContent"></textarea>
								</td>
							</tr>
							<tr>
								<td align="right">
									<button type="button" class="btn" onclick="sendReContentAd()">답변 등록</button>
									<input type="hidden" name="inquiryNum" value="${dto.inquiryNum}">
									<input type="hidden" name="page" value="${page}">
									<input type="hidden" name="schType" value="${schType}">
									<input type="hidden" name="kwd" value="${kwd}">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</c:if>

		</div>
	</div>
</div>