<%@ include file="/WEB-INF/include/header.jsp" %>

	<title>Login</title>
	<script src="/js/login/login.js"></script>    
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="memberLoginChk" method="post" id="form1" name="form1">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="ID" name="userID" id="userid" type="email" autofocus value="<c:out value="${userid}"/>">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" id="userpw" type="password" value="">
                                </div>
<%--                                 <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Y"  <c:if test='${userid != null && userid != ""}'>checked</c:if>>Remember Me
                                    </label>
                                </div> --%>
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="#" class="btn btn-lg btn-success btn-block" onkeydown="enterLogin(event)" onclick="login()">Login</a>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@ include file="/WEB-INF/include/footer.jsp" %>