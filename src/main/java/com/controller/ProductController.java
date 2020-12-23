
package com.controller;

import com.model.Product;
import com.service.ProductService;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
public class ProductController {
    private static final String REDIRECT_URL = "redirect:/getAllProducts";
    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/getAllProducts")
    public ModelAndView getAllProducts(@RequestParam(name = "page", defaultValue = "0")Integer page) {
        Page<Product> products = productService.getAllProducts(page, 5);
        return new ModelAndView("productList", "products", products);
    }

    @GetMapping("getProductById/{productId}")
    public ModelAndView getProductById(@PathVariable(value = "productId") Long productId) {
        Product product = productService.getProductById(productId);
        product.setProductDescription(product.getProductDescription().replace('|','\n'));
        return new ModelAndView("productPage", "productObj", product);
    }

    @GetMapping("/admin/delete/{productId}")
    public String deleteProduct(@PathVariable(value = "productId") Long productId) {
        productService.deleteProduct(productId);
        return REDIRECT_URL;
    }

    @GetMapping(value = "/admin/product/addProduct")
    public String getProductForm(Model model) {
        Product product = new Product();
        product.setProductCategory("Android");
        model.addAttribute("productFormObj", product);
        return "addProduct";

    }

    @PostMapping(value = "/admin/product/addProduct")
    public String addProduct(@Valid @ModelAttribute(value = "productFormObj") Product product, BindingResult result) {
        if (result.hasErrors()) {
            return "addProduct";
        }
        String description=product.getProductDescription();
        description=description.replace('\n','|');
        product.setProductDescription(description);
        productService.addProduct(product);
        return REDIRECT_URL;
    }

    @GetMapping("/admin/product/editProduct/{productId}")
    public ModelAndView getEditForm(@PathVariable(value = "productId") Long productId) {
        Product product = productService.getProductById(productId);
        return new ModelAndView("editProduct", "editProductObj", product);
    }

    @PostMapping("/admin/product/editProduct")
    public String editProduct(@ModelAttribute(value = "editProductObj") Product product) {
        product.setProductDescription(product.getProductDescription().replace('\n','|'));
        productService.editProduct(product);
        return REDIRECT_URL;
    }

    @GetMapping("/getProductsList")
    public @ResponseBody List<Product> getProductsListInJson() {
        return productService.getAllProducts();
    }

}
