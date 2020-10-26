package com.techzone.springmvc.controller.manager;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.techzone.springmvc.entity.Brand;
import com.techzone.springmvc.entity.Category;
import com.techzone.springmvc.entity.Image;
import com.techzone.springmvc.entity.Product;
import com.techzone.springmvc.entity.ProductDetail;
import com.techzone.springmvc.entity.Sale;
import com.techzone.springmvc.exception.ResourceNotFoundException;
import com.techzone.springmvc.model.ProductModel;
import com.techzone.springmvc.repository.ProductRepository;
import com.techzone.springmvc.service.BrandService;
import com.techzone.springmvc.service.CategoryService;
import com.techzone.springmvc.service.ImageService;
import com.techzone.springmvc.service.ProductDeTailService;
import com.techzone.springmvc.service.ProductService;
import com.techzone.springmvc.service.SaleService;
import com.techzone.springmvc.storage.FileStorageService;
import com.techzone.springmvc.util.ConvertUnicodeUtil;
import com.techzone.springmvc.validator.ProductValidator;

@Controller
@RequestMapping("/admin/product")
public class ProductController {

	private static int indexPage = 0;
	private static int sizePage = 5;
	private int sizeList;

	private static final Logger LOG = LoggerFactory.getLogger(ProductController.class);
	private static String message = "";

	// TODO : Dependency Injection
	@Autowired
	private ProductService productService;

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private ProductDeTailService productDetailService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private BrandService brandService;

	@Autowired
	private SaleService saleService;

	@Autowired
	private FileStorageService fileStorageService;

	@Autowired
	private ConvertUnicodeUtil convertUnicodeUtil;

	@Autowired
	private ImageService imageService;

	@Autowired
	private ProductValidator productValidator;

	@Autowired
	private HttpSession session;

	// TODO : Dependency Injection

	@GetMapping("/")
	public String handleOrigin() {
		return "redirect:/admin/product/list";
	}

	@GetMapping("/list")
	public String listProductPanigation(ModelMap theModel) {

		Pageable pageCustoms = PageRequest.of(indexPage, sizePage);

		Page<Product> pageProducts = productRepository.findAll(pageCustoms);

		sizeList = productService.getProducts().size();

		theModel.addAttribute("indexPage", indexPage);
		theModel.addAttribute("totalPage", (int) Math.floor(sizeList / sizePage));

		theModel.addAttribute("products", pageProducts.getContent());
		theModel.addAttribute("message", message);

		return "/admin/list-products";

	}

	@GetMapping("/showForm")
	public String showFormProduct(ModelMap theModel) {

		LOG.debug("inside show customer-form handler method");

		theModel.addAttribute("productModel", new ProductModel());

		getDependencyForProductProcess(theModel);

		return "/admin/form-product";
	}

	public boolean checkIsValidFiles(List<MultipartFile> files) {

		int size = files.size();
		System.err.println("FILE SIZE : " + size);

		String fileName = "";

		for (int i = 0; i < size; i++) {

			fileName = files.get(i).getOriginalFilename();

			if (fileStorageService.getSuffixes(fileName).compareTo("") == 0) {
				return false;
			}
			// TODO : Will add deny suffix of file later
		}
		return true;
	}

	public void showListFileSelected(List<MultipartFile> files) {
		System.err.println("=============== LIST FILES ================");
		for (MultipartFile file : files) {
			System.out.println(file.getOriginalFilename());
		}
		System.err.println("=============== LIST FILES ================");
	}

	@PostMapping("/saveProduct")
	@Transactional
	public String saveProduct(@ModelAttribute("productModel") ProductModel theProductModel, ModelMap theModel,
			BindingResult bindingResult) {

		// ============================================== VALIDATOR
		productValidator.validate(theProductModel, bindingResult);
		if (bindingResult.hasErrors()) {
			getDependencyForProductProcess(theModel);
			theModel.addAttribute("productModel", theProductModel);
			return "/admin/form-product";
		}

		if (theProductModel.getProduct().getCategory() == null || theProductModel.getProduct().getBrand() == null
				|| theProductModel.getProduct().getSale() == null) {
			getDependencyForProductProcess(theModel);
			theModel.addAttribute("productModel", theProductModel);
			theModel.addAttribute("message","PLEASE SELECT CATEGORY - BRAND - SALE for PRODUCT");
			return "/admin/form-product";
		}
		// ============================================== VALIDATOR

		// ============================================== DATA OBJECT
		Product theProduct = theProductModel.getProduct();
		ProductDetail theProductDetail = theProductModel.getProductDetail();
		// ============================================== DATA OBJECT

		List<MultipartFile> files = theProductModel.getImages();

		// ============================================= IF INSTANCE OF UPDATE PRODUCT
		try {
			if (productService.getProduct(theProductModel.getProduct().getId()) != null) {

				if (checkIsValidFiles(files) == false && files.size() == 1) {
					System.err.println("File format was invalid!");
				} else {

					// ============================================== READY DATA
					String nameProductConvertedUnicode = convertUnicodeUtil
							.removeAccent(theProductModel.getProduct().getName());
					String nameProductConvertedStandard = nameProductConvertedUnicode.replaceAll("\\s", "-");
					System.out.println("After Converted : " + nameProductConvertedStandard);

					fileStorageService.createFolderByNameProduct(nameProductConvertedStandard);
					List<String> listPath = fileStorageService.storeFile(files, nameProductConvertedStandard);
					System.out.println(listPath);
					// ============================================== READY DATA

					List<Image> images = new ArrayList<Image>();
					for (String path : listPath) {
						images.add(new Image(path, theProductModel.getProduct()));
					}
					imageService.saveImage(images);
				}

				System.out.println("Product Id : " + theProduct.getId());
				productDetailService.deleteProductDetailByProductId(theProduct.getId());
				productService.updateProduct(theProduct);

				theProductDetail.setProduct(theProduct);
				theProductDetail.setImage(getPathImageOfProductFromSession());
				productDetailService.updateProductDetail(theProductDetail);

				clearSession();

				message = "Update Product Successfully";
				return "redirect:/admin/product/list";

			}
		} catch (ResourceNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// ============================================= IF INSTANCE OF UPDATE PRODUCT

		// ============================================= IF INSTANCE OF CREATE NEW
		// PRODUCT
		if (checkIsValidFiles(files) == false) {
			System.err.println("File format was invalid");
			getDependencyForProductProcess(theModel);
			theModel.addAttribute("productModel", theProductModel);
			theModel.addAttribute("message", "PLEASE CHOOSE IMAGE FOR PRODUCT");
			return "/admin/form-product";
		}

		// ============================================== READY DATA
		String nameProductConvertedUnicode = convertUnicodeUtil.removeAccent(theProductModel.getProduct().getName());
		String nameProductConvertedStandard = nameProductConvertedUnicode.replaceAll("\\s", "-");
		System.out.println("After Converted : " + nameProductConvertedStandard);

		fileStorageService.createFolderByNameProduct(nameProductConvertedStandard);
		List<String> listPath = fileStorageService.storeFile(files, nameProductConvertedStandard);
		// ============================================== READY DATA

		List<Image> images = new ArrayList<Image>();
		for (String path : listPath) {
			images.add(new Image(path, theProductModel.getProduct()));
		}

		theProduct.setProductDetail(theProductDetail);
		theProductDetail.setProduct(theProduct);
		theProductDetail.setImage(listPath.get(0));

		productService.saveProduct(theProduct);
		productDetailService.saveProductDetail(theProductDetail);
		imageService.saveImage(images);
		
		message = "Create New Product Successfully";

		return "redirect:/admin/product/list";
		// ============================================= IF INSTANCE OF CREATE NEW
		// PRODUCT

	}

	@GetMapping("/update")
	public String updateProduct(@RequestParam("productId") int theId, ModelMap theModel)
			throws ResourceNotFoundException {

		getDependencyForProductProcess(theModel);

		List<Image> imagesOfProduct = imageService.getImagesByProductId(theId);
		List<String> pathResource = new ArrayList<String>();
		List<MultipartFile> listOldImage = new ArrayList<MultipartFile>();

		System.out.println("----- Path Image From Database -----");
		for (int i = 0; i < imagesOfProduct.size(); i++) {
			System.out.println(imagesOfProduct.get(i).getPath());
			pathResource.add(imagesOfProduct.get(i).getPath());
		}
		System.out.println("----- Path Image From Database -----");

		System.out.println("------ INFO IMAGE CONVERT FROM RESOURCE TO MULTIPARTFILE ------");
		// TODO : GetFile , Convert to Multiple and add to listOldImage
		for (int i = 0; i < pathResource.size(); i++) {

			Resource resource = fileStorageService.loadFileAsResources(pathResource.get(i));

			MultipartFile muFile = null;
			try {
				FileInputStream input = new FileInputStream(resource.getFile());

				muFile = new MockMultipartFile("file", resource.getFile().getName(), "text/plain",
						IOUtils.toByteArray(input));

				System.out.println("-----------------------------------------------------");
				System.out.println(muFile.getOriginalFilename() + " - " + muFile.getSize());

				listOldImage.add(muFile);

			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		System.out.println("--------------- SHOW IMAGE LOADED FROM RESOURCES ---------------");
		for (int i = 0; i < listOldImage.size(); i++) {
			System.out.println(listOldImage.get(i).getOriginalFilename());
		}
		System.out.println("--------------- SHOW IMAGE LOADED FROM RESOURCES ---------------");

		// add test
		theModel.addAttribute("productModel", new ProductModel(productService.getProduct(theId),
				productService.getProduct(theId).getProductDetail(), listOldImage));

		setPathImageOfProductIntoSession(productService.getProduct(theId).getProductDetail().getImage());

		return "/admin/form-product";
	}

	@GetMapping("/delete")
	public String deleteProduct(@RequestParam("productId") int theId) {

		boolean isDeleted = true;
		Product theProduct = null;
		try {
			theProduct = productService.getProduct(theId);
		} catch (ResourceNotFoundException e) {
			e.printStackTrace();
		}

		List<Product> theProducts = productService.getAllProductExisingInBillIsWaitingStatus();// list product can't be delete
		for (Product p : theProducts) {
			if (theProduct.getId() == p.getId()) {
				isDeleted = false;
				break;
			}
		}
		
		if (isDeleted == false) {
			message = "Can't delete because was existing in bill has statusShip = 'WAITING'";
			return "redirect:/admin/product/list";
		}

			String nameProductConvertedUnicode = convertUnicodeUtil.removeAccent(theProduct.getName());
			String nameProductConvertedStandard = nameProductConvertedUnicode.replaceAll("\\s", "-");
			System.err.println("After Converted : " + nameProductConvertedStandard);
			fileStorageService.deleteFolderImageOfProduct(nameProductConvertedStandard);

			productService.deleteProduct(theId);
			message = "Product Deleted Successfully !  ";
			return "redirect:/admin/product/list";

	}


	// ========================== SUPPORT ========================= //
	public void getDependencyForProductProcess(ModelMap theModel) {

		List<Category> categorys = categoryService.getCategorys();
		List<Brand> brands = brandService.getBrands();
		List<Sale> sales = saleService.getSales();
		theModel.addAttribute("categorys", categorys);
		theModel.addAttribute("brands", brands);
		theModel.addAttribute("sales", sales);
	}

	public void setPathImageOfProductIntoSession(String pathImage) {
		session.setAttribute("pathImage", pathImage);
	}

	public String getPathImageOfProductFromSession() {
		return (String) session.getAttribute("pathImage");
	}

	public void clearSession() {
		session.removeAttribute("pathImage");
	}
	// ========================== SUPPORT ========================= //

	// ========================== ACCTION PAGE LOAD ========================= //
	@GetMapping("/actionPage")
	public String handleActionNextAndPrev(@RequestParam("action") String action, ModelMap theModel) {

		if (action.equalsIgnoreCase("next")) {

			int totalPages = (int) Math.floor(sizeList / sizePage);

			if (indexPage < totalPages) {

				indexPage++;
				int newIndex = indexPage;
				Pageable pageCustoms = PageRequest.of(newIndex, sizePage);
				Page<Product> allProducts = productRepository.findAll(pageCustoms);
				theModel.addAttribute("products", allProducts.getContent());
			} else {
				Pageable pageCustoms = PageRequest.of(indexPage, sizePage);
				Page<Product> allProducts = productRepository.findAll(pageCustoms);
				theModel.addAttribute("products", allProducts.getContent());
			}

		}

		if (action.equalsIgnoreCase("prev")) {

			if (indexPage > 0) {

				indexPage--;
				int newIndex = indexPage;
				Pageable pageMe = PageRequest.of(newIndex, sizePage);
				Page<Product> allProducts = productRepository.findAll(pageMe);
				theModel.addAttribute("products", allProducts.getContent());

			} else {
				Pageable pageMe = PageRequest.of(0, sizePage);
				Page<Product> allProducts = productRepository.findAll(pageMe);
				theModel.addAttribute("products", allProducts.getContent());
			}
		}

		theModel.addAttribute("indexPage", indexPage);
		theModel.addAttribute("totalPage", (int) Math.floor(sizeList / sizePage));

		message = "";
		return "/admin/list-products";

	}

	@GetMapping("/goPageIndex")
	public String handleGoPageIndex(@RequestParam("index") int index, ModelMap theModel) {

		Pageable pageCustoms = PageRequest.of(index, sizePage);
		Page<Product> allProducts = productRepository.findAll(pageCustoms);
		theModel.addAttribute("products", allProducts.getContent());
		indexPage = index;
		theModel.addAttribute("indexPage", indexPage);
		theModel.addAttribute("totalPage", (int) Math.floor(sizeList / sizePage));

		message = "";
		return "/admin/list-products";

	}
	// ========================== ACCTION PAGE LOAD ========================= //

} // END CLASS
