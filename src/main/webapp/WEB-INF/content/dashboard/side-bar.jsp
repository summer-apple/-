<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="sidebar-menu toggle-others fixed">
<!-- <div class="sidebar-menu toggle-others fixed collapsed"> -->

	<div class="sidebar-menu-inner">

		<header class="logo-env">

			<!-- logo -->
			<div class="logo">
				<a href="dashboard-1.html" class="logo-expanded"> <img
					src="resources/images/logo@2x.png" width="80" alt="" />
				</a> <a href="dashboard-1.html" class="logo-collapsed"> <img
					src="resources/images/logo-collapsed@2x.png" width="40" alt="" />
				</a>
			</div>

			<!-- This will toggle the mobile menu and will be visible only on mobile devices -->
			<div class="mobile-menu-toggle visible-xs">
				<a href="#" data-toggle="user-info-menu"> <i class="fa-bell-o"></i>
					<span class="badge badge-success">7</span>
				</a> <a href="#" data-toggle="mobile-menu"> <i class="fa-bars"></i>
				</a>
			</div>

			<!-- This will open the popup with user profile settings, you can use for any purpose, just be creative -->
			<div class="settings-icon">
				<a href="#" data-toggle="settings-pane" data-animate="true"> <i
					class="linecons-cog"></i>
				</a>
			</div>


		</header>



		<ul id="main-menu" class="main-menu">
			<!-- add class "multiple-expanded" to allow multiple submenus to open -->
			<!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->
			<li><a href="#">
					<i class="linecons-cog"></i> <span class="title">服务&设施</span>
			</a>
				<ul>
					<li><a href="dashboard/svs"> <span class="title">服务管理</span>
					</a></li>
					<li><a href="dashboard/facility"> <span class="title">设施管理</span>
					</a></li>
				</ul></li>
			<li>
				<a href="dashboard/store"> 
					<i class="linecons-database"></i> <span class="title">商户管理</span>
				</a>
			</li>
			<li>
				<a href="dashboard/member"> 
					<i class="linecons-star"></i> <span class="title">用户管理</span>
				</a>
			</li>
			<li><a href="#">
					<i class="linecons-cog"></i> <span class="title">别墅管理</span>
			</a>
				<ul>
					<li><a href="dashboard/villa"> <span class="title">查询别墅</span>
					</a></li>
					<li><a href="dashboard/add-villa"> <span class="title">新增别墅</span>
					</a></li>
				</ul></li>
			<li>
			<li>
				<a href="dashboard/order"> 
					<i class="linecons-mail"></i> <span class="title">订单管理</span>
				</a>
			</li>
			<li>
				<a href="dashboard/comment"> 
					<i class="linecons-params"></i> <span class="title">评价管理</span>
				</a>
			</li>
		</ul>

	</div>

</div>