package com.imlewis.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

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

import com.imlewis.model.Slider;
import com.imlewis.repository.SliderRepository;

@Controller
@RequestMapping("/admin/hs")
public class AdminSliderController {

    @Autowired
    private SliderRepository sliderRepository;
    
    @RequestMapping("/m")
    public String homeSliderManagement(Model model){
        model.addAttribute("sliderList", sliderRepository.findAll());

        return "admin/sliderSettings";
    }
    
    @RequestMapping(value = "/s", method=RequestMethod.GET)
    public String saveHomeSliderGET(@RequestParam(value="id", required=false) Long sliderId, Model model){
    	if(sliderId != null){
    		model.addAttribute("slider",sliderRepository.findOne(sliderId));
    		return "admin/saveSlider";
    	}
    	Slider slider = new Slider();
    	model.addAttribute("slider",slider);
        return "admin/saveSlider";
    }
    
    @RequestMapping(value = "/s", method=RequestMethod.POST)
    public String saveHomeSliderPOST(@Valid @ModelAttribute("slider") Slider slider, BindingResult result, 
    		HttpServletRequest request, Model model){
    	if(result.hasErrors()){
    		return "admin/sliderSettings";
    	}

		MultipartFile sliderImage = slider.getSliderImage();
    	String rootDirectory = new File("").getAbsolutePath();
    	
    	if(slider.getSliderId() == null){
            sliderRepository.save(slider);
    		// create directory
            File theDir = new File(rootDirectory + "\\src\\main\\resources\\static\\images\\slider\\"
            						+ String.valueOf(slider.getSliderId()));
            try {
                FileUtils.forceMkdir(theDir);
            } catch (IOException e) {
                e.printStackTrace();
            }
    	}else{ sliderRepository.save(slider); }
        
        Path path = Paths.get(rootDirectory + "\\src\\main\\resources\\static\\images\\slider\\"
        					+ String.valueOf(slider.getSliderId()) + "\\" + "0.png");

        if (sliderImage != null && !sliderImage.isEmpty()) {
            try {
                sliderImage.transferTo(new File(path.toString()));
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException("Slider image saving failed", e);
            }
        }

        return "redirect:/admin/hs/m";
    }
    
    @RequestMapping("/d")
    public String deleteHomeSlider(@RequestParam(value="id", required=true) Long sliderId, Model model){
    	String rootDirectory = new File("").getAbsolutePath();
        File theDir = new File(rootDirectory + "\\src\\main\\resources\\static\\images\\slider\\" + sliderId);

        if(theDir.exists()){
            try {
                FileUtils.deleteDirectory(theDir);
            }catch (IOException e){
                e.printStackTrace();
            }
        }
    	
        sliderRepository.delete(sliderId);

        return "redirect:/admin/hs/m";
    }
}
