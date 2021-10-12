<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/views/admin/common/taglib.jsp" %>
 <c:url var="productAPI" value="/api/product" />
 <c:url var="productURL" value="/product/list" />
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
            <a class="btn btn-warning btn-sm" href="#">
                  <i class="fas fa-plus"></i>
                              Add
             </a>
          </div>
        </div>
        <div class="card-body p-0">
          <table class="table table-striped projects">
              <thead>
                  <tr>
                      <th >
                          Product Name
                      </th>
                      <th >
                          Image
                      </th>
                      <th>
                          Price
                      </th>
                      <th>
                          Quantity
                      </th>
                      <th  class="text-center">
                          Status
                      </th>
                      	<th>
                          CategoryId
                      </th>
                      <th>
                          Description
                      </th>
                      <th >
                      	
                      </th>
                  </tr>
              </thead>
              <tbody>
              <c:forEach var="item" items="${items}">
              		<tr>
                      <td>
							${item.name}
                      </td>
                      <td>
                          <img alt="Avatar" class="table-avatar" src="/assetsAd/dist/img/${item.imgUrl}">
                      </td>
                      <td>
							${item.price}
                      </td>
                      <td>
							${item.quantity}
                      </td>
                      <td class="project-state">
                          <span class="badge badge-success">${item.status}</span>
                      </td>
                      <td>
							${item.categoryCode} 
                      </td>
                      <td>
							${item.description}
                      </td>
                      <td class="project-actions text-right">
                          <a class="btn btn-primary btn-sm" href="#">
                              <i class="fas fa-folder">
                              </i>
                              View
                          </a>
                          <a class="btn btn-info btn-sm" href="#">
                              <i class="fas fa-pencil-alt">
                              </i>
                              Edit
                          </a>
                          <a class="btn btn-danger btn-sm" href="#">
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