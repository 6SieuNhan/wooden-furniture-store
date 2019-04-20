<%-- any content can be specified here e.g.: --%>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar-default navbar-side" role="navigation">
    <div id="sideNav" href=""></div>
    <div class="sidebar-collapse">
        <ul class="nav" id="main-menu">
            <li>
                <a
                    <c:if test= "${param.page == 'userlist'}">
                        class="active-menu"
                    </c:if>
                    href="dashboard?action=userlist"><i class="fa"></i>Danh sách người dùng</a>
            </li>
            <li>
                <a
                    <c:if test= "${param.page == 'categorylist'}">
                        class="active-menu"
                    </c:if>
                        href="dashboard?action=categorylist"><i class="fa"></i>Danh sách các loại danh mục</a>
            </li>
            <li>
                <a
                    <c:if test= "${param.page == 'productlist'}">
                        class="active-menu"
                    </c:if>
                        href="dashboard?action=productlist"><i class="fa"></i>Danh sách sản phẩm</a>
            </li>
            <li>
                <a
                    <c:if test= "${param.page == 'order'}">
                        class="active-menu"
                    </c:if>
                        href="dashboard?action=order"><i class="fa"></i>Danh sách hóa đơn</a>
            </li>
            <li>
                <a
                    <c:if test= "${param.page == 'messagelist'}">
                        class="active-menu"
                    </c:if>
                        href="dashboard?action=messagelist"><i class="fa"></i>Danh sách tin nhắn</a>
            </li>
            <li>
                <a
                    <c:if test= "${param.page == 'accountinfo'}">
                        class="active-menu"
                    </c:if>
                        href="dashboard?action=accountinfo"><i class="fa"></i>Thông tin cá nhân</a>
            </li>
            <li>
                <a
                    <c:if test= "${param.page == 'editpassword'}">
                        class="active-menu"
                    </c:if>
                        href="dashboard?action=editpassword"><i class="fa"></i>Thay đổi mật khẩu</a>
            </li>
            <li>
                <a href="home"><i class="fa"></i>Trở về trang chủ</a>
            </li>
        </ul>
    </div>
</nav>