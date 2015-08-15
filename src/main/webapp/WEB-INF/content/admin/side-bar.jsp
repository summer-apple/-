<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="sidebar-menu toggle-others fixed">

	<div class="sidebar-menu-inner">

		<header class="logo-env">

			<!-- logo -->
			<div class="logo">
				<a href="dashboard-1.html" class="logo-expanded"> <img
					src="../resources/images/logo@2x.png" width="80" alt="" />
				</a> <a href="dashboard-1.html" class="logo-collapsed"> <img
					src="../resources/images/logo-collapsed@2x.png" width="40" alt="" />
				</a>
			</div>

			<!-- This will toggle the mobile menu and will be visible only on mobile devices -->
			<div class="mobile-menu-toggle visible-xs">
				<a href="#" data-toggle="mobile-menu"> <i class="fa-bars"></i>
				</a>
			</div>

		</header>



		<ul id="main-menu" class="main-menu">
			<!-- service & facility -->
			<li><a href="#"> <span class="title">服务&设施管理</span>
			</a>
				<ul>
					<li><a href="add-base"> <span class="title">新增服务&设施</span>
					</a></li>
					<li><a href="qry-base"> <span class="title">查询服务&设施</span>
					</a></li>
				</ul></li>
			<!-- store -->
			<li><a href="#"> <span class="title">商家管理</span>
			</a>
				<ul>
					<li><a href="add-store"> <span class="title">新增商家</span>
					</a></li>
					<li><a href="qry-store"> <span class="title">查询&修改商家</span>
					</a></li>
				</ul></li>
			<!-- villa -->
			<li><a href="#"> <span class="title">别墅管理</span>
			</a>
				<ul>
					<li><a href="add-villa"> <span class="title">新增别墅</span>
					</a></li>
					<li><a href="qry-villa"> <span class="title">查询&修改别墅</span>
					</a></li>
				</ul></li>
			<!-- order -->
			<li><a href="qry-order"> <span class="title">订单管理</span>
			</a></li>
			<!-- member -->
			<li><a href="qry-member"> <span class="title">用户管理</span>
			</a></li>

		</ul>

	</div>

</div>