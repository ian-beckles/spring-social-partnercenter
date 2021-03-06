package org.springframework.social.partnercenter.api.order;

import org.springframework.http.ResponseEntity;
import org.springframework.social.partnercenter.api.PartnerCenterResponse;

public interface 	OrderOperations {
	ResponseEntity<PartnerCenterResponse<Order>> getACustomersOrders(String customerId);
	ResponseEntity<Order> getById(String customerId, String orderId);
	ResponseEntity<Order> createAddOnOrder(String customerId, String orderId, Order order);
	ResponseEntity<Order> createOrder(String customerId, Order request);
}
