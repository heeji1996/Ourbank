<%@ page language="java" contentType="text/html; charset=EUC-KR" import="java.util.*,java.sql.*,javax.servlet.http.*"
    pageEncoding="EUC-KR"%>
 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- css ����
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/basic.css">
  -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fonts.css" >

<meta charset="EUC-KR">
<title>header</title>
</head>
<body>

<!--�˻� ��ȿ���˻� -->
<script language=javascript>
	function send(theform) {
		if(theform.search.value=="") {
			alert("�˻�� �Է��ϼ���");
			theform.search.focus();
			return false;
		}
		theform.submit();
	}
</script>

<div id="logo">
	<h1><a href="#" class="icon icon-group"><span>OurBank</span></a></h1>
	
	<div id="search">
	 <ul class="member">
			 <li><a href="#" class="icon icon-login"><span>�α���</span></a></li>
			 <li><a href="#" class="icon icon-join"><span>ȸ������</span></a></li>
	 </ul>
	 <ul class="contact">
			 <li><form action="" method=post name="sform">
		 	   <input type=text name=search size=25>
			   <input type=button value="�� ��" class="bnt_search" onclick="send(this.form);">
			 </form></li>
			 <li><a href="#" class="icon icon-facebook"><span>Facebook</span></a></li>
			 <li><a href="#" class="icon icon-Instagram"><span>Instagram</span></a></li>
			 <li><a href="#" class="icon icon-twitter"><span>Twitter</span></a></li>
	 </ul>
	</div>
</div>

<!------------------------------ �޴��� --------------------------->
<div id="header">
	<div id="menu" class="container">
		<ul>
			<li><a href="#" accesskey="1" title="">��������</a>
			  <div class="sub_menu"> 
			    <ul>
	              <li><a href="#">����Ʈ�Ұ�</a></li>
	              <li><a href="#">�� �ҽ�</a></li>
	            </ul>
	          </div> 
	        </li>
			<li><a href="#" accesskey="2" title="">��ǰ�Ұ�</a>
			  <div class="sub_menu"> 
			    <ul>
	              <li><a href="#">����</a></li>
	              <li><a href="#">����</a></li>
	            </ul>
	          </div>
	        </li>
			<li><a href="#" accesskey="3" title="">Ŀ�´�Ƽ</a>
			  <div class="sub_menu"> 
				<ul id="side_submenu">
				 <li>- <a href="/app/review_listSpecificPageWork.do?current_page=1"> �� ��</a></li>
				 <li>- <a href="/app/free_listSpecificPageWork.do?current_page=1"> �����Խ���</a></li>
				 <li>- <a href="/app/meeting_listSpecificPageWork.do?current_page=1"> ���ӹ�</a></li>
				 <li>- <a href="/app/debate_listSpecificPageWork.do?current_page=1"> ��й�</a></li>
				 <li>- <a href="/app/meeting_listSpecificPageWork.do?current_page=1"> ����ũ���Ͽ�</a></li>
				 <li>- <a href="/app/meeting_listSpecificPageWork.do?current_page=1"> BEST�Խù�</a></li>
				</ul>
	          </div>
	        </li>
			<li><a href="#" accesskey="4" title="">��������</a>
			  <div class="sub_menu"> 
			    <ul>
	              <li><a href="#">�����ϴ� ����</a></li>
	              <li><a href="#">QnA</a></li>
	              <li><a href="#">Contact-email</a></li>
	            </ul>
	          </div>
	        </li>
			<li><a href="#" accesskey="5" title="">���û���Ʈ</a>
			  <div class="sub_menu"> 
			    <ul>
	              <li><a href="/app/domestic_site_show.do">�������û���Ʈ</a></li>
	              <li><a href="/app/overseas_site_show.do">�ؿܰ��û���Ʈ</a></li>
	            </ul>
	          </div>
			</li>
			<li><a href="#" accesskey="5" title="">MyPage</a>
		  	  <div class="sub_menu"> 
			    <ul>
	              <li><a href="#">������������</a></li>
	              <li><a href="#">���� �ۼ��� ��</a></li>
	              <li><a href="#">���Ի�ǰ</a></li>
	              <li><a href="#">���ɻ�ǰ</a></li>
	            </ul>
	          </div>
			</li>
			<li><a href="#" accesskey="5" title="">����������</a>
			  <div class="sub_menu"> 
			    <ul>
	              <li><a href="#">����ȸ������</a></li>
	              <li><a href="#">���ô���</a></li>
	            </ul>
	          </div>
			</li>
		</ul>
	</div>
</div>
</body>
</html>