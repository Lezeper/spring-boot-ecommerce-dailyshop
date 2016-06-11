package com.imlewis.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.webflow.config.AbstractFlowConfiguration;
import org.springframework.webflow.definition.registry.FlowDefinitionRegistry;
import org.springframework.webflow.engine.builder.support.FlowBuilderServices;
import org.springframework.webflow.executor.FlowExecutor;
import org.springframework.webflow.mvc.servlet.FlowHandlerAdapter;
import org.springframework.webflow.mvc.servlet.FlowHandlerMapping;

@Configuration
public class WebFlowConfig extends AbstractFlowConfiguration {
	
	@Bean
	public LocalValidatorFactoryBean validator() {
		return new LocalValidatorFactoryBean();
	}
	
	@Bean
	public FlowBuilderServices flowBuilderServices() {
		return getFlowBuilderServicesBuilder()
				.setValidator(validator())
				.build();
	}
	
	@Bean
	public FlowDefinitionRegistry flowRegistry() {
	    return getFlowDefinitionRegistryBuilder(flowBuilderServices())
	    	.setBasePath("/WEB-INF/flows")
	        .addFlowLocation("/checkout/checkout-flow.xml", "checkout")
	        .build();
	}
	
	@Bean
	public FlowExecutor flowExecutor() {
	    return getFlowExecutorBuilder(flowRegistry()).build();
	}
	
	@Bean
	public FlowHandlerMapping flowHandlerMapping() {
		FlowHandlerMapping mapping = new FlowHandlerMapping();
		mapping.setOrder(1);
		mapping.setFlowRegistry(this.flowRegistry());
//		mapping.setDefaultHandler(new UrlFilenameViewController());
		return mapping;
	}

	@Bean
	public FlowHandlerAdapter flowHandlerAdapter() {
		FlowHandlerAdapter adapter = new FlowHandlerAdapter();
		adapter.setFlowExecutor(this.flowExecutor());
		return adapter;
	}
}
