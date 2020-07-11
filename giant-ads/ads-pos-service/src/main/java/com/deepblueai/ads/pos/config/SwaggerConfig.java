package com.deepblueai.ads.pos.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.ResponseEntity;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.service.Parameter;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Configuration
@EnableSwagger2
public class SwaggerConfig {

    @Value("${swagger.host:localhost:4000}")
    private String host;

    @Bean
    public Docket createRESTAPI() {
        List<Parameter> pars = new ArrayList<>();
        pars.add(headerParam("Authorization", "令牌", ""));
        pars.add(headerParam("X-Accept-Locale", "语言", "zh_CN"));
        return new Docket(DocumentationType.SWAGGER_2)
                .host(host)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.deepblueai.ads.pos.web"))
                .paths(PathSelectors.any())
                .build()
                .globalOperationParameters(pars)
                .directModelSubstitute(LocalDate.class, String.class)
                .genericModelSubstitutes(ResponseEntity.class)
                .useDefaultResponseMessages(false);
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("DeepBlue ADPlayer API")
                .description("DeepBlue ADPlayer API")
                .contact(new Contact("ningxl", "https://www.deepblueai.com/", "ningxl@deepblueai.com"))
                .version("1.0")
                .build();
    }

    private Parameter headerParam(String name, String description, String defaultVal) {
        return new ParameterBuilder()
                .name(name)
                .description(description)
                .modelRef(new ModelRef("string"))
                .defaultValue(defaultVal)
                .parameterType("header")
                .required(false).build();
    }


}
