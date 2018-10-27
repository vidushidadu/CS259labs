#pragma GCC diagnostic ignored "-Wdeprecated-declarations" 
#include "xsim.dir/emu_wrapper_behav/obj/sysc_interface.h"
#include <map>
#include <list>


extern "C" { std::map<unsigned int, std::pair<unsigned int, std::list < void*> > > *_glb_hdl_sc_channel_map; } 



extern "C"
    void call_HDL_SC_WRITE(unsigned int netid, int len, char* pval)
    {
        unsigned int data_type = (*_glb_hdl_sc_channel_map)[netid].first;
        std::list<void*> list_of_ch = (*_glb_hdl_sc_channel_map)[netid].second;
        switch (data_type) {
            case 0 /*int*/ : { 
                int val = *((int*)(pval));
                for ( std::list<void*>::iterator it = list_of_ch.begin(); it != list_of_ch.end(); ++it)
                    ((xsim_sc_channel<0,int>*)(*it))->update_from_hdl(val);
                break;
            } 
            case 1 /*bool*/ : { 
                bool val = *((bool*)(pval));
                for ( std::list<void*>::iterator it = list_of_ch.begin(); it != list_of_ch.end(); ++it)
                    ((xsim_sc_channel<0,bool>*)(*it))->update_from_hdl(val);
                break;
            } 
            case 2 /*sc_logic*/ : { 
                sc_dt::sc_logic val  =  (sc_dt::sc_logic_value_t) (((*((int*)(pval)+1) & 0x1) << 1) | (*((int*)(pval)) & 0x1));
                for ( std::list<void*>::iterator it = list_of_ch.begin(); it != list_of_ch.end(); ++it)
                    ((xsim_sc_channel<0, sc_dt::sc_logic>*)(*it))->update_from_hdl(val);
                break;
            } 
            case 3 /*sc_bv*/ : { 
                switch (len) { 
                    case 2 : { 
                        for ( std::list<void*>::iterator it = list_of_ch.begin(); it != list_of_ch.end(); ++it)
                            ((xsim_sc_channel<2, sc_dt::sc_bv<2> >*)(*it))->update_from_hdl(pval);
                        break;
                    }
                    case 3 : { 
                        for ( std::list<void*>::iterator it = list_of_ch.begin(); it != list_of_ch.end(); ++it)
                            ((xsim_sc_channel<3, sc_dt::sc_bv<3> >*)(*it))->update_from_hdl(pval);
                        break;
                    }
                    case 4 : { 
                        for ( std::list<void*>::iterator it = list_of_ch.begin(); it != list_of_ch.end(); ++it)
                            ((xsim_sc_channel<4, sc_dt::sc_bv<4> >*)(*it))->update_from_hdl(pval);
                        break;
                    }
                    case 6 : { 
                        for ( std::list<void*>::iterator it = list_of_ch.begin(); it != list_of_ch.end(); ++it)
                            ((xsim_sc_channel<6, sc_dt::sc_bv<6> >*)(*it))->update_from_hdl(pval);
                        break;
                    }
                    case 8 : { 
                        for ( std::list<void*>::iterator it = list_of_ch.begin(); it != list_of_ch.end(); ++it)
                            ((xsim_sc_channel<8, sc_dt::sc_bv<8> >*)(*it))->update_from_hdl(pval);
                        break;
                    }
                    case 32 : { 
                        for ( std::list<void*>::iterator it = list_of_ch.begin(); it != list_of_ch.end(); ++it)
                            ((xsim_sc_channel<32, sc_dt::sc_bv<32> >*)(*it))->update_from_hdl(pval);
                        break;
                    }
                    case 64 : { 
                        for ( std::list<void*>::iterator it = list_of_ch.begin(); it != list_of_ch.end(); ++it)
                            ((xsim_sc_channel<64, sc_dt::sc_bv<64> >*)(*it))->update_from_hdl(pval);
                        break;
                    }
                        default: 
                            std::cout << "Error, unknown bitvector length: " << len << " NOT supported " << std::endl;
                            assert(0);
                }; 
                break;
            } 
            case 5 /*bit*/ : { 
                sc_dt::sc_bit val  =  (sc_dt::sc_bit)((*((int*)(pval)) & 0x1));
                for ( std::list<void*>::iterator it = list_of_ch.begin(); it != list_of_ch.end(); ++it)
                    ((xsim_sc_channel<0, sc_dt::sc_bit>*)(*it))->update_from_hdl(val);
                break;
            } 
            default: 
                std::cout << "Error, unknown type: " << data_type << " NOT supported " << std::endl;
                assert(0);
        };
    }


extern "C"
    void implicit_HDL_SCinstatiate()
    {
        _glb_hdl_sc_channel_map = new std::map <unsigned int, std::pair<unsigned int, std::list<void*> > > ();
        emu_sim_accel_mon_0_0 *sc_inst_1 = new emu_sim_accel_mon_0_0(".emu_wrapper.emu_i.sim_accel_mon_0");
        xsim_sc_channel<6, sc_dt::sc_bv<6> > *p_1_axi_awaddr = new xsim_sc_channel<6, sc_dt::sc_bv<6> >();
        sc_inst_1->axi_awaddr.bind(*p_1_axi_awaddr);
        (*_glb_hdl_sc_channel_map)[40653].first = 3;
        (*_glb_hdl_sc_channel_map)[40653].second.push_front(p_1_axi_awaddr);
        xsim_sc_channel<3, sc_dt::sc_bv<3> > *p_1_axi_awprot = new xsim_sc_channel<3, sc_dt::sc_bv<3> >();
        sc_inst_1->axi_awprot.bind(*p_1_axi_awprot);
        (*_glb_hdl_sc_channel_map)[40654].first = 3;
        (*_glb_hdl_sc_channel_map)[40654].second.push_front(p_1_axi_awprot);
        xsim_sc_channel<0, bool > *p_1_axi_awvalid = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_awvalid.bind(*p_1_axi_awvalid);
        (*_glb_hdl_sc_channel_map)[40656].first = 1;
        (*_glb_hdl_sc_channel_map)[40656].second.push_front(p_1_axi_awvalid);
        xsim_sc_channel<0, bool > *p_1_axi_awready = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_awready.bind(*p_1_axi_awready);
        (*_glb_hdl_sc_channel_map)[40655].first = 1;
        (*_glb_hdl_sc_channel_map)[40655].second.push_front(p_1_axi_awready);
        xsim_sc_channel<32, sc_dt::sc_bv<32> > *p_1_axi_wdata = new xsim_sc_channel<32, sc_dt::sc_bv<32> >();
        sc_inst_1->axi_wdata.bind(*p_1_axi_wdata);
        (*_glb_hdl_sc_channel_map)[40664].first = 3;
        (*_glb_hdl_sc_channel_map)[40664].second.push_front(p_1_axi_wdata);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_1_axi_wstrb = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_1->axi_wstrb.bind(*p_1_axi_wstrb);
        (*_glb_hdl_sc_channel_map)[40666].first = 3;
        (*_glb_hdl_sc_channel_map)[40666].second.push_front(p_1_axi_wstrb);
        xsim_sc_channel<0, bool > *p_1_axi_wvalid = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_wvalid.bind(*p_1_axi_wvalid);
        (*_glb_hdl_sc_channel_map)[40667].first = 1;
        (*_glb_hdl_sc_channel_map)[40667].second.push_front(p_1_axi_wvalid);
        xsim_sc_channel<0, bool > *p_1_axi_wready = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_wready.bind(*p_1_axi_wready);
        (*_glb_hdl_sc_channel_map)[40665].first = 1;
        (*_glb_hdl_sc_channel_map)[40665].second.push_front(p_1_axi_wready);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_1_axi_bresp = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_1->axi_bresp.bind(*p_1_axi_bresp);
        (*_glb_hdl_sc_channel_map)[40658].first = 3;
        (*_glb_hdl_sc_channel_map)[40658].second.push_front(p_1_axi_bresp);
        xsim_sc_channel<0, bool > *p_1_axi_bvalid = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_bvalid.bind(*p_1_axi_bvalid);
        (*_glb_hdl_sc_channel_map)[40659].first = 1;
        (*_glb_hdl_sc_channel_map)[40659].second.push_front(p_1_axi_bvalid);
        xsim_sc_channel<0, bool > *p_1_axi_bready = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_bready.bind(*p_1_axi_bready);
        (*_glb_hdl_sc_channel_map)[40657].first = 1;
        (*_glb_hdl_sc_channel_map)[40657].second.push_front(p_1_axi_bready);
        xsim_sc_channel<6, sc_dt::sc_bv<6> > *p_1_axi_araddr = new xsim_sc_channel<6, sc_dt::sc_bv<6> >();
        sc_inst_1->axi_araddr.bind(*p_1_axi_araddr);
        (*_glb_hdl_sc_channel_map)[40648].first = 3;
        (*_glb_hdl_sc_channel_map)[40648].second.push_front(p_1_axi_araddr);
        xsim_sc_channel<3, sc_dt::sc_bv<3> > *p_1_axi_arprot = new xsim_sc_channel<3, sc_dt::sc_bv<3> >();
        sc_inst_1->axi_arprot.bind(*p_1_axi_arprot);
        (*_glb_hdl_sc_channel_map)[40650].first = 3;
        (*_glb_hdl_sc_channel_map)[40650].second.push_front(p_1_axi_arprot);
        xsim_sc_channel<0, bool > *p_1_axi_arvalid = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_arvalid.bind(*p_1_axi_arvalid);
        (*_glb_hdl_sc_channel_map)[40652].first = 1;
        (*_glb_hdl_sc_channel_map)[40652].second.push_front(p_1_axi_arvalid);
        xsim_sc_channel<0, bool > *p_1_axi_arready = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_arready.bind(*p_1_axi_arready);
        (*_glb_hdl_sc_channel_map)[40651].first = 1;
        (*_glb_hdl_sc_channel_map)[40651].second.push_front(p_1_axi_arready);
        xsim_sc_channel<32, sc_dt::sc_bv<32> > *p_1_axi_rdata = new xsim_sc_channel<32, sc_dt::sc_bv<32> >();
        sc_inst_1->axi_rdata.bind(*p_1_axi_rdata);
        (*_glb_hdl_sc_channel_map)[40660].first = 3;
        (*_glb_hdl_sc_channel_map)[40660].second.push_front(p_1_axi_rdata);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_1_axi_rresp = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_1->axi_rresp.bind(*p_1_axi_rresp);
        (*_glb_hdl_sc_channel_map)[40662].first = 3;
        (*_glb_hdl_sc_channel_map)[40662].second.push_front(p_1_axi_rresp);
        xsim_sc_channel<0, bool > *p_1_axi_rvalid = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_rvalid.bind(*p_1_axi_rvalid);
        (*_glb_hdl_sc_channel_map)[40663].first = 1;
        (*_glb_hdl_sc_channel_map)[40663].second.push_front(p_1_axi_rvalid);
        xsim_sc_channel<0, bool > *p_1_axi_rready = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_rready.bind(*p_1_axi_rready);
        (*_glb_hdl_sc_channel_map)[40661].first = 1;
        (*_glb_hdl_sc_channel_map)[40661].second.push_front(p_1_axi_rready);
        xsim_sc_channel<0, bool > *p_1_axi_aclk = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_aclk.bind(*p_1_axi_aclk);
        (*_glb_hdl_sc_channel_map)[40647].first = 1;
        (*_glb_hdl_sc_channel_map)[40647].second.push_front(p_1_axi_aclk);
        xsim_sc_channel<0, bool > *p_1_axi_aresetn = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_aresetn.bind(*p_1_axi_aresetn);
        (*_glb_hdl_sc_channel_map)[40649].first = 1;
        (*_glb_hdl_sc_channel_map)[40649].second.push_front(p_1_axi_aresetn);
        emu_sim_axi_perf_mon2_0_0 *sc_inst_2 = new emu_sim_axi_perf_mon2_0_0(".emu_wrapper.emu_i.sim_axi_perf_mon2_0");
        xsim_sc_channel<64, sc_dt::sc_bv<64> > *p_2_axi_awaddr = new xsim_sc_channel<64, sc_dt::sc_bv<64> >();
        sc_inst_2->axi_awaddr.bind(*p_2_axi_awaddr);
        (*_glb_hdl_sc_channel_map)[40681].first = 3;
        (*_glb_hdl_sc_channel_map)[40681].second.push_front(p_2_axi_awaddr);
        xsim_sc_channel<8, sc_dt::sc_bv<8> > *p_2_axi_awlen = new xsim_sc_channel<8, sc_dt::sc_bv<8> >();
        sc_inst_2->axi_awlen.bind(*p_2_axi_awlen);
        (*_glb_hdl_sc_channel_map)[40684].first = 3;
        (*_glb_hdl_sc_channel_map)[40684].second.push_front(p_2_axi_awlen);
        xsim_sc_channel<3, sc_dt::sc_bv<3> > *p_2_axi_awsize = new xsim_sc_channel<3, sc_dt::sc_bv<3> >();
        sc_inst_2->axi_awsize.bind(*p_2_axi_awsize);
        (*_glb_hdl_sc_channel_map)[40690].first = 3;
        (*_glb_hdl_sc_channel_map)[40690].second.push_front(p_2_axi_awsize);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_2_axi_awburst = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_2->axi_awburst.bind(*p_2_axi_awburst);
        (*_glb_hdl_sc_channel_map)[40682].first = 3;
        (*_glb_hdl_sc_channel_map)[40682].second.push_front(p_2_axi_awburst);
        xsim_sc_channel<0, bool > *p_2_axi_awlock = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_awlock.bind(*p_2_axi_awlock);
        (*_glb_hdl_sc_channel_map)[40685].first = 1;
        (*_glb_hdl_sc_channel_map)[40685].second.push_front(p_2_axi_awlock);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_2_axi_awcache = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_2->axi_awcache.bind(*p_2_axi_awcache);
        (*_glb_hdl_sc_channel_map)[40683].first = 3;
        (*_glb_hdl_sc_channel_map)[40683].second.push_front(p_2_axi_awcache);
        xsim_sc_channel<3, sc_dt::sc_bv<3> > *p_2_axi_awprot = new xsim_sc_channel<3, sc_dt::sc_bv<3> >();
        sc_inst_2->axi_awprot.bind(*p_2_axi_awprot);
        (*_glb_hdl_sc_channel_map)[40686].first = 3;
        (*_glb_hdl_sc_channel_map)[40686].second.push_front(p_2_axi_awprot);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_2_axi_awregion = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_2->axi_awregion.bind(*p_2_axi_awregion);
        (*_glb_hdl_sc_channel_map)[40689].first = 3;
        (*_glb_hdl_sc_channel_map)[40689].second.push_front(p_2_axi_awregion);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_2_axi_awqos = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_2->axi_awqos.bind(*p_2_axi_awqos);
        (*_glb_hdl_sc_channel_map)[40687].first = 3;
        (*_glb_hdl_sc_channel_map)[40687].second.push_front(p_2_axi_awqos);
        xsim_sc_channel<0, bool > *p_2_axi_awvalid = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_awvalid.bind(*p_2_axi_awvalid);
        (*_glb_hdl_sc_channel_map)[40691].first = 1;
        (*_glb_hdl_sc_channel_map)[40691].second.push_front(p_2_axi_awvalid);
        xsim_sc_channel<0, bool > *p_2_axi_awready = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_awready.bind(*p_2_axi_awready);
        (*_glb_hdl_sc_channel_map)[40688].first = 1;
        (*_glb_hdl_sc_channel_map)[40688].second.push_front(p_2_axi_awready);
        xsim_sc_channel<64, sc_dt::sc_bv<64> > *p_2_axi_wdata = new xsim_sc_channel<64, sc_dt::sc_bv<64> >();
        sc_inst_2->axi_wdata.bind(*p_2_axi_wdata);
        (*_glb_hdl_sc_channel_map)[40700].first = 3;
        (*_glb_hdl_sc_channel_map)[40700].second.push_front(p_2_axi_wdata);
        xsim_sc_channel<8, sc_dt::sc_bv<8> > *p_2_axi_wstrb = new xsim_sc_channel<8, sc_dt::sc_bv<8> >();
        sc_inst_2->axi_wstrb.bind(*p_2_axi_wstrb);
        (*_glb_hdl_sc_channel_map)[40703].first = 3;
        (*_glb_hdl_sc_channel_map)[40703].second.push_front(p_2_axi_wstrb);
        xsim_sc_channel<0, bool > *p_2_axi_wlast = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_wlast.bind(*p_2_axi_wlast);
        (*_glb_hdl_sc_channel_map)[40701].first = 1;
        (*_glb_hdl_sc_channel_map)[40701].second.push_front(p_2_axi_wlast);
        xsim_sc_channel<0, bool > *p_2_axi_wvalid = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_wvalid.bind(*p_2_axi_wvalid);
        (*_glb_hdl_sc_channel_map)[40704].first = 1;
        (*_glb_hdl_sc_channel_map)[40704].second.push_front(p_2_axi_wvalid);
        xsim_sc_channel<0, bool > *p_2_axi_wready = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_wready.bind(*p_2_axi_wready);
        (*_glb_hdl_sc_channel_map)[40702].first = 1;
        (*_glb_hdl_sc_channel_map)[40702].second.push_front(p_2_axi_wready);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_2_axi_bresp = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_2->axi_bresp.bind(*p_2_axi_bresp);
        (*_glb_hdl_sc_channel_map)[40693].first = 3;
        (*_glb_hdl_sc_channel_map)[40693].second.push_front(p_2_axi_bresp);
        xsim_sc_channel<0, bool > *p_2_axi_bvalid = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_bvalid.bind(*p_2_axi_bvalid);
        (*_glb_hdl_sc_channel_map)[40694].first = 1;
        (*_glb_hdl_sc_channel_map)[40694].second.push_front(p_2_axi_bvalid);
        xsim_sc_channel<0, bool > *p_2_axi_bready = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_bready.bind(*p_2_axi_bready);
        (*_glb_hdl_sc_channel_map)[40692].first = 1;
        (*_glb_hdl_sc_channel_map)[40692].second.push_front(p_2_axi_bready);
        xsim_sc_channel<64, sc_dt::sc_bv<64> > *p_2_axi_araddr = new xsim_sc_channel<64, sc_dt::sc_bv<64> >();
        sc_inst_2->axi_araddr.bind(*p_2_axi_araddr);
        (*_glb_hdl_sc_channel_map)[40669].first = 3;
        (*_glb_hdl_sc_channel_map)[40669].second.push_front(p_2_axi_araddr);
        xsim_sc_channel<8, sc_dt::sc_bv<8> > *p_2_axi_arlen = new xsim_sc_channel<8, sc_dt::sc_bv<8> >();
        sc_inst_2->axi_arlen.bind(*p_2_axi_arlen);
        (*_glb_hdl_sc_channel_map)[40673].first = 3;
        (*_glb_hdl_sc_channel_map)[40673].second.push_front(p_2_axi_arlen);
        xsim_sc_channel<3, sc_dt::sc_bv<3> > *p_2_axi_arsize = new xsim_sc_channel<3, sc_dt::sc_bv<3> >();
        sc_inst_2->axi_arsize.bind(*p_2_axi_arsize);
        (*_glb_hdl_sc_channel_map)[40679].first = 3;
        (*_glb_hdl_sc_channel_map)[40679].second.push_front(p_2_axi_arsize);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_2_axi_arburst = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_2->axi_arburst.bind(*p_2_axi_arburst);
        (*_glb_hdl_sc_channel_map)[40670].first = 3;
        (*_glb_hdl_sc_channel_map)[40670].second.push_front(p_2_axi_arburst);
        xsim_sc_channel<0, bool > *p_2_axi_arlock = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_arlock.bind(*p_2_axi_arlock);
        (*_glb_hdl_sc_channel_map)[40674].first = 1;
        (*_glb_hdl_sc_channel_map)[40674].second.push_front(p_2_axi_arlock);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_2_axi_arcache = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_2->axi_arcache.bind(*p_2_axi_arcache);
        (*_glb_hdl_sc_channel_map)[40671].first = 3;
        (*_glb_hdl_sc_channel_map)[40671].second.push_front(p_2_axi_arcache);
        xsim_sc_channel<3, sc_dt::sc_bv<3> > *p_2_axi_arprot = new xsim_sc_channel<3, sc_dt::sc_bv<3> >();
        sc_inst_2->axi_arprot.bind(*p_2_axi_arprot);
        (*_glb_hdl_sc_channel_map)[40675].first = 3;
        (*_glb_hdl_sc_channel_map)[40675].second.push_front(p_2_axi_arprot);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_2_axi_arregion = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_2->axi_arregion.bind(*p_2_axi_arregion);
        (*_glb_hdl_sc_channel_map)[40678].first = 3;
        (*_glb_hdl_sc_channel_map)[40678].second.push_front(p_2_axi_arregion);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_2_axi_arqos = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_2->axi_arqos.bind(*p_2_axi_arqos);
        (*_glb_hdl_sc_channel_map)[40676].first = 3;
        (*_glb_hdl_sc_channel_map)[40676].second.push_front(p_2_axi_arqos);
        xsim_sc_channel<0, bool > *p_2_axi_arvalid = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_arvalid.bind(*p_2_axi_arvalid);
        (*_glb_hdl_sc_channel_map)[40680].first = 1;
        (*_glb_hdl_sc_channel_map)[40680].second.push_front(p_2_axi_arvalid);
        xsim_sc_channel<0, bool > *p_2_axi_arready = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_arready.bind(*p_2_axi_arready);
        (*_glb_hdl_sc_channel_map)[40677].first = 1;
        (*_glb_hdl_sc_channel_map)[40677].second.push_front(p_2_axi_arready);
        xsim_sc_channel<64, sc_dt::sc_bv<64> > *p_2_axi_rdata = new xsim_sc_channel<64, sc_dt::sc_bv<64> >();
        sc_inst_2->axi_rdata.bind(*p_2_axi_rdata);
        (*_glb_hdl_sc_channel_map)[40695].first = 3;
        (*_glb_hdl_sc_channel_map)[40695].second.push_front(p_2_axi_rdata);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_2_axi_rresp = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_2->axi_rresp.bind(*p_2_axi_rresp);
        (*_glb_hdl_sc_channel_map)[40698].first = 3;
        (*_glb_hdl_sc_channel_map)[40698].second.push_front(p_2_axi_rresp);
        xsim_sc_channel<0, bool > *p_2_axi_rlast = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_rlast.bind(*p_2_axi_rlast);
        (*_glb_hdl_sc_channel_map)[40696].first = 1;
        (*_glb_hdl_sc_channel_map)[40696].second.push_front(p_2_axi_rlast);
        xsim_sc_channel<0, bool > *p_2_axi_rvalid = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_rvalid.bind(*p_2_axi_rvalid);
        (*_glb_hdl_sc_channel_map)[40699].first = 1;
        (*_glb_hdl_sc_channel_map)[40699].second.push_front(p_2_axi_rvalid);
        xsim_sc_channel<0, bool > *p_2_axi_rready = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_rready.bind(*p_2_axi_rready);
        (*_glb_hdl_sc_channel_map)[40697].first = 1;
        (*_glb_hdl_sc_channel_map)[40697].second.push_front(p_2_axi_rready);
        xsim_sc_channel<0, bool > *p_2_axi_aclk = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_aclk.bind(*p_2_axi_aclk);
        (*_glb_hdl_sc_channel_map)[40668].first = 1;
        (*_glb_hdl_sc_channel_map)[40668].second.push_front(p_2_axi_aclk);
        xsim_sc_channel<0, bool > *p_2_axi_aresetn = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_aresetn.bind(*p_2_axi_aresetn);
        (*_glb_hdl_sc_channel_map)[40672].first = 1;
        (*_glb_hdl_sc_channel_map)[40672].second.push_front(p_2_axi_aresetn);
        emu_sim_axi_perf_mon2_1_0 *sc_inst_3 = new emu_sim_axi_perf_mon2_1_0(".emu_wrapper.emu_i.sim_axi_perf_mon2_1");
        xsim_sc_channel<64, sc_dt::sc_bv<64> > *p_3_axi_awaddr = new xsim_sc_channel<64, sc_dt::sc_bv<64> >();
        sc_inst_3->axi_awaddr.bind(*p_3_axi_awaddr);
        (*_glb_hdl_sc_channel_map)[40718].first = 3;
        (*_glb_hdl_sc_channel_map)[40718].second.push_front(p_3_axi_awaddr);
        xsim_sc_channel<8, sc_dt::sc_bv<8> > *p_3_axi_awlen = new xsim_sc_channel<8, sc_dt::sc_bv<8> >();
        sc_inst_3->axi_awlen.bind(*p_3_axi_awlen);
        (*_glb_hdl_sc_channel_map)[40721].first = 3;
        (*_glb_hdl_sc_channel_map)[40721].second.push_front(p_3_axi_awlen);
        xsim_sc_channel<3, sc_dt::sc_bv<3> > *p_3_axi_awsize = new xsim_sc_channel<3, sc_dt::sc_bv<3> >();
        sc_inst_3->axi_awsize.bind(*p_3_axi_awsize);
        (*_glb_hdl_sc_channel_map)[40727].first = 3;
        (*_glb_hdl_sc_channel_map)[40727].second.push_front(p_3_axi_awsize);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_3_axi_awburst = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_3->axi_awburst.bind(*p_3_axi_awburst);
        (*_glb_hdl_sc_channel_map)[40719].first = 3;
        (*_glb_hdl_sc_channel_map)[40719].second.push_front(p_3_axi_awburst);
        xsim_sc_channel<0, bool > *p_3_axi_awlock = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_awlock.bind(*p_3_axi_awlock);
        (*_glb_hdl_sc_channel_map)[40722].first = 1;
        (*_glb_hdl_sc_channel_map)[40722].second.push_front(p_3_axi_awlock);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_3_axi_awcache = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_3->axi_awcache.bind(*p_3_axi_awcache);
        (*_glb_hdl_sc_channel_map)[40720].first = 3;
        (*_glb_hdl_sc_channel_map)[40720].second.push_front(p_3_axi_awcache);
        xsim_sc_channel<3, sc_dt::sc_bv<3> > *p_3_axi_awprot = new xsim_sc_channel<3, sc_dt::sc_bv<3> >();
        sc_inst_3->axi_awprot.bind(*p_3_axi_awprot);
        (*_glb_hdl_sc_channel_map)[40723].first = 3;
        (*_glb_hdl_sc_channel_map)[40723].second.push_front(p_3_axi_awprot);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_3_axi_awregion = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_3->axi_awregion.bind(*p_3_axi_awregion);
        (*_glb_hdl_sc_channel_map)[40726].first = 3;
        (*_glb_hdl_sc_channel_map)[40726].second.push_front(p_3_axi_awregion);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_3_axi_awqos = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_3->axi_awqos.bind(*p_3_axi_awqos);
        (*_glb_hdl_sc_channel_map)[40724].first = 3;
        (*_glb_hdl_sc_channel_map)[40724].second.push_front(p_3_axi_awqos);
        xsim_sc_channel<0, bool > *p_3_axi_awvalid = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_awvalid.bind(*p_3_axi_awvalid);
        (*_glb_hdl_sc_channel_map)[40728].first = 1;
        (*_glb_hdl_sc_channel_map)[40728].second.push_front(p_3_axi_awvalid);
        xsim_sc_channel<0, bool > *p_3_axi_awready = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_awready.bind(*p_3_axi_awready);
        (*_glb_hdl_sc_channel_map)[40725].first = 1;
        (*_glb_hdl_sc_channel_map)[40725].second.push_front(p_3_axi_awready);
        xsim_sc_channel<32, sc_dt::sc_bv<32> > *p_3_axi_wdata = new xsim_sc_channel<32, sc_dt::sc_bv<32> >();
        sc_inst_3->axi_wdata.bind(*p_3_axi_wdata);
        (*_glb_hdl_sc_channel_map)[40737].first = 3;
        (*_glb_hdl_sc_channel_map)[40737].second.push_front(p_3_axi_wdata);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_3_axi_wstrb = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_3->axi_wstrb.bind(*p_3_axi_wstrb);
        (*_glb_hdl_sc_channel_map)[40740].first = 3;
        (*_glb_hdl_sc_channel_map)[40740].second.push_front(p_3_axi_wstrb);
        xsim_sc_channel<0, bool > *p_3_axi_wlast = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_wlast.bind(*p_3_axi_wlast);
        (*_glb_hdl_sc_channel_map)[40738].first = 1;
        (*_glb_hdl_sc_channel_map)[40738].second.push_front(p_3_axi_wlast);
        xsim_sc_channel<0, bool > *p_3_axi_wvalid = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_wvalid.bind(*p_3_axi_wvalid);
        (*_glb_hdl_sc_channel_map)[40741].first = 1;
        (*_glb_hdl_sc_channel_map)[40741].second.push_front(p_3_axi_wvalid);
        xsim_sc_channel<0, bool > *p_3_axi_wready = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_wready.bind(*p_3_axi_wready);
        (*_glb_hdl_sc_channel_map)[40739].first = 1;
        (*_glb_hdl_sc_channel_map)[40739].second.push_front(p_3_axi_wready);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_3_axi_bresp = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_3->axi_bresp.bind(*p_3_axi_bresp);
        (*_glb_hdl_sc_channel_map)[40730].first = 3;
        (*_glb_hdl_sc_channel_map)[40730].second.push_front(p_3_axi_bresp);
        xsim_sc_channel<0, bool > *p_3_axi_bvalid = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_bvalid.bind(*p_3_axi_bvalid);
        (*_glb_hdl_sc_channel_map)[40731].first = 1;
        (*_glb_hdl_sc_channel_map)[40731].second.push_front(p_3_axi_bvalid);
        xsim_sc_channel<0, bool > *p_3_axi_bready = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_bready.bind(*p_3_axi_bready);
        (*_glb_hdl_sc_channel_map)[40729].first = 1;
        (*_glb_hdl_sc_channel_map)[40729].second.push_front(p_3_axi_bready);
        xsim_sc_channel<64, sc_dt::sc_bv<64> > *p_3_axi_araddr = new xsim_sc_channel<64, sc_dt::sc_bv<64> >();
        sc_inst_3->axi_araddr.bind(*p_3_axi_araddr);
        (*_glb_hdl_sc_channel_map)[40706].first = 3;
        (*_glb_hdl_sc_channel_map)[40706].second.push_front(p_3_axi_araddr);
        xsim_sc_channel<8, sc_dt::sc_bv<8> > *p_3_axi_arlen = new xsim_sc_channel<8, sc_dt::sc_bv<8> >();
        sc_inst_3->axi_arlen.bind(*p_3_axi_arlen);
        (*_glb_hdl_sc_channel_map)[40710].first = 3;
        (*_glb_hdl_sc_channel_map)[40710].second.push_front(p_3_axi_arlen);
        xsim_sc_channel<3, sc_dt::sc_bv<3> > *p_3_axi_arsize = new xsim_sc_channel<3, sc_dt::sc_bv<3> >();
        sc_inst_3->axi_arsize.bind(*p_3_axi_arsize);
        (*_glb_hdl_sc_channel_map)[40716].first = 3;
        (*_glb_hdl_sc_channel_map)[40716].second.push_front(p_3_axi_arsize);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_3_axi_arburst = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_3->axi_arburst.bind(*p_3_axi_arburst);
        (*_glb_hdl_sc_channel_map)[40707].first = 3;
        (*_glb_hdl_sc_channel_map)[40707].second.push_front(p_3_axi_arburst);
        xsim_sc_channel<0, bool > *p_3_axi_arlock = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_arlock.bind(*p_3_axi_arlock);
        (*_glb_hdl_sc_channel_map)[40711].first = 1;
        (*_glb_hdl_sc_channel_map)[40711].second.push_front(p_3_axi_arlock);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_3_axi_arcache = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_3->axi_arcache.bind(*p_3_axi_arcache);
        (*_glb_hdl_sc_channel_map)[40708].first = 3;
        (*_glb_hdl_sc_channel_map)[40708].second.push_front(p_3_axi_arcache);
        xsim_sc_channel<3, sc_dt::sc_bv<3> > *p_3_axi_arprot = new xsim_sc_channel<3, sc_dt::sc_bv<3> >();
        sc_inst_3->axi_arprot.bind(*p_3_axi_arprot);
        (*_glb_hdl_sc_channel_map)[40712].first = 3;
        (*_glb_hdl_sc_channel_map)[40712].second.push_front(p_3_axi_arprot);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_3_axi_arregion = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_3->axi_arregion.bind(*p_3_axi_arregion);
        (*_glb_hdl_sc_channel_map)[40715].first = 3;
        (*_glb_hdl_sc_channel_map)[40715].second.push_front(p_3_axi_arregion);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_3_axi_arqos = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_3->axi_arqos.bind(*p_3_axi_arqos);
        (*_glb_hdl_sc_channel_map)[40713].first = 3;
        (*_glb_hdl_sc_channel_map)[40713].second.push_front(p_3_axi_arqos);
        xsim_sc_channel<0, bool > *p_3_axi_arvalid = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_arvalid.bind(*p_3_axi_arvalid);
        (*_glb_hdl_sc_channel_map)[40717].first = 1;
        (*_glb_hdl_sc_channel_map)[40717].second.push_front(p_3_axi_arvalid);
        xsim_sc_channel<0, bool > *p_3_axi_arready = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_arready.bind(*p_3_axi_arready);
        (*_glb_hdl_sc_channel_map)[40714].first = 1;
        (*_glb_hdl_sc_channel_map)[40714].second.push_front(p_3_axi_arready);
        xsim_sc_channel<32, sc_dt::sc_bv<32> > *p_3_axi_rdata = new xsim_sc_channel<32, sc_dt::sc_bv<32> >();
        sc_inst_3->axi_rdata.bind(*p_3_axi_rdata);
        (*_glb_hdl_sc_channel_map)[40732].first = 3;
        (*_glb_hdl_sc_channel_map)[40732].second.push_front(p_3_axi_rdata);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_3_axi_rresp = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_3->axi_rresp.bind(*p_3_axi_rresp);
        (*_glb_hdl_sc_channel_map)[40735].first = 3;
        (*_glb_hdl_sc_channel_map)[40735].second.push_front(p_3_axi_rresp);
        xsim_sc_channel<0, bool > *p_3_axi_rlast = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_rlast.bind(*p_3_axi_rlast);
        (*_glb_hdl_sc_channel_map)[40733].first = 1;
        (*_glb_hdl_sc_channel_map)[40733].second.push_front(p_3_axi_rlast);
        xsim_sc_channel<0, bool > *p_3_axi_rvalid = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_rvalid.bind(*p_3_axi_rvalid);
        (*_glb_hdl_sc_channel_map)[40736].first = 1;
        (*_glb_hdl_sc_channel_map)[40736].second.push_front(p_3_axi_rvalid);
        xsim_sc_channel<0, bool > *p_3_axi_rready = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_rready.bind(*p_3_axi_rready);
        (*_glb_hdl_sc_channel_map)[40734].first = 1;
        (*_glb_hdl_sc_channel_map)[40734].second.push_front(p_3_axi_rready);
        xsim_sc_channel<0, bool > *p_3_axi_aclk = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_aclk.bind(*p_3_axi_aclk);
        (*_glb_hdl_sc_channel_map)[40705].first = 1;
        (*_glb_hdl_sc_channel_map)[40705].second.push_front(p_3_axi_aclk);
        xsim_sc_channel<0, bool > *p_3_axi_aresetn = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_aresetn.bind(*p_3_axi_aresetn);
        (*_glb_hdl_sc_channel_map)[40709].first = 1;
        (*_glb_hdl_sc_channel_map)[40709].second.push_front(p_3_axi_aresetn);
    }
