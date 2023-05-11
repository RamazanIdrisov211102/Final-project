<%@ page import="kz.baibalaeva.javaEE.User" %>
<%@ page import="kz.baibalaeva.javaEE.Admin" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/loginBeauty"><b>&ensp;Queen</b>Bee</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" style="background-color: pink" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="/loginBeauty">Home <span class="sr-only"></span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/listOfServices">List of services</a>
            </li>
            <%
                Admin currentAdmin = (Admin)request.getSession().getAttribute("currentAdmin");
            if (currentAdmin!=null){
            %>

            <li class="nav-item">
                <button style="background-color: #DAD2CA" class="btn btn-primary" ><a class="nav-link" href="/addUser"><b>Add User</b></a></button>
            </li>

            <li class="nav-item">
                <button style="background-color: #DAD2CA" class="btn btn-primary" ><a class="nav-link" href="/addProduct"><b>Add product</b></a></button>
            </li>

            <li class="nav-item">
                <button style="background-color: #DAD2CA" class="btn btn-primary" ><a class="nav-link" href="/detailsBeauty"><b>Applications</b></a></button>
            </li>

            <li class="nav-item">
                <button style="background-color: #DAD2CA" class="btn btn-primary" ><a class="nav-link" href="/adminUser"><b>Users</b></a></button>


            <li class="nav-item">
            <button style="background-color: #DAD2CA" class="btn btn-primary"><a class="nav-link" href="/appProduct">Application of products</a></button>
            </li>




            <%
                }
            %>

            <%
                User currentUser = (User) request.getSession().getAttribute("currentUser");

                if (currentAdmin==null){
                    if (currentUser==null){
            %>
            <li class="nav-item">
                <a class="nav-link" href="/registerBeauty"><b>Sign up</b></a>
            </li>


            <%
                }
                }
            %>

            <%

                if (currentAdmin!=null || currentUser!=null){
            %>
            <li style="margin-left: 10px;" class="nav-item">
                <a class="nav-link" href="/applications?id=<%=currentUser.getId()%>"><b>My applications</b></a>
            </li>


            <%
                }
            if(currentAdmin!=null || currentUser!=null){
            %>

            <li style="margin-left: 150px;" class="nav-item">
                <a class="nav-link" href="/logout"><b>Log out</b></a>
                <br>
                <br>
            </li>
            <%
                }
            %>





            <li class="nav-item">
            <form  action="/setCookie" method="post">
                <select style="margin-top: 10px;background-color: darkblue; border-radius: 150px; color: white" name="language">
                    <option>English</option>
                    <option>Russian</option>
                    <option>Kazakh</option>
                </select>
                <button style="color: white; background-color: black">OK</button>
            </form>
            </li>
        </ul>

        <%
            if (currentAdmin==null){
            if (currentUser==null){
        %>
        <form style="display: table; margin: 0 auto;"  action="/loginBeauty" method="post" class="d-flex" role="search">

            <input style="margin-left: 200px;" class="form-control me-2 email" type="text" placeholder="email" aria-label="Search" name="email" >
            <input class="form-control me-2 password" type="text" placeholder="password" aria-label="Search" name="password" >
            <button style="display: flex; background-color: aqua" type="submit"><strong>Login</strong>	&#128275;</button>

        </form>

        <%
            }
            }
        %>
    </div>
</nav>
