<%@page import="com.semi2.mem.model.MemVO"%>
<%@page import="com.semi2.mem.model.MemService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_ok.jsp</title>
</head>
<body>
<jsp:useBean id="memService" class="com.semi2.mem.model.MemService" scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("userid");
	String pwd=request.getParameter("pwd");
	
	String msg="로그인 실패되었습니다.", url="login.do";
	
	try{
		int result=memService.checkLogin(userid, pwd);
		
		if(result==MemService.LOGIN_OK){
			MemVO vo=memService.selectByUserid(userid);
			
			//session에 로그인 정보 저장
			session.setAttribute("userid", userid);
			session.setAttribute("userName", vo.getMem_name());
			session.setAttribute("curMemVo", vo);
			session.setAttribute("userpwd", vo.getMem_pw());
			session.setAttribute("manager", vo.getMem_manager());
			session.setAttribute("userno", vo.getMem_no());
			session.setAttribute("loginType","ezen");
			
			msg=vo.getMem_name()+"님 로그인 되셨습니다.";
			url="main.do";
		}else if(result==MemService.DISAGREE_PWD){
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==MemService.NONE_USERID){
			msg="해당 아이디가 존재하지 않습니다.";
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="message.jsp"></jsp:forward>
</body>
</html>