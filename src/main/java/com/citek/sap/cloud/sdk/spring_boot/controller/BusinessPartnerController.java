package com.citek.sap.cloud.sdk.spring_boot.controller;

import java.util.List;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.citek.sap.cloud.sdk.vdm.namespaces.rfqprocesssrv.RequestForQuotation;
import com.citek.sap.cloud.sdk.vdm.services.DefaultAPIRFQPROCESSSRVService;
import com.sap.cloud.sdk.cloudplatform.connectivity.HttpDestination;
import com.sap.cloud.sdk.datamodel.odata.helper.Order;

import jakarta.websocket.server.PathParam;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("/service/rfq")
public class BusinessPartnerController {

    private static final Logger logger = LoggerFactory.getLogger(BusinessPartnerController.class);

    @Autowired
    private HttpDestination destination;

    @GetMapping
    public ModelAndView getBusinessPartner() {
        ModelAndView mav = new ModelAndView("index");

        final List<RequestForQuotation> rfqList = new DefaultAPIRFQPROCESSSRVService()
                .getAllRequestForQuotation()
                .select(RequestForQuotation.RFQ,
                        RequestForQuotation.RFQ_DESCRIPTION,
                        RequestForQuotation.CURRENCY,
                        RequestForQuotation.STATUS,
                        RequestForQuotation.QUOTATION_START_DATE,
                        RequestForQuotation.QUOTATION_DEADLINE,
                        RequestForQuotation.TO_REQUEST_FOR_QUOTATION_ITEM,
                        RequestForQuotation.TO_REQUEST_FOR_QUOTATION_BIDDER)
                .orderBy(RequestForQuotation.RFQ, Order.ASC)
                .top(100)
                .executeRequest(destination);
        mav.addObject("rfqList", rfqList);
        return mav;
    }

    @PostMapping
    public ModelAndView getRfqByPosting(@RequestParam(value = "RequestForQuotation") String rfqId) {
        ModelAndView mav = new ModelAndView("rfq-detail");

        final RequestForQuotation rfq = new DefaultAPIRFQPROCESSSRVService().getRequestForQuotationByKey(rfqId)
                .executeRequest(destination);

        mav.addObject("rfq", rfq);

        return mav;
    }

}
