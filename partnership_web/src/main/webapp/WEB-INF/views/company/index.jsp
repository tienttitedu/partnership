<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="s"%>
<div class="clearfix"></div>
<div id="titlebar" class="single">
	<div class="container">

		<div class="sixteen columns">

			<h1>Company Dashboard</h1>
			<nav id="breadcrumbs" xmlns:v="http://rdf.data-vocabulary.org/#">
				<ul>
					<li class="home"><span><a title="Go to WorkScout."
							href="../workscout.html" class="home"><span>Home</span></a> </span></li>
					<li class="current_item"><span><span>Company
								Dashboard</span> </span></li>
				</ul>
			</nav>
			<c:if test="${MESSAGE != null}">
					${MESSAGE}
				</c:if>
		</div>
	</div>
</div>
<div class="container full-width">

	<article id="post-14"
		class="sixteen columns woocommerce-account post-14 page type-page status-publish hentry">

			<table
				class="resume-manager-resumes manage-table resumes responsive-table stacktable large-only">
				<thead>
					<tr>
						<th>Name</th>
						<th>Description</th>
						<th>Address</th>
						<th>Logo</th>
						<th>Details</th>
				</thead>
				<tbody>
					<c:forEach var="company" items="${companies}">
						
						<tr class="photo-rounded1">
							
								
									<td>${company.getName()}</td>
									<td>${s:substring(company.getTagline(),0,10)}..</td>
									<td>${company.getAddress()}</td>
									<c:choose>
										<c:when test="${empty company.getLogo()}">
											<td><img
												src="<c:url value="/resources/images/company.png"/>"
												width="100px" height="100px" /></td>
										</c:when>
										<c:otherwise>
											<td><img
												src="${pageContext.request.contextPath}/imageCompany/${company.getId()}"
												width="100px" height="100px" /></td>
										</c:otherwise>
									</c:choose>
								
							<td><a class="button" href="${pageContext.request.contextPath}/company/${company.getId()}" >view</a></td>
							
						</tr>
						
					</c:forEach>
				<tbody>
			</table>

		<footer class="entry-footer"> </footer>
		<!-- .entry-footer -->


	</article>
</div>