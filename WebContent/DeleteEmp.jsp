<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.pojo.Emp"%>
<%@page import ="java.util.Date"%>
<%@page import = "java.text.SimpleDateFormat"%>
<%@page import="com.dao.EmpDao"%>
<%@page import="java.util.List"%>

<jsp:useBean id="emp" class="com.model.pojo.Emp"></jsp:useBean>

<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>
    <script type="text/javascript">
      $(document).ready(function() {
        $("#datepicker").datepicker({
          showButtonPanel: true,
          showOn: "button",
          buttonText: "Select date",
          dateFormat: 'yy-mm-dd',
          changeMonth: true,
          changeYear: true,
          yearRange: "-90:"
        });
      });
    </script>

    <title>Update Employee</title>

</head>
<body>

<%
    String sub=request.getParameter("s1");
    EmpDao dao = new EmpDao();
    Emp deleteemp = new Emp();
    String num=request.getParameter("empno");
    int salary=0;
    String name="";
    Date dob=null;
        if(sub == null){
        //num=request.getParameter("empno");
        int empno =Integer.parseInt(num);
        deleteemp = dao.getEmpbyEmpNo(empno);
        salary = deleteemp.getSal();
        name = deleteemp.getEname();
        //out.println(deleteemp.toString());//Debugging Purpose
        dob = deleteemp.getDob();
    }

    if(sub != null) {
        //deleting record
        int eno= Integer.parseInt(request.getParameter("eno"));
        deleteemp.setEmpno(eno);
        //out.println(deleteemp.toString());
        dao.delete(deleteemp);
        response.sendRedirect("index.jsp");
    }
%>

<form name="f1" action="DeleteEmp.jsp" method="post">
    <table width="471" border="1">
        <tr>
            <th> Employee No </th>
            <td><input name="eno" type="text" value="<%= num %>" onFocus="this.blur()"></td>
        </tr>
        <tr>
            <th>Employee Name </th>
            <td><input name="ename" type="text" value="<%= name %>"></td>
        </tr>
        <tr>
            <th>Salary </th>
            <td><input name="esal" type="text" value="<%= salary %>"></td>
        </tr>
        <tr>
            <th>Date of Birth</th>
            <td><input name="sd" type="text" id="datepicker" value="<%= dob %>" size=30></td>
        </tr>
        <tr>
            <th colspan="2"><input type="submit" onclick="if(confirm('Delete Record?')) alert('Record Deleted Successfully!'); else alert('A wise decision!')" name="s1" value="Delete"></th>
        </tr>
    </table>
</form>
</body>
</html>