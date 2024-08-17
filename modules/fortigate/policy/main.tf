resource "fortios_firewall_policy" "policy_truenas" {
    action             = var.action
    logtraffic         = var.logtraffic
    name               = var.name
    policyid           = var.policyid
    schedule           = var.schedule
    wanopt             = var.wanopt
    wanopt_detection   = var.wanopt_detection
    wanopt_passive_opt = var.wanopt_passive_opt
    wccp               = var.wccp
    webcache           = var.webcache
    webcache_https     = var.webcache_https
    wsso               = var.wsso
    dstaddr {
        name = var.dstaddr_name
    }
    dstintf {
        name = var.dstintf_name
    }
    service {
        name = var.service_name
    }
    srcaddr {
        name = var.srcaddr_name
    }
    srcintf {
        name = var.srcintf_name
    }
}