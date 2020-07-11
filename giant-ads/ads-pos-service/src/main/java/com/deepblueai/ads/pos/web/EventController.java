package com.deepblueai.ads.pos.web;

import com.deepblueai.ads.domain.model.EventDataPayload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * created by  zhouzq on 2020/7/10
 * desc
 */
@Controller("/event")
public class EventController {

    @PostMapping("/push")
    public void pushEvent(EventDataPayload payload){


    }
}
