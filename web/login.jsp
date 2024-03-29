<%@page import="bean.LoginDao"%>
<%@page import="pl.qrchack.Constants" %>
<jsp:useBean id="obj" class="bean.LoginBean"/>
<jsp:setProperty name="obj" property="*"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Sign in - <%=Constants.appName%>
    </title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container form-center">
    <form action="" id="formLogin" method="post">
        <div class="form-group text-center">
            <img id="logo" src="img/logo.svg"/>
            <h1 id="appName"><%=Constants.appName%>
            </h1>
        </div>
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");
//            boolean remember = request.getParameter("checkRemember") != null;

            if (email != null && password != null) {
                boolean status = LoginDao.validate(obj);
                if (status) {
                    session.setAttribute("userid", email);
                    session.setAttribute("uid", LoginDao.getUid(obj));
                    response.sendRedirect("dashboard.jsp");
        %>
        <div class="alert alert-success" role="alert">
            Aye! You shall pass!
        </div>
        <%
                } else {
        %>
        <div class="alert alert-warning" role="alert">
            Not quite right... try again?
        </div>
        <%
                }
            }
        %>
        <div class="form-group">
            <input class="form-control" name="email" type="email" placeholder="Email address" required autofocus>
        </div>
        <div class="form-group">
            <input class="form-control" name="password" type="password" placeholder="Password" required>
        </div>
        <div class="form-group">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        </div>
        <%--        <div class="form-group text-center">--%>
        <%--            <label for="checkRemember" class="form-check-label"></label>--%>
        <%--            <input class="form-check-input" type="checkbox" id="checkRemember" name="checkRemember"> Remember me--%>
        <%--        </div>--%>
        <span>
            <a href="register.jsp">Need an account?</a>
        </span>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>
