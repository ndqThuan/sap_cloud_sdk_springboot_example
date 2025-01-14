package com.citek.sap.cloud.sdk.spring_boot.configurations;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import com.sap.cloud.sdk.cloudplatform.connectivity.DefaultDestination;
import com.sap.cloud.sdk.cloudplatform.connectivity.HttpDestination;

@Configuration
@PropertySource("classpath:citek_s4hnc_credential.properties")
public class CitekS4HNCDestination {

    @Value("${destination.name}")
    private String DESTINATION_NAME;

    @Value("${destination.url}")
    private String DESTINATION_URL;

    @Value("${destination.type}")
    private String DESTINATION_TYPE;

    @Value("${destination.authentication}")
    private String DESTINATION_AUTHENTICATION;

    @Value("${destination.user}")
    private String DESTINATION_USERNAME;

    @Value("${destination.password}")
    private String DESTINATION_PASSWORD;

    @Bean
    HttpDestination getDestination() {
        HttpDestination destination = DefaultDestination.builder()
                .property("Name", DESTINATION_NAME)
                .property("URL", DESTINATION_URL)
                .property("Type", DESTINATION_TYPE)
                .property("Authentication", DESTINATION_AUTHENTICATION)
                .property("User", DESTINATION_USERNAME)
                .property("Password", DESTINATION_PASSWORD)
                .build().asHttp();
        return destination;
    }
}
