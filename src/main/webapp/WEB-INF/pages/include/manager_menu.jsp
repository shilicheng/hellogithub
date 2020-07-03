<%--
  Created by IntelliJ IDEA.
  User: lqshi
  Date: 2020/6/17
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ul style="padding-left:0px;" class="list-group">
    <c:choose>
        <c:when test="${empty sessionScope.pMenus}">
            <h3>没有菜单</h3>
        </c:when>
        <c:otherwise>
            <c:forEach items="${sessionScope.pMenus}" var="pMenu">
                <c:choose>
                    <c:when test="${empty pMenu.children}">
                        <li class="list-group-item tree-closed">
                            <a href="${PATH}/${pMenu.url}"><i class="${pMenu.icon}"></i> ${pMenu.name}</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="list-group-item tree-closed">
                                    <span><i class="${pMenu.icon}"></i> ${pMenu.name}
									<span class="badge" style="float:right">${pMenu.children.size()}</span></span>
                            <ul style="margin-top:10px;display:none;">
                                <c:forEach items="${pMenu.children}" var="child">
                                    <li style="height:30px;">
                                        <a href="${PATH}/${child.url}"><i
                                                class="${child.icon}"></i> ${child.name}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</ul>
