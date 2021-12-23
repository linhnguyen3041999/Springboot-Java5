<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/common/taglib.jsp"%>
<c:url var="productAPI" value="/api/product" />
<c:url var="productURL" value="/admin/product/list" />
<!-- Main content -->
<section class="content">

	<!-- Default box -->
	<div class="card">
		<div class="card-header">
			<div class="card-title">
				<form action="/admin/product/search" method="post">
					<div class="input-group input-group-sm">
						<input type="text" name="keyword" class="form-control"
							placeholder="Search">
						<div class="input-group-append">
							<button type="submit" class="btn btn-primary">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
			<div class="card-tools">
				<c:url var="addProductUrl" value="/admin/product/edit" />
				<a class="btn btn-warning btn-sm" href="${addProductUrl}"> <i
					class="fas fa-plus"></i> Add
				</a>
			</div>
		</div>
		<div class="card-body p-0">
			<table class="table table-striped projects">
				<thead>
					<tr>
						<th>Product Name</th>
						<th>Image</th>
						<th>Price</th>
						<th>Quantity</th>
						<th class="text-center">Status</th>
						<th>CategoryId</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${items}">
						<tr>
							<td>${item.name}</td>
							<td><img alt="Avatar" class="table-avatar"
								src="${item.imgUrl}"></td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3"
									value="${item.price}" /></td>
							<td>${item.quantity}</td>
							<td class="project-state"><span class="badge badge-success">${item.status}</span>
							</td>
							<td>${item.categoryCode}</td>
							<td class="project-actions text-right">
							<c:url var="updateProductURL" value="/admin/product/edit">
									<c:param name="id" value="${item.id}" />
								</c:url> <a class="btn btn-info btn-sm" href="${updateProductURL}">
									<i class="fas fa-pencil-alt"> </i> Edit
							</a> <a class="btn btn-danger btn-sm"
								href="/admin/product/delete/${item.id}"> <i
									class="fas fa-trash"> </i> Delete
							</a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
		<!-- /.card-body -->
	</div>
	<!-- /.card -->
	<form action="/admin/product/list" id="formSubmit">
		<div class="row" style="justify-content: center;">
			<ul class="pagination" id="pagination"></ul>
			<input type="hidden" value="" id="page" name="page" /> <input
				type="hidden" value="" id="limit" name="limit" />
		</div>
	</form>
</section>
<!-- /.content -->
<script type="text/javascript">
    var url = window.location.search;
    if( url == "?message=insert_success"){
    	const Toast = Swal.mixin({
    		  toast: true,
    		  position: 'top-end',
    		  showConfirmButton: false,
    		  timer: 3000,
    		  timerProgressBar: true,
    		  didOpen: (toast) => {
    		    toast.addEventListener('mouseenter', Swal.stopTimer)
    		    toast.addEventListener('mouseleave', Swal.resumeTimer)
    		  }
    		})

    		Toast.fire({
    		  icon: 'success',
    		  title: 'Thêm Mới Thành Công!'
    		})
    }else if( url == "?message=update_success"){
   	 const Toast = Swal.mixin({
		  toast: true,
		  position: 'top-end',
		  showConfirmButton: false,
		  timer: 3000,
		  timerProgressBar: true,
		  didOpen: (toast) => {
		    toast.addEventListener('mouseenter', Swal.stopTimer)
		    toast.addEventListener('mouseleave', Swal.resumeTimer)
		  }
		})

		Toast.fire({
		  icon: 'success',
		  title: 'Cập Nhật Thành Công!'
		})
	}
    var totalPages = ${totalPage};
	var currentPage = ${currentPage};
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages: totalPages,
				visiblePages: 10,
				startPage: currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						$('#limit').val(5);
						$('#page').val(page);
						$('#formSubmit').submit();
					}
				}
			});
		});
    
  function warningBeforeDelete(id){
	  const swalWithBootstrapButtons = Swal.mixin({
		  customClass: {
		    confirmButton: 'btn btn-danger m-2',
		    cancelButton: 'btn btn-success m-1'
		  },
		  buttonsStyling: false 
		})
		swalWithBootstrapButtons.fire({
		  title: 'Are you sure?',
		  text: "",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonText: 'Yes, delete it!',
		  cancelButtonText: 'No, cancel!',
		  reverseButtons: true
		}).then((result) => {
		  if (result.isConfirmed) {
				deleteNew(id);
		    swalWithBootstrapButtons.fire(
		      'Deleted!',
		      'Your file has been deleted.',
		      'success'
		    )
		  } else if (
		    /* Read more about handling dismissals below */
		    result.dismiss === Swal.DismissReason.cancel
		  ) {
		    swalWithBootstrapButtons.fire(
		      'Cancelled',
		      'Your file is safe :)',
		      'error'
		    )
		  }
		})
	}
</script>