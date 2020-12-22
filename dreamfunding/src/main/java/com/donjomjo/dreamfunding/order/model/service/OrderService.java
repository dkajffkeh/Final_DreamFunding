package com.donjomjo.dreamfunding.order.model.service;

import com.donjomjo.dreamfunding.order.model.vo.Shipping;
import com.donjomjo.dreamfunding.projectInsert.model.vo.ProjectInsert;

public interface OrderService {

	ProjectInsert selectProject(int pno);

	Shipping selectShipping(int mno);

}
