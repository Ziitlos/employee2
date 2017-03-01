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
    String num="";
    int salary=0;
    String name="";
    Date dob=null;
    int empno = 0;
    if(sub == null){
        num=request.getParameter("empno");
        empno=Integer.parseInt(num);
        Emp editemp = dao.getEmpbyEmpNo(empno);
        //System.out.println(editemp.toString());//Debugging Purpose
        salary = editemp.getSal();
        name = editemp.getEname();
        //out.println(editemp.toString());//Debugging Purpose
        dob = editemp.getDob();
    }

    if(sub != null){
        int neweno= Integer.parseInt(request.getParameter("eno"));
        String sd = request.getParameter("sd");
        String newename = request.getParameter("ename");
        int newSalary= Integer.parseInt(request.getParameter("esal"));
        //out.println(sd);
        if(sd != null){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dobdate = sdf.parse(sd);
            emp.setEmpno(neweno);
            emp.setEname(newename);
            emp.setSal(newSalary);
            emp.setDob(dobdate);
            dao.update(emp);
%>

<script type="text/javascript" language="javascript">
  alert("Record Updated successful");
  document.location = "index.jsp";
</script>

<%
       // out.println(newename);//Debugging purpose
            // out.println(emp.toString());//Debugging purpose
        }
    }

%>

<form name="f1" action="UpdateEmp.jsp" method="post">
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
            <th colspan="2"><input type="submit" name="s1" value="Update"></th>
        </tr>
    </table>
</form>
</body>
</html>
