<%@page import="java.nio.file.Path"%>
<%@page import="org.springframework.core.io.ClassPathResource"%>
<%@page import="com.ourbank.app.bean.MeetingBoard_Bean"%>
<%@ page language="java"
	import="java.util.*,java.sql.*,javax.servlet.http.*"
	contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.text.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fonts.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/body.css" >>
<title>���ӹ�Խ��� �ۺ���</title>
</head>

<!-- *********************** �Խ��� �۾��� �� ****************************  -->	
<jsp:include page="../../header.jsp"></jsp:include>
<!-- *********************** ���̵� �޴� ****************************  -->	
	
<div id="body_div">
	<div id="side_menu">
		<h4><a href="/app/reviewList.do?current_page=1">Ŀ�´�Ƽ</a></h4>
		<div id="side_div">
			<ul id="side_submenu">
				<li>- <a href="/app/reviewList.do?current_page=1"> �� ��</a></li>
				<li>- <a href="/app/freeList.do?current_page=1"> �����Խ���</a></li>
				<li>- <a href="/app/meetingList.do?current_page=1"> ���ӹ�</a></li>
				<li>- <a href="/app/debateList.do?current_page=1"> ��й�</a></li>
				<li>- <a href="/app/investList.do?current_page=1"> ����ũ���Ͽ�</a></li>
				<li>- <a href="/app/bestList.do?current_page=1"> BEST�Խù�</a></li>
			</ul>
		</div>
	</div>
	
<!-- *********************** ���� ****************************  -->	

<!-- model�� ������ �а� �ҷ��� -->
<c:set var="idx_num" value="${idx_num}" />
<c:set var="current_page" value="${current_page}" />
<c:set var="searchString" value="${searchStr}" />
<c:set var="filename" value="${filename}"/>

<%
	String searchString=(String) (pageContext.getAttribute("searchString"));
	String filename=(String) (pageContext.getAttribute("filename"));
%>
<script  language="javascript">
function boardlist(){
	var s="<%=searchString%>";
	if(s=="None")
		location.href='meetingList.do?current_page=${current_page}';
	else
		location.href='meetingSearchedList.do?pageForView=${current_page}&searchStr=${searchStr}';	
}

function boardmodify(){
	location.href='meeting_show_update_form.do?idx_num=${idx_num}&current_page=${current_page}';
}

function boarddelete(){
	if(confirm('���� �����Ͻðڽ��ϱ�?')==true){
		location.href='meeting_DeleteSpecificRow.do?idx_num=${idx_num}&current_page=${current_page}';	
	}else {
		return;
	}
}

function boardrewrite(){
	location.href='meeting_show_rewrite_form.do?idx_num=${idx_num}&current_page=${current_page}';
}
function download(){
	var param="<%=filename%>";
	en_filename=encodeURI(param)
	location.href="meeting_download.do?filename="+en_filename;
}
</script>

<div id="line_div">
	<div id="sub_logo">
		<h2>���ӹ� �Խ���</h2>
    </div> 
 <div id="site_div">	
<table  class="tlb_board">
	<tr>
			<td style="background-color: #f2f2f2"><b>����</b></td>
			<td><c:out value="${boardData.getSubject()}" /></td>
			<td style="background-color: #f2f2f2"><b>��ȸ��</b></td>
			<td><c:out value="${boardData.getHits()}" /></td>
	</tr>
	<tr>
			<td style="background-color: #f2f2f2"><b>���̵�</b></td>
			<td><c:out value="${boardData.getId()}" /></td>
			<td style="background-color: #f2f2f2"><b>�ۼ���</b></td>
			<td><c:out value="${boardData.getCreated_date()}"></c:out></td>
	</tr>
	<tr>
		<td style="background-color: #f2f2f2"><b>����</b></td>
		<td  colspan="3" height="300" style="text-align: left; padding-left: 15px;">
		<c:out value="${boardData.getContent()}"/></td>
		</td>
	</tr>
	<tr>
			<td style="background-color: #f2f2f2"><b>����÷��</b></td>
			<td colspan="3" style="text-align: left; padding-left: 15px; ">
			<input type="button" onclick="download()"
			value="${boardData.getFilename()}">
			</td>
		</tr>
</table>

<div class="div_board_bnt">
		<input type="button" value="�� ��" onclick="javascript:boardmodify()" class="bnt_view">
		<input type="button" value="�� ��" onclick="javascript:boardlist()" class="bnt_view">
		<input type="button" value="�� ��" onclick="javascript:boardrewrite()" class="bnt_view">
		<input type="button" value="�� ��" onclick="javascript:boarddelete()" class="bnt_view">
	</div>
</div>
</div>
 </div> 
<!-- *********************** �Խ��� �۾��� �� ****************************  -->	

	<jsp:include page="../../footer.jsp"></jsp:include>
</html>