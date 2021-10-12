<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/views/admin/common/taglib.jsp" %>
 <c:url var="categoryAPI" value="/api/category" />
 <c:url var="categoryURL" value="/category/list" />
<!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
         <div class="card-title">
                <div class="input-group input-group-sm">
                  <input type="text" class="form-control" placeholder="Search">
                  <div class="input-group-append">
                    <div class="btn btn-primary">
                    	<a href="/search"><i class="fas fa-search"></i></a>
                    </div>
                  </div>
                </div>
              </div>
			
          <div class="card-tools">
          	<c:url var="addCategoryUrl" value="/category/edit"/>
            <a class="btn btn-warning btn-sm" href="${addCategoryUrl}">
                  <i class="fas fa-plus"></i>
                              Add
             </a>
          </div>
        </div>
        <div class="card-body p-0">
          <table class="table table-striped projects">
              <thead>
                  <tr>
                      <th style="width: 1%">
                          #
                      </th>
                      <th >
                          Category Name
                      </th>
                      <th >
                          Category code
                      </th>
                      <th >
                      	
                      </th>
                  </tr>
              </thead>
              <tbody>
              <c:forEach var="item" items="${list}">
              		<tr>
              		<input type="hidden" value="${item.id}" id="categoryId" />
                      <td>
                          ${item.id}
                      </td>
                      <td>
							${item.name}
                      </td>
                      <td>
							${item.code}
                      </td>
                      <td class="project-actions text-right">
                          <a class="btn btn-primary btn-sm" href="#">
                              <i class="fas fa-folder">
                              </i>
                              View
                          </a>
                          <c:url var="updateCategoryURL" value="/category/edit">
								<c:param name="id" value="${item.id}"/>
							</c:url>
                          <a class="btn btn-info btn-sm" href="${updateCategoryURL}">
                              <i class="fas fa-pencil-alt">
                              </i>
                              Edit
                          </a>
                          <a class="btn btn-danger btn-sm" onclick="warningBeforeDelete()">
                              <i class="fas fa-trash">
                              </i>
                              Delete
                          </a>
                      </td>
                  </tr>
              </c:forEach>
                  
              </tbody>
          </table>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->
 <script type="text/javascript">
 function warningBeforeDelete(){
		swal({
			  title: "Are you sure?",
			  text: "You will not be able to recover this imaginary file!",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonClass: "btn-danger",
			  confirmButtonText: "Yes, delete it!",
			  cancelButtonText: "No, cancel plx!",
			  closeOnConfirm: false,
			  closeOnCancel: false
			}).then(function(isConfirm) {
			  if (isConfirm) {
					var id = $('#categoryId').val();
					deleteNew(id);
			  } else {
			    swal("Cancelled", "Your imaginary file is safe :)", "error");
			  }
			});
	}
 function deleteNew(data) {
     $.ajax({
         url: '${categoryAPI}',
         type: 'DELETE',
         contentType: 'application/json',
         data: JSON.stringify(data),
         success: function (result) {
             window.location.href = "${categoryURL}?message=delete_success";
         },
         error: function (error) {
         	window.location.href = "${categoryURL}?message=error_system";
         }
     });
 }
</script>