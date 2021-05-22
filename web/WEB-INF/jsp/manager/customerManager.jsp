<%--
  Created by IntelliJ IDEA.
  User: dnwnd
  Date: 2021-05-19
  Time: 오후 5:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String TableList = (String) request.getAttribute("TableList");
%>
<html>
<head>
    <title>Title</title>
    <link href='css/bootstrap-table.css' rel='stylesheet' type='text/css'>
    <link href='css/boardtable.css' rel='stylesheet' type='text/css'>
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/bootstrap-table.js"></script>
    <script src="/js/bootstrap-table-cookie.js"></script>
    <script src="/js/bootstrap-table-export.min.js"></script>
</head>
<body>
<%@include file="../common/header.jsp" %>
<main class="container">
    <div class="py-5 text-center">
        <div class="row-fluid">
            <div class="btn pull=left">
                <input type="date" class="form-control" id="reservationDate" name="new_date" value='' placeholder="Date of Birth" required>
            </div>
            <button type="button" class="btn btn-primary btn-lg">Walk-In</button>
        </div>
    </div>
    <div>
        <table class="table">
            <thead id="TableHead"></thead>
            <tbody id="TableData"></tbody>
        </table>
        <div class="pay_button text-center">
            <button class="w-25 btn-primary btn-lg" type="submit">테이블 갱신</button>
        </div>
    </div>
    <div>

    </div>
</main>
</body>
<script src="js/bootstrap.bundle.min.js"></script>
<script>
    $(document).ready(function(){
        MakeTableHead();
        MakeTableData();
    })
    var openingTime = 10;
    var closingTime = 22;
    function MakeTableHead(){
        var list = $('#TableHead');
        var text = '<tr><th scope="col">No.</th>';
        for(var i=openingTime;i<closingTime;i++){
            text+='<th scope="col">'+i+':00</th>';
        }
        text+='</tr>';
        list.append(text);
    }
    function MakeTableData(){
        var tableList = <%=TableList%>
        var list = $('#TableData');
        var text = '';
        for(var i=0;i<tableList.length;i++){
            var table=tableList[i];
            text+='<tr>'
                +'<td>'+table.number+'</td>';
            for(var j=openingTime;j<closingTime;j++){
                text+='<td>-</td>'
            }
            text+='</tr>';
        }
        list.append(text);
    }
</script>
</html>
