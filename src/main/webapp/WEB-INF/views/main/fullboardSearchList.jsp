<%@ page language="java"
	import="java.util.*,java.sql.*,javax.servlet.http.*"
	contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.text.*"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@page session="false"%>
<%@page import="com.ourbank.app.bean.FreeBoard_Bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="com.ourbank.app.PageNumberingManager"%>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fonts.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/body.css" >
<meta charset="EUC-KR">
<title>�����Խ��� ���</title>
</head>

<c:set var="total_cnt" value="${totalCnt}"/>
<c:set var="searchString" value="${searchStr}"/>
<c:set var="pageForView" value="${pageForView}"/>
<%
	int total_cnt=((Integer)(pageContext.getAttribute("total_cnt"))).intValue();
	String searchStr=(String) pageContext.getAttribute("searchString");
	int rowsPerPage=10;
	int total_pages=PageNumberingManager.getInstance().getTotalPage(total_cnt, rowsPerPage);
	//el�� ������ �� �ִ� ���
	pageContext.setAttribute("t_pages", total_pages);
	HttpSession session=request.getSession();
	String id=(String) session.getAttribute("uid");
%>
<c:set var="id" value="<%=id%>"/>
<script type="text/javascript">
	//����Ʈ _ ����ũ ���� �� 
	function boardView_idCheck() {
		var loginUser = "${id}";
		if(!loginUser) {
			alert('�α��� �� �̿� �����մϴ�.');
			return location.href = "loginForm.do";		
		}
	}
</script>
<!-- *********************** �Խ��� �۾��� �� ****************************  -->	
<jsp:include page="../header.jsp"></jsp:include>
<!-- *********************** ���̵� �޴� ****************************  -->	
	<div id="body_div">
	<div id="side_menu">
		<h4><a href="#">�۰˻�</a></h4>
		<div id="side_div">
			<ul id="side_submenu">
			</ul>
		</div>
	</div>
	
<!-- *********************** ���� ****************************  -->	
<div id="line_div">
 <div id="sub_logo">
<h2>" <c:out value="${searchStr}"/> " �� ���õ� �� ���</h2>	
 </div> 
 <div id="site_div">

<div style="margin-top: 50px; font-weight: bold;">
<table cellspacing=1 width=700>
	<tr>
		<td>�� �Խù���: <c:out value="${totalCnt}" /></td>
		<td><p align=right>������:<c:out value="${t_pages}"/></p></td>
	</tr>
</table>
</div>

<table cellspacing=1 width=700 >
	<thead>
	<tr>
		<td width="50" class="tlb_board_top">�۹�ȣ</td>
		<td width="320" class="tlb_board_top">�� ��</td>
		<td width="100" class="tlb_board_top">���̵�</td>
		<td width="100" class="tlb_board_top">�����</td>
		<td width="100" class="tlb_board_top">��ȸ��</td>
	</tr> </thead>
	<tbody>
	<c:forEach var="board" items="${searchedList}">
		<tr class="tlb_board_bottom">
			<td width="50">${board.getBoard_idx()}</td>
			<td width="320">
				
				<!-- �α��� o -->
				<c:if test="${id != null }"> <!--   (���� ${id != null }�ιٲٱ�!!-->
				<a href="fullboardSearchView.do?board_idx=${board.getBoard_idx()}&current_page=${pageForView}&searchStr=${searchStr}" 
					title="${board.getContent()}">${board.getSubject()}</a>
				</c:if>
				
				<!-- �α��� x -->
				<c:if test="${id ==null}">
				<a onclick="boardView_idCheck(this.href);return false;" onkeypress="this.onclick;"
					href="fullboardSearchView.do" > <c:out value="${board.getSubject()}" /></a>
				</c:if>
			</td>
			<td width="100">${board.getId()}</td>
			<td width="100">${board.getCreated_date()}</td>
			<td width="100">${board.getHits()}</td>
		</tr>
	</c:forEach>
</tbody>
	</table>
	
<div style="margin-top: 50px; font-weight: bold;">
<table cellspacing="1" width="700" class="page">
	<tr>
		<td>
		<c:forEach var="i" begin="1" end="${t_pages}">
			<a href="freeSearchedList.do?
			pageForView=${i}&searchStr=<c:out value="${searchStr}"/>">
			[
			<c:if test="${i==pageForView}"><b></c:if>
			${i}
			<c:if test="${i==pageForView}"><b></c:if>
			]
		</c:forEach>
		</td>
	</tr>
</table>
</div>

<div>
	<input type="button" value="�������� ���ư���" class="bnt_comu"
	onclick="window.location='index.do'">
	
	</div>

</div>
</div>
</div>
<!-- *********************** �Խ��� �۾��� �� ****************************  -->	

	<jsp:include page="../footer.jsp"></jsp:include>

</html>