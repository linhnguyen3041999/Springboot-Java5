<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/views/web/common/taglib.jsp" %>

<!-- Main content -->
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Shopping Cart</h2>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End Page title area -->
    
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="single-sidebar">
                        <h2 class="sidebar-title">Search Products</h2>
                        <form action="#">
                            <input type="text" placeholder="Search products...">
                            <input type="submit" value="Search">
                        </form>
                    </div>
                    
                    <div class="single-sidebar">
                        <h2 class="sidebar-title">Products</h2>
                        <div class="thubmnail-recent">
                            <img src="/template/img/product-thumb-1.jpg" class="recent-thumb" alt="">
                            <h2><a href="single-product.html">Sony Smart TV - 2015</a></h2>
                            <div class="product-sidebar-price">
                                <ins>$700.00</ins> <del>$800.00</del>
                            </div>                             
                        </div>
                        <div class="thubmnail-recent">
                            <img src="/template/img/product-thumb-1.jpg" class="recent-thumb" alt="">
                            <h2><a href="single-product.html">Sony Smart TV - 2015</a></h2>
                            <div class="product-sidebar-price">
                                <ins>$700.00</ins> <del>$800.00</del>
                            </div>                             
                        </div>
                        <div class="thubmnail-recent">
                            <img src="/template/img/product-thumb-1.jpg" class="recent-thumb" alt="">
                            <h2><a href="single-product.html">Sony Smart TV - 2015</a></h2>
                            <div class="product-sidebar-price">
                                <ins>$700.00</ins> <del>$800.00</del>
                            </div>                             
                        </div>
                        <div class="thubmnail-recent">
                            <img src="/template/img/product-thumb-1.jpg" class="recent-thumb" alt="">
                            <h2><a href="single-product.html">Sony Smart TV - 2015</a></h2>
                            <div class="product-sidebar-price">
                                <ins>$700.00</ins> <del>$800.00</del>
                            </div>                             
                        </div>
                    </div>
                    
                    <div class="single-sidebar">
                        <h2 class="sidebar-title">Recent Posts</h2>
                        <ul>
                            <li><a href="#">Sony Smart TV - 2015</a></li>
                            <li><a href="#">Sony Smart TV - 2015</a></li>
                            <li><a href="#">Sony Smart TV - 2015</a></li>
                            <li><a href="#">Sony Smart TV - 2015</a></li>
                            <li><a href="#">Sony Smart TV - 2015</a></li>
                        </ul>
                    </div>
                </div>
                
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">
                            
                                <table cellspacing="0" class="shop_table cart">
                                    <thead>
                                        <tr>
                                            <th class="product-remove">&nbsp;</th>
                                            <th class="product-thumbnail">&nbsp;</th>
                                            <th class="product-name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-subtotal">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                   	<c:forEach var="item" items='${currentCart.listDetail}'>
                                   	<form method="get" action="/update" id="formSubmit">	 
                                   			 <tr class="cart_item">
                                   			 	<input type="hidden" value="${item.getValue().productId}" name="productId"/>
	                                            <td class="product-remove">
	                                                <a title="Remove this item" class="remove" onclick="remove()" href="#">×</a> 
	                                            </td>
	
	                                            <td class="product-thumbnail">
	                                                <a href="single-product.html"><img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="${item.getValue().imgUrl}"></a>
	                                            </td>
												
	                                            <td class="product-name">
	                                                <a href="single-product.html">${item.getValue().productName}</a> 
	                                            </td>
												
	                                            <td class="product-price">
	                                                <span class="amount"><ins><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.getValue().price}"/></ins></span> 
	                                            </td>
													
	                                            <td class="product-quantity">
	                                                <div class="quantity buttons_added">
	                                                    <input type="number" size="4" class="input-text qty text" title="Qty" name="quantity" id="quantity" onchange="this.form.submit()" value="${item.getValue().quantity}" min="0" step="1">
	                                                </div>
	                                            </td>
	
	                                            <td class="product-subtotal">
	                                                <span class="amount"><ins><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.getValue().price*item.getValue().quantity}"/></ins></span> 
	                                            </td>
	                                        </tr>
                                   	</form>
                              </c:forEach>
                                       
                                        <tr>
                                            <td class="actions" colspan="6">
                                                <div class="coupon">
                                                    <label for="coupon_code">Coupon:</label>
                                                    <input type="text" placeholder="Coupon code" value="" id="coupon_code" class="input-text" name="coupon_code">
                                                    <input type="submit" value="Apply Coupon" name="apply_coupon" class="button">
                                                </div>
                                                <a href="/checkout"><input type="submit" value="Checkout" name="proceed" class="checkout-button button alt wc-forward"></a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                           

                            <div class="cart-collaterals">


                            <div class="cross-sells">
                                <h2>You may be interested in...</h2>
                                <ul class="products">
                                    <li class="product">
                                        <a href="single-product.html">
                                            <img width="325" height="325" alt="T_4_front" class="attachment-shop_catalog wp-post-image" src="/template/img/product-2.jpg">
                                            <h3>Ship Your Idea</h3>
                                            <span class="price"><span class="amount">£20.00</span></span>
                                        </a>

                                        <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="22" rel="nofollow" href="single-product.html">Select options</a>
                                    </li>

                                    <li class="product">
                                        <a href="single-product.html">
                                            <img width="325" height="325" alt="T_4_front" class="attachment-shop_catalog wp-post-image" src="/template/img/product-4.jpg">
                                            <h3>Ship Your Idea</h3>
                                            <span class="price"><span class="amount">£20.00</span></span>
                                        </a>

                                        <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="22" rel="nofollow" href="single-product.html">Select options</a>
                                    </li>
                                </ul>
                            </div>


                            <div class="cart_totals ">
                                <h2>Cart Totals</h2>

                                <table cellspacing="0">
                                    <tbody>
                                        <tr class="cart-subtotal">
                                            <th>Cart Subtotal</th>
                                            <td><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="3" value="${currentCart.totalPrice}"/></span></td>
                                        </tr>

                                        <tr class="shipping">
                                            <th>Shipping and Handling</th>
                                            <td>Free Shipping</td>
                                        </tr>

                                        <tr class="order-total">
                                            <th>Order Total</th>
                                            <td><strong><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="3" value="${currentCart.totalPrice}"/></span></strong> </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            </div>
                        </div>                        
                    </div>                    
                </div>
            </div>
        </div>
    </div>
 <script type="text/javascript">
 var url = window.location.search;
 if( url == "?checkout=success"){
	 Swal.fire({
		  icon: 'success',
		  title: 'Thanh toán thành công!',
		  showConfirmButton: false,
		  timer: 1500
		});
 }
 function updateCart(productId) {
	 	var name = "quantity"+productId;
	 	var quantity = '\'#'+name+'\'';
	 	var quantity1 = $(quantity).val();
		var apiUrl = '/api/cart/update?productId=' + productId + '&quantity='+quantity+'&isReplate=false';
		$.ajax({
				type: "GET",
				contentType : "application/json",
				url: apiUrl,
				async: false,
				success: function(currentCart) {
					alert('Added product to your cart!')
					$('#totalPrice').text(numberWithDot(currentCart.totalPrice));
				},
				error: function(e) {
					alert(e);
 	    	}
 	   });
	}
	
	function numberWithDot(x) {
	    return x.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ".");
	}
function remove() {
	$('#quantity').val(0);
	$('#formSubmit').submit();
	
}
</script>