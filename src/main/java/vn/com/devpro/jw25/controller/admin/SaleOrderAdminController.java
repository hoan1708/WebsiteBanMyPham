package vn.com.devpro.jw25.controller.admin;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.com.devpro.jw25.controller.Constants;
import vn.com.devpro.jw25.dto.SaleOrder_Search;
import vn.com.devpro.jw25.model.Category;
import vn.com.devpro.jw25.model.Sale_Order;
import vn.com.devpro.jw25.model.Sale_Order_Product;
import vn.com.devpro.jw25.model.User;
import vn.com.devpro.jw25.service.SaleOrderService;
import vn.com.devpro.jw25.service.SaleOrder_Product_Service;
import vn.com.devpro.jw25.service.UserService;


@Controller
public class SaleOrderAdminController implements Constants{
	
	@Autowired
	UserService userService;
	
	@Autowired
	SaleOrderService saleOrderService; 
	
	@Autowired
	SaleOrder_Product_Service saleOrderProductService;
	
	@RequestMapping(value="/manager/list-saleOrder", method= RequestMethod.GET)
		public String listCategory(
				final Model model, 
				final HttpServletRequest request,
				final HttpServletResponse response
				) throws IOException {

			int status = 2;
			if (!StringUtils.isEmpty(request.getParameter("status"))) {
				status = Integer.parseInt(request.getParameter("status"));
			}

			String beginDate = null;
			String endDate = null;
			
			if (!StringUtils.isEmpty(request.getParameter("beginDate")) &&
					!StringUtils.isEmpty(request.getParameter("endDate"))) {		
				beginDate = request.getParameter("beginDate");
				endDate = request.getParameter("endDate");
			}
					
			SaleOrder_Search saleOrderSearch = new SaleOrder_Search();
			saleOrderSearch.setStatus(status);
			saleOrderSearch.setKeyWord(request.getParameter("keyword"));
			saleOrderSearch.setBeginDate(beginDate);
			saleOrderSearch.setEndDate(endDate);
			
			//Phan trang
			saleOrderSearch.setSizeOfPage(SIZE_OF_PAGE);
			saleOrderSearch.setTotalItems(saleOrderService.findAll().size());
//			System.out.println("Size of page : " + SIZE_OF_PAGE);
//			System.out.println("Total items : " + saleOrderSearch.getTotalItems());
			int currentPage = 1;
			if (!StringUtils.isEmpty(request.getParameter("page"))) {
				currentPage = Integer.parseInt(request.getParameter("page"));
			}
			saleOrderSearch.setCurrentPage(currentPage);
//			System.out.println("Current page " + saleOrderSearch.getCurrentPage());
			//Het phan trang
//			List<SaleOrder> saleOrders = saleOrderService.findAll();
			
			List<Sale_Order> ds_saleOrder = saleOrderService.searchSaleOrderService(saleOrderSearch);
//			System.out.println("Size of saleOrder : " + ds_saleOrder.size());
					
			BigDecimal totalSales = BigDecimal.ZERO;
			for (Sale_Order saleOrder : ds_saleOrder) {
				totalSales = totalSales.add(saleOrder.getTotal());
			}
//			System.out.println("Total sales : " + totalSales);
			model.addAttribute("ds_saleOrder", ds_saleOrder);
			model.addAttribute("totalSales", totalSales);
			model.addAttribute("saleOrderSearch", saleOrderSearch);
			
			ArrayList<User> users = new ArrayList<User>();
			users = (ArrayList<User>) userService.findAll();
			
			model.addAttribute("users", users);
			
		return "/admin/ad-list-saleOrder";
	}
	
	// show edit saleOrder
	@RequestMapping(value="/manager/showEditSaleOrder/{id_saleOrder}", method= RequestMethod.GET)
	public String showFormEditSaleOrder(
			final @ModelAttribute("saleOrder") Sale_Order sale_Order,
			final @PathVariable("id_saleOrder") int id,
			final Model model 
			) {
		
		// set update now là ngày hôm nay 
		Date dateCurrent = new Date();
		
		// lấy ra sale order được ch�?n 
		Sale_Order saleOrder = saleOrderService.getById(id);
		saleOrder.setUpdateDate(dateCurrent);
		
		List<User> dsUser = userService.findAll(); 
		System.out.println("size of user : " + dsUser);

		
		model.addAttribute("dsUser",dsUser);
		model.addAttribute("saleOrder",saleOrder);
		
		return "/admin/ad-edit-saleOrder";
	}
	
	// edit saleOrder
	@RequestMapping(value="/manager/editSaleOrder", method= RequestMethod.POST)
	public String editSaleOrder(
			final @ModelAttribute("saleOrder") Sale_Order sale_Order ,
			final Model model 
			) {
		
		if(sale_Order.getId()!=null) {
			saleOrderService.saveOrUpdate(sale_Order);
			model.addAttribute("saleOrder", new Sale_Order());
		}
		
		return "/admin/ad-edit-saleOrder";
	}

	// delete saleOrder 
//	@RequestMapping(value="/manager/deleteSaleOrder/{idSaleOrder}" , method=RequestMethod.GET)
//	public String deleteSaleOrder(
//			@PathVariable("idSaleOrder") int id
//			) {
//
//		Sale_Order dbSaleOrder = saleOrderService.getById(id);
//		
//		saleOrderService.deleteSaleOrder(dbSaleOrder);
//		
//		return "redirect:/manager/list-saleOrder";
//	}
}
