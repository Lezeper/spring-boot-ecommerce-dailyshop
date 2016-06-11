package com.imlewis.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.imlewis.model.Product;
import com.imlewis.service.CategoryService;
import com.imlewis.service.ProductService;

@Controller
@RequestMapping("/admin/pd")
public class AdminProductController {

    private Path path;

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    /*		saveProduct.jsp
     * 	modelAttribute: categoryList(List<Category>), product(Product), title(String)
     * */
    public void setEditProduct(Product product, Model model){
    	model.addAttribute("categoryList", categoryService.getAllCategory());
        model.addAttribute("product", product);
        model.addAttribute("title", "Edit Product");
    }
    public void setCreateProduct(Product product, Model model){
    	model.addAttribute("categoryList", categoryService.getAllCategory());
        model.addAttribute("product", product);
        model.addAttribute("title", "Add Product");
    }
    
    @RequestMapping(value="/s", method=RequestMethod.GET)
    public String addProduct(@RequestParam(value="id", required=false) Long productId, Model model) {
    	// edit product

    	if(productId != null){
        	Product product = productService.getProductById(productId);
    		setEditProduct(product, model);
    	}else{
        	// create product
            Product product = new Product();
    		setCreateProduct(product, model);
    	}

        return "admin/saveProduct";
    }

    @RequestMapping(value="/s", method = RequestMethod.POST)
    public String addProductPost(@Valid @ModelAttribute("product") Product product, BindingResult result,
                                 HttpServletRequest request, Model model) throws IOException {
        if (result.hasErrors()) {
        	if(product.getProductId() != null){
        		setEditProduct(product, model);
        	}else{
        		setCreateProduct(product, model);
        	}
            return "admin/saveProduct";
        }

        MultipartFile productImage = product.getProductImage();
        String rootDirectory = new File("").getAbsolutePath();
        
        // create product
        if(product.getProductId() == null){
        	productService.save(product);
            File theDir = new File(rootDirectory + "\\src\\main\\resources\\static\\images\\"
            							+ String.valueOf(product.getProductId()));
            FileUtils.forceMkdir(theDir);
        }else{
        	// update product
        	productService.save(product);
        }
        
        path = Paths.get(rootDirectory + "\\src\\main\\resources\\static\\images\\" 
        								+ product.getProductId() + "\\" + "0.png");

        if (productImage != null && !productImage.isEmpty()) {
            try {
                productImage.transferTo(new File(path.toString()));
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException("Product image saving failed", e);
            }
        }

        return "redirect:/admin/pd/m";
    }

    @RequestMapping("/d")
    public String deleteProduct(@RequestParam(value="id", required=true) Long productId, 
    							Model model, HttpServletRequest request){
        String rootDirectory = new File("").getAbsolutePath();
        File theDir = new File(rootDirectory + "\\src\\main\\resources\\static\\images\\" + productId);

        if(theDir.exists()){
            try {
                FileUtils.deleteDirectory(theDir);
            }catch (IOException e){
                e.printStackTrace();
            }
        }

        productService.delete(productId);

        return "redirect:/admin/pd/m";
    }
    
    @RequestMapping("/m")
    public  String productInventory(Model model){
        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products);

        return "admin/productManagement";
    }
}
