<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<div id="titlebar" class="single with-map">
	<div class="container">
		<div class="sixteen columns">
			<div class="ten columns">
				<span class="showing_jobs" style="display: none"> Browse Jobs
				</span>
				<h2>
					We have <em class="count_jobs">${posts.size()}</em> <em
						class="job_text">job offers</em> for you
				</h2>
			</div>
		</div>
	</div>
</div>
<div class="container wpjm-container right-sidebar margin-top-55">
	<!-- Widgets -->
	<div class="five columns sidebar" role="complementary">
		<form class="job_filters in_sidebar">
			<input type="hidden" name="search_keywords" id="keywords"
				placeholder="job title, keywords or company name" value="" />
			<div class="job_filters_links"></div>
			<div class="widget">
				<h4>Location</h4>
				<div class="search_location">
					<input type="text" name="search_location" id="search_location"
						placeholder="Location" value="" /> <input type="text"
						name="search_radius" id="search_radius" value="50" /> <select
						class="radius_type" name="radius_type">
						<option value="miles">miles</option>
						<option value="km">km</option>
					</select>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="widget">
				<h4>Job type</h4>
				<ul class="job_types checkboxes">
					<li><input type="checkbox" name="filter_job_type[]"
						value="freelance" checked='checked' id="job_type_freelance" /> <label
						for="job_type_freelance" class="freelance"> Freelance</label></li>
					<li><input type="checkbox" name="filter_job_type[]"
						value="full-time" checked='checked' id="job_type_full-time" /> <label
						for="job_type_full-time" class="full-time"> Full Time</label></li>
					<li><input type="checkbox" name="filter_job_type[]"
						value="internship" checked='checked' id="job_type_internship" />
						<label for="job_type_internship" class="internship">
							Internship</label></li>
					<li><input type="checkbox" name="filter_job_type[]"
						value="part-time" checked='checked' id="job_type_part-time" /> <label
						for="job_type_part-time" class="part-time"> Part Time</label></li>
					<li><input type="checkbox" name="filter_job_type[]"
						value="temporary" checked='checked' id="job_type_temporary" /> <label
						for="job_type_temporary" class="temporary"> Temporary</label></li>
				</ul>
				<input type="hidden" name="filter_job_type[]" value="" />
			</div>
			<div class="widget">
				<h4>Category</h4>
				<div class="search_categories">
					<select name="categories" multiple="multiple"
							id="resume_category" class="chosen-select">
							<c:forEach items="${categories}" var="category">
								<option value="${category.getId()}">${category.getName()}</option>
							</c:forEach>
						</select>
				</div>
			</div>
			<div class="widget widget_range_filter" style="margin-bottom: 10px">
				<h4 class="checkboxes" style="margin-bottom: 0;">
					<input type="checkbox" name="filter_by_salary_check"
						id="salary_check" class="filter_by_check"> <label
						for="salary_check">Filter by Salary</label>
				</h4>
				<div class="widget_range_filter-inside">
					<div class="salary_amount range-indicator">
						<span class="from"></span> &mdash; <span class="to"></span>
					</div>
					<input type="hidden" name="filter_by_salary" id="salary_amount"
						type="checkbox">
					<div id="salary-range"></div>
					<div class="margin-bottom-50"></div>
				</div>
			</div>
			<div class="widget widget_range_filter">
				<h4 class="checkboxes" style="margin-bottom: 0;">
					<input type="checkbox" name="filter_by_rate_check"
						id="filter_by_rate" class="filter_by_check"> <label
						for="filter_by_rate">Filter by Rate</label>
				</h4>
				<div class="widget_range_filter-inside">
					<div class="rate_amount range-indicator">
						<span class="from"></span> &mdash; <span class="to"></span>
					</div>
					<input type="hidden" name="filter_by_rate" id="rate_amount"
						type="checkbox">
					<div id="rate-range"></div>
				</div>
			</div>

			<div class="widget widget_range_filter">
				<div class="filter_wide filter_by_tag">
					<h4>Filter by tag:</h4>
					<span class="filter_by_tag_cloud"></span>
				</div>
			</div>

		</form>
	</div>
	<!-- #secondary -->

	<article id="post-2871"
		class="eleven columns post-2871 page type-page status-publish hentry">
		<div class="padding-right">
			<form class="list-search" method="GET"
				action="/searchForm">
				<div class="search_keywords">
					<button>
						<i class="fa fa-search"></i>
					</button>
					<input type="text" name="keywords" id="keywords"
						placeholder="job title, keywords or company name" value="" />
					<div class="clearfix"></div>
				</div>
			</form>
			<div class="job_listings" data-location="" data-keywords=""
				data-show_filters="false" data-show_pagination="true"
				data-per_page="10" data-orderby="featured" data-order="DESC"
				data-categories="">
				<!-- Listings Loader -->
				<div class="listings-loader">
					<i class="fa fa-spinner fa-pulse"></i>
				</div>
				<ul class="job_listings job-list full ">
					<c:forEach items="${posts}" var="perpost">
						<li class="job_listing"><a
							href="${pageContext.request.contextPath}/post/${perpost.getId()}">
								<c:choose>
									<c:when test="${empty post.getCompany().getLogo()}">
										<td><img alt="Photo" width="70px" height="70px"
											src="<c:url value="/resources/images/company.png"/>" /></td>
									</c:when>
									<c:otherwise>
										<img width="70px" height="70px"
											src="${pageContext.request.contextPath}/imageCompany/${company.getId()}"
											alt="Photo" />
									</c:otherwise>
								</c:choose>
								<div class="job-list-content">
									<h4>
										${perpost.getTitle()}
										<c:forEach items="${perpost.getTypes()}" var="type">
											<span class="job-type ${type.getName()}">${type.getName()}</span>
										</c:forEach>
									</h4>

									<div class="job-icons">
										<span class="ws-meta-company-name"><i
											class="fa fa-briefcase"></i>
											${perpost.getCompany().getName()}</span> <span
											class="ws-meta-job-location"><i
											class="fa fa-map-marker"></i> <c:forEach
												items="${perpost.getLocations()}" var="location"
												varStatus="loop">${location.getName()}<c:if
													test="${!loop.last}">,</c:if>
											</c:forEach></span><span class="ws-meta-salary"> <i class="fa fa-money"></i>
											<c:choose>
												<c:when
													test="${perpost.getMinsalary() == 0 && perpost.getMaxsalary() == 0}">negotiate
									</c:when>
												<c:otherwise>
													<c:if test="${perpost.getMinsalary() != 0}">
							 from &#36;${perpost.getMinsalary()}</c:if> <c:if
														test="${perpost.getMaxsalary() != 0}">
							  to &#36;${perpost.getMaxsalary()}</c:if>
												</c:otherwise>
											</c:choose>
										</span>
									</div>
									<div class="listing-desc">
										<p>${fn:substring(perpost.getDescription(), 0, 100)}</p>
									</div>
								</div>
						</a>
							<div class="clearfix"></div></li>
					</c:forEach>
				</ul>
				<nav class="job-manager-pagination pagination">
					<ul>
						<li><span class="current" data-page="1">1</span></li>
						<li><a href="#" data-page="2">2</a></li>
						<li><a href="#" data-page="3">3</a></li>
						<li style="float: right; position: absolute; right: 0;"><a
							href="#" data-page="2">Next</a></li>
					</ul>
				</nav>
			</div>
			<footer class="entry-footer"> </footer>
		</div>
	</article>
</div>