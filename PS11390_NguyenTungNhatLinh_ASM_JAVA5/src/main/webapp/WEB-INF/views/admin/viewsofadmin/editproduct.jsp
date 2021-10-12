<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/views/admin/common/taglib.jsp" %>
 <c:url var="productAPI" value="/api/product" />
 <c:url var="productURL" value="/product/list" />
<!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">
        
        	<div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">General</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <form:form role="form" id="formSubmit"
							modelAttribute="model" enctype="multipart/form-data">
            <div class="card-body">
              <div class="form-group">
                <label for="inputName">Name</label>
                <form:input type="text" path="name" class="form-control"/>
              </div>
			  <div class="form-group">
                <label for="inputName">Code</label>
                <form:input type="text" path="code" class="form-control"/>
              </div>
              <div class="form-group">
                <label for="inputName">Image</label>
                <img id="image" name="image" src="/template/img/product-1.jpg" width="90px">
                <form:input type="file" path="imageFile" onchange="chooseFile(this)" class="form-control"/>
              </div>
              <div class="form-group">
                <label for="inputName">Price</label>
                <form:input type="text" path="price" class="form-control"/>
              </div>
              <div class="form-group">
                <label for="inputName">Quantity</label>
                <form:input type="text" path="quantity" class="form-control"/>
              </div>
              <div class="form-group">
                <label for="inputName">Status</label>
                <form:select path = "status">
                       <form:option value = "NONE" label = "Select"/>
                       <form:options items = "${listStatus}" />
                </form:select> 
              </div>
              <div class="form-group">
                <label for="inputName">Category code</label>
                <form:select path = "categoryCode">
                       <form:option value = "NONE" label = "Select"/>
                       <form:options items = "${listCategoryCode}" />
                </form:select> 
              </div>
              <div class="form-group">
                <label for="inputName">Description</label>
                <form:input type="text" path="code" class="form-control"/>
              </div>
            </div>
            <form:hidden path="id" id="productId" />
            <c:if test="${empty model.id}">
										<button class="btn btn-info" type="button"
											id="btnAddOrUpdateNew">
											<i class="ace-icon fa fa-check bigger-110"></i> Thêm
										</button>
				</c:if>
				<c:if test="${not empty model.id}">
										<button class="btn btn-info" type="button"
											id="btnAddOrUpdateNew">
											<i class="ace-icon fa fa-check bigger-110"></i> Cập nhật
										</button>
				</c:if>
            <!-- /.card-body -->
             </form:form>
          </div>
          <!-- /.card -->
       
          
        </div>
      </div>
      <div class="row">
        <div class="col-12">
          <a href="#" class="btn btn-secondary">Cancel</a>
          <input type="submit" value="Create new Project" class="btn btn-success float-right">
        </div>
      </div>
    </section>
    <!-- /.content -->
    
 <script type="text/javascript">
 function chooseFile(fileInput){
   if(fileInput.files && fileInput.files[0]){
     var reader = new FileReader();
     reader.onload = function(e){
       $('#image').attr('src',e.target.result);
     }
     reader.readAsDataURL(fileInput.files[0])
   }
 }

 $('#btnAddOrUpdateNew').click(function(e) {
		e.preventDefault();
		var data = {};
		var formData = $('#formSubmit').serializeArray();
		
		$.each(formData, function (i, v) {
         data[""+v.name+""] = v.value;
     });
		var id = $("#productId").val();
		var file_data = $('input[name="imageFile"]')[0].files;
		for (var i = 0; i < file_data.length; i++) {
		    data["imageFile"] = file_data[i];
		}
		if (id == "") {
			addNew(data);
		} else {
			updateNew(data);
		}
		console.log(formData);
	});
 function addNew(data) {
		$.ajax({
         url: '${productAPI}',
         type: 'POST',
         contentType: 'application/json', // gui tu clien -> servler
         data: JSON.stringify(data),		// chuyen từ js object -> JSON
         dataType: 'json',		//server - >client
         success: function (result) {
         	window.location.href = "${productURL}?id="+result.id+"&message=insert_success";
         },
         error: function (error) {
         	//window.location.href = "${newURL}?page=1&limit=2&message=error_system";
         }
     });
	}

	function updateNew(data) {
		$.ajax({
         url: '${productAPI}',
         type: 'PUT',
         contentType: 'application/json',
         data: JSON.stringify(data),
         dataType: 'json',
         success: function (result) {
         	window.location.href = "${productURL}?id="+result.id+"&message=update_success";
         },
         error: function (error) {
         	window.location.href = "${editNewURL}?id="+result.id+"&message=error_system";
         }
     }); 
	}
</script>