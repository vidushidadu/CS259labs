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
        (*_glb_hdl_sc_channel_map)[40412].first = 3;
        (*_glb_hdl_sc_channel_map)[40412].second.push_front(p_1_axi_awaddr);
        xsim_sc_channel<3, sc_dt::sc_bv<3> > *p_1_axi_awprot = new xsim_sc_channel<3, sc_dt::sc_bv<3> >();
        sc_inst_1->axi_awprot.bind(*p_1_axi_awprot);
        (*_glb_hdl_sc_channel_map)[40413].first = 3;
        (*_glb_hdl_sc_channel_map)[40413].second.push_front(p_1_axi_awprot);
        xsim_sc_channel<0, bool > *p_1_axi_awvalid = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_awvalid.bind(*p_1_axi_awvalid);
        (*_glb_hdl_sc_channel_map)[40415].first = 1;
        (*_glb_hdl_sc_channel_map)[40415].second.push_front(p_1_axi_awvalid);
        xsim_sc_channel<0, bool > *p_1_axi_awready = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_awready.bind(*p_1_axi_awready);
        (*_glb_hdl_sc_channel_map)[40414].first = 1;
        (*_glb_hdl_sc_channel_map)[40414].second.push_front(p_1_axi_awready);
        xsim_sc_channel<32, sc_dt::sc_bv<32> > *p_1_axi_wdata = new xsim_sc_channel<32, sc_dt::sc_bv<32> >();
        sc_inst_1->axi_wdata.bind(*p_1_axi_wdata);
        (*_glb_hdl_sc_channel_map)[40423].first = 3;
        (*_glb_hdl_sc_channel_map)[40423].second.push_front(p_1_axi_wdata);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_1_axi_wstrb = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_1->axi_wstrb.bind(*p_1_axi_wstrb);
        (*_glb_hdl_sc_channel_map)[40425].first = 3;
        (*_glb_hdl_sc_channel_map)[40425].second.push_front(p_1_axi_wstrb);
        xsim_sc_channel<0, bool > *p_1_axi_wvalid = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_wvalid.bind(*p_1_axi_wvalid);
        (*_glb_hdl_sc_channel_map)[40426].first = 1;
        (*_glb_hdl_sc_channel_map)[40426].second.push_front(p_1_axi_wvalid);
        xsim_sc_channel<0, bool > *p_1_axi_wready = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_wready.bind(*p_1_axi_wready);
        (*_glb_hdl_sc_channel_map)[40424].first = 1;
        (*_glb_hdl_sc_channel_map)[40424].second.push_front(p_1_axi_wready);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_1_axi_bresp = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_1->axi_bresp.bind(*p_1_axi_bresp);
        (*_glb_hdl_sc_channel_map)[40417].first = 3;
        (*_glb_hdl_sc_channel_map)[40417].second.push_front(p_1_axi_bresp);
        xsim_sc_channel<0, bool > *p_1_axi_bvalid = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_bvalid.bind(*p_1_axi_bvalid);
        (*_glb_hdl_sc_channel_map)[40418].first = 1;
        (*_glb_hdl_sc_channel_map)[40418].second.push_front(p_1_axi_bvalid);
        xsim_sc_channel<0, bool > *p_1_axi_bready = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_bready.bind(*p_1_axi_bready);
        (*_glb_hdl_sc_channel_map)[40416].first = 1;
        (*_glb_hdl_sc_channel_map)[40416].second.push_front(p_1_axi_bready);
        xsim_sc_channel<6, sc_dt::sc_bv<6> > *p_1_axi_araddr = new xsim_sc_channel<6, sc_dt::sc_bv<6> >();
        sc_inst_1->axi_araddr.bind(*p_1_axi_araddr);
        (*_glb_hdl_sc_channel_map)[40407].first = 3;
        (*_glb_hdl_sc_channel_map)[40407].second.push_front(p_1_axi_araddr);
        xsim_sc_channel<3, sc_dt::sc_bv<3> > *p_1_axi_arprot = new xsim_sc_channel<3, sc_dt::sc_bv<3> >();
        sc_inst_1->axi_arprot.bind(*p_1_axi_arprot);
        (*_glb_hdl_sc_channel_map)[40409].first = 3;
        (*_glb_hdl_sc_channel_map)[40409].second.push_front(p_1_axi_arprot);
        xsim_sc_channel<0, bool > *p_1_axi_arvalid = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_arvalid.bind(*p_1_axi_arvalid);
        (*_glb_hdl_sc_channel_map)[40411].first = 1;
        (*_glb_hdl_sc_channel_map)[40411].second.push_front(p_1_axi_arvalid);
        xsim_sc_channel<0, bool > *p_1_axi_arready = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_arready.bind(*p_1_axi_arready);
        (*_glb_hdl_sc_channel_map)[40410].first = 1;
        (*_glb_hdl_sc_channel_map)[40410].second.push_front(p_1_axi_arready);
        xsim_sc_channel<32, sc_dt::sc_bv<32> > *p_1_axi_rdata = new xsim_sc_channel<32, sc_dt::sc_bv<32> >();
        sc_inst_1->axi_rdata.bind(*p_1_axi_rdata);
        (*_glb_hdl_sc_channel_map)[40419].first = 3;
        (*_glb_hdl_sc_channel_map)[40419].second.push_front(p_1_axi_rdata);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_1_axi_rresp = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_1->axi_rresp.bind(*p_1_axi_rresp);
        (*_glb_hdl_sc_channel_map)[40421].first = 3;
        (*_glb_hdl_sc_channel_map)[40421].second.push_front(p_1_axi_rresp);
        xsim_sc_channel<0, bool > *p_1_axi_rvalid = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_rvalid.bind(*p_1_axi_rvalid);
        (*_glb_hdl_sc_channel_map)[40422].first = 1;
        (*_glb_hdl_sc_channel_map)[40422].second.push_front(p_1_axi_rvalid);
        xsim_sc_channel<0, bool > *p_1_axi_rready = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_rready.bind(*p_1_axi_rready);
        (*_glb_hdl_sc_channel_map)[40420].first = 1;
        (*_glb_hdl_sc_channel_map)[40420].second.push_front(p_1_axi_rready);
        xsim_sc_channel<0, bool > *p_1_axi_aclk = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_aclk.bind(*p_1_axi_aclk);
        (*_glb_hdl_sc_channel_map)[40406].first = 1;
        (*_glb_hdl_sc_channel_map)[40406].second.push_front(p_1_axi_aclk);
        xsim_sc_channel<0, bool > *p_1_axi_aresetn = new xsim_sc_channel<0, bool >();
        sc_inst_1->axi_aresetn.bind(*p_1_axi_aresetn);
        (*_glb_hdl_sc_channel_map)[40408].first = 1;
        (*_glb_hdl_sc_channel_map)[40408].second.push_front(p_1_axi_aresetn);
        emu_sim_axi_perf_mon2_0_0 *sc_inst_2 = new emu_sim_axi_perf_mon2_0_0(".emu_wrapper.emu_i.sim_axi_perf_mon2_0");
        xsim_sc_channel<64, sc_dt::sc_bv<64> > *p_2_axi_awaddr = new xsim_sc_channel<64, sc_dt::sc_bv<64> >();
        sc_inst_2->axi_awaddr.bind(*p_2_axi_awaddr);
        (*_glb_hdl_sc_channel_map)[40440].first = 3;
        (*_glb_hdl_sc_channel_map)[40440].second.push_front(p_2_axi_awaddr);
        xsim_sc_channel<8, sc_dt::sc_bv<8> > *p_2_axi_awlen = new xsim_sc_channel<8, sc_dt::sc_bv<8> >();
        sc_inst_2->axi_awlen.bind(*p_2_axi_awlen);
        (*_glb_hdl_sc_channel_map)[40443].first = 3;
        (*_glb_hdl_sc_channel_map)[40443].second.push_front(p_2_axi_awlen);
        xsim_sc_channel<3, sc_dt::sc_bv<3> > *p_2_axi_awsize = new xsim_sc_channel<3, sc_dt::sc_bv<3> >();
        sc_inst_2->axi_awsize.bind(*p_2_axi_awsize);
        (*_glb_hdl_sc_channel_map)[40449].first = 3;
        (*_glb_hdl_sc_channel_map)[40449].second.push_front(p_2_axi_awsize);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_2_axi_awburst = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_2->axi_awburst.bind(*p_2_axi_awburst);
        (*_glb_hdl_sc_channel_map)[40441].first = 3;
        (*_glb_hdl_sc_channel_map)[40441].second.push_front(p_2_axi_awburst);
        xsim_sc_channel<0, bool > *p_2_axi_awlock = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_awlock.bind(*p_2_axi_awlock);
        (*_glb_hdl_sc_channel_map)[40444].first = 1;
        (*_glb_hdl_sc_channel_map)[40444].second.push_front(p_2_axi_awlock);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_2_axi_awcache = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_2->axi_awcache.bind(*p_2_axi_awcache);
        (*_glb_hdl_sc_channel_map)[40442].first = 3;
        (*_glb_hdl_sc_channel_map)[40442].second.push_front(p_2_axi_awcache);
        xsim_sc_channel<3, sc_dt::sc_bv<3> > *p_2_axi_awprot = new xsim_sc_channel<3, sc_dt::sc_bv<3> >();
        sc_inst_2->axi_awprot.bind(*p_2_axi_awprot);
        (*_glb_hdl_sc_channel_map)[40445].first = 3;
        (*_glb_hdl_sc_channel_map)[40445].second.push_front(p_2_axi_awprot);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_2_axi_awregion = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_2->axi_awregion.bind(*p_2_axi_awregion);
        (*_glb_hdl_sc_channel_map)[40448].first = 3;
        (*_glb_hdl_sc_channel_map)[40448].second.push_front(p_2_axi_awregion);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_2_axi_awqos = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_2->axi_awqos.bind(*p_2_axi_awqos);
        (*_glb_hdl_sc_channel_map)[40446].first = 3;
        (*_glb_hdl_sc_channel_map)[40446].second.push_front(p_2_axi_awqos);
        xsim_sc_channel<0, bool > *p_2_axi_awvalid = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_awvalid.bind(*p_2_axi_awvalid);
        (*_glb_hdl_sc_channel_map)[40450].first = 1;
        (*_glb_hdl_sc_channel_map)[40450].second.push_front(p_2_axi_awvalid);
        xsim_sc_channel<0, bool > *p_2_axi_awready = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_awready.bind(*p_2_axi_awready);
        (*_glb_hdl_sc_channel_map)[40447].first = 1;
        (*_glb_hdl_sc_channel_map)[40447].second.push_front(p_2_axi_awready);
        xsim_sc_channel<64, sc_dt::sc_bv<64> > *p_2_axi_wdata = new xsim_sc_channel<64, sc_dt::sc_bv<64> >();
        sc_inst_2->axi_wdata.bind(*p_2_axi_wdata);
        (*_glb_hdl_sc_channel_map)[40459].first = 3;
        (*_glb_hdl_sc_channel_map)[40459].second.push_front(p_2_axi_wdata);
        xsim_sc_channel<8, sc_dt::sc_bv<8> > *p_2_axi_wstrb = new xsim_sc_channel<8, sc_dt::sc_bv<8> >();
        sc_inst_2->axi_wstrb.bind(*p_2_axi_wstrb);
        (*_glb_hdl_sc_channel_map)[40462].first = 3;
        (*_glb_hdl_sc_channel_map)[40462].second.push_front(p_2_axi_wstrb);
        xsim_sc_channel<0, bool > *p_2_axi_wlast = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_wlast.bind(*p_2_axi_wlast);
        (*_glb_hdl_sc_channel_map)[40460].first = 1;
        (*_glb_hdl_sc_channel_map)[40460].second.push_front(p_2_axi_wlast);
        xsim_sc_channel<0, bool > *p_2_axi_wvalid = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_wvalid.bind(*p_2_axi_wvalid);
        (*_glb_hdl_sc_channel_map)[40463].first = 1;
        (*_glb_hdl_sc_channel_map)[40463].second.push_front(p_2_axi_wvalid);
        xsim_sc_channel<0, bool > *p_2_axi_wready = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_wready.bind(*p_2_axi_wready);
        (*_glb_hdl_sc_channel_map)[40461].first = 1;
        (*_glb_hdl_sc_channel_map)[40461].second.push_front(p_2_axi_wready);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_2_axi_bresp = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_2->axi_bresp.bind(*p_2_axi_bresp);
        (*_glb_hdl_sc_channel_map)[40452].first = 3;
        (*_glb_hdl_sc_channel_map)[40452].second.push_front(p_2_axi_bresp);
        xsim_sc_channel<0, bool > *p_2_axi_bvalid = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_bvalid.bind(*p_2_axi_bvalid);
        (*_glb_hdl_sc_channel_map)[40453].first = 1;
        (*_glb_hdl_sc_channel_map)[40453].second.push_front(p_2_axi_bvalid);
        xsim_sc_channel<0, bool > *p_2_axi_bready = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_bready.bind(*p_2_axi_bready);
        (*_glb_hdl_sc_channel_map)[40451].first = 1;
        (*_glb_hdl_sc_channel_map)[40451].second.push_front(p_2_axi_bready);
        xsim_sc_channel<64, sc_dt::sc_bv<64> > *p_2_axi_araddr = new xsim_sc_channel<64, sc_dt::sc_bv<64> >();
        sc_inst_2->axi_araddr.bind(*p_2_axi_araddr);
        (*_glb_hdl_sc_channel_map)[40428].first = 3;
        (*_glb_hdl_sc_channel_map)[40428].second.push_front(p_2_axi_araddr);
        xsim_sc_channel<8, sc_dt::sc_bv<8> > *p_2_axi_arlen = new xsim_sc_channel<8, sc_dt::sc_bv<8> >();
        sc_inst_2->axi_arlen.bind(*p_2_axi_arlen);
        (*_glb_hdl_sc_channel_map)[40432].first = 3;
        (*_glb_hdl_sc_channel_map)[40432].second.push_front(p_2_axi_arlen);
        xsim_sc_channel<3, sc_dt::sc_bv<3> > *p_2_axi_arsize = new xsim_sc_channel<3, sc_dt::sc_bv<3> >();
        sc_inst_2->axi_arsize.bind(*p_2_axi_arsize);
        (*_glb_hdl_sc_channel_map)[40438].first = 3;
        (*_glb_hdl_sc_channel_map)[40438].second.push_front(p_2_axi_arsize);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_2_axi_arburst = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_2->axi_arburst.bind(*p_2_axi_arburst);
        (*_glb_hdl_sc_channel_map)[40429].first = 3;
        (*_glb_hdl_sc_channel_map)[40429].second.push_front(p_2_axi_arburst);
        xsim_sc_channel<0, bool > *p_2_axi_arlock = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_arlock.bind(*p_2_axi_arlock);
        (*_glb_hdl_sc_channel_map)[40433].first = 1;
        (*_glb_hdl_sc_channel_map)[40433].second.push_front(p_2_axi_arlock);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_2_axi_arcache = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_2->axi_arcache.bind(*p_2_axi_arcache);
        (*_glb_hdl_sc_channel_map)[40430].first = 3;
        (*_glb_hdl_sc_channel_map)[40430].second.push_front(p_2_axi_arcache);
        xsim_sc_channel<3, sc_dt::sc_bv<3> > *p_2_axi_arprot = new xsim_sc_channel<3, sc_dt::sc_bv<3> >();
        sc_inst_2->axi_arprot.bind(*p_2_axi_arprot);
        (*_glb_hdl_sc_channel_map)[40434].first = 3;
        (*_glb_hdl_sc_channel_map)[40434].second.push_front(p_2_axi_arprot);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_2_axi_arregion = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_2->axi_arregion.bind(*p_2_axi_arregion);
        (*_glb_hdl_sc_channel_map)[40437].first = 3;
        (*_glb_hdl_sc_channel_map)[40437].second.push_front(p_2_axi_arregion);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_2_axi_arqos = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_2->axi_arqos.bind(*p_2_axi_arqos);
        (*_glb_hdl_sc_channel_map)[40435].first = 3;
        (*_glb_hdl_sc_channel_map)[40435].second.push_front(p_2_axi_arqos);
        xsim_sc_channel<0, bool > *p_2_axi_arvalid = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_arvalid.bind(*p_2_axi_arvalid);
        (*_glb_hdl_sc_channel_map)[40439].first = 1;
        (*_glb_hdl_sc_channel_map)[40439].second.push_front(p_2_axi_arvalid);
        xsim_sc_channel<0, bool > *p_2_axi_arready = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_arready.bind(*p_2_axi_arready);
        (*_glb_hdl_sc_channel_map)[40436].first = 1;
        (*_glb_hdl_sc_channel_map)[40436].second.push_front(p_2_axi_arready);
        xsim_sc_channel<64, sc_dt::sc_bv<64> > *p_2_axi_rdata = new xsim_sc_channel<64, sc_dt::sc_bv<64> >();
        sc_inst_2->axi_rdata.bind(*p_2_axi_rdata);
        (*_glb_hdl_sc_channel_map)[40454].first = 3;
        (*_glb_hdl_sc_channel_map)[40454].second.push_front(p_2_axi_rdata);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_2_axi_rresp = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_2->axi_rresp.bind(*p_2_axi_rresp);
        (*_glb_hdl_sc_channel_map)[40457].first = 3;
        (*_glb_hdl_sc_channel_map)[40457].second.push_front(p_2_axi_rresp);
        xsim_sc_channel<0, bool > *p_2_axi_rlast = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_rlast.bind(*p_2_axi_rlast);
        (*_glb_hdl_sc_channel_map)[40455].first = 1;
        (*_glb_hdl_sc_channel_map)[40455].second.push_front(p_2_axi_rlast);
        xsim_sc_channel<0, bool > *p_2_axi_rvalid = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_rvalid.bind(*p_2_axi_rvalid);
        (*_glb_hdl_sc_channel_map)[40458].first = 1;
        (*_glb_hdl_sc_channel_map)[40458].second.push_front(p_2_axi_rvalid);
        xsim_sc_channel<0, bool > *p_2_axi_rready = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_rready.bind(*p_2_axi_rready);
        (*_glb_hdl_sc_channel_map)[40456].first = 1;
        (*_glb_hdl_sc_channel_map)[40456].second.push_front(p_2_axi_rready);
        xsim_sc_channel<0, bool > *p_2_axi_aclk = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_aclk.bind(*p_2_axi_aclk);
        (*_glb_hdl_sc_channel_map)[40427].first = 1;
        (*_glb_hdl_sc_channel_map)[40427].second.push_front(p_2_axi_aclk);
        xsim_sc_channel<0, bool > *p_2_axi_aresetn = new xsim_sc_channel<0, bool >();
        sc_inst_2->axi_aresetn.bind(*p_2_axi_aresetn);
        (*_glb_hdl_sc_channel_map)[40431].first = 1;
        (*_glb_hdl_sc_channel_map)[40431].second.push_front(p_2_axi_aresetn);
        emu_sim_axi_perf_mon2_1_0 *sc_inst_3 = new emu_sim_axi_perf_mon2_1_0(".emu_wrapper.emu_i.sim_axi_perf_mon2_1");
        xsim_sc_channel<64, sc_dt::sc_bv<64> > *p_3_axi_awaddr = new xsim_sc_channel<64, sc_dt::sc_bv<64> >();
        sc_inst_3->axi_awaddr.bind(*p_3_axi_awaddr);
        (*_glb_hdl_sc_channel_map)[40477].first = 3;
        (*_glb_hdl_sc_channel_map)[40477].second.push_front(p_3_axi_awaddr);
        xsim_sc_channel<8, sc_dt::sc_bv<8> > *p_3_axi_awlen = new xsim_sc_channel<8, sc_dt::sc_bv<8> >();
        sc_inst_3->axi_awlen.bind(*p_3_axi_awlen);
        (*_glb_hdl_sc_channel_map)[40480].first = 3;
        (*_glb_hdl_sc_channel_map)[40480].second.push_front(p_3_axi_awlen);
        xsim_sc_channel<3, sc_dt::sc_bv<3> > *p_3_axi_awsize = new xsim_sc_channel<3, sc_dt::sc_bv<3> >();
        sc_inst_3->axi_awsize.bind(*p_3_axi_awsize);
        (*_glb_hdl_sc_channel_map)[40486].first = 3;
        (*_glb_hdl_sc_channel_map)[40486].second.push_front(p_3_axi_awsize);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_3_axi_awburst = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_3->axi_awburst.bind(*p_3_axi_awburst);
        (*_glb_hdl_sc_channel_map)[40478].first = 3;
        (*_glb_hdl_sc_channel_map)[40478].second.push_front(p_3_axi_awburst);
        xsim_sc_channel<0, bool > *p_3_axi_awlock = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_awlock.bind(*p_3_axi_awlock);
        (*_glb_hdl_sc_channel_map)[40481].first = 1;
        (*_glb_hdl_sc_channel_map)[40481].second.push_front(p_3_axi_awlock);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_3_axi_awcache = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_3->axi_awcache.bind(*p_3_axi_awcache);
        (*_glb_hdl_sc_channel_map)[40479].first = 3;
        (*_glb_hdl_sc_channel_map)[40479].second.push_front(p_3_axi_awcache);
        xsim_sc_channel<3, sc_dt::sc_bv<3> > *p_3_axi_awprot = new xsim_sc_channel<3, sc_dt::sc_bv<3> >();
        sc_inst_3->axi_awprot.bind(*p_3_axi_awprot);
        (*_glb_hdl_sc_channel_map)[40482].first = 3;
        (*_glb_hdl_sc_channel_map)[40482].second.push_front(p_3_axi_awprot);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_3_axi_awregion = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_3->axi_awregion.bind(*p_3_axi_awregion);
        (*_glb_hdl_sc_channel_map)[40485].first = 3;
        (*_glb_hdl_sc_channel_map)[40485].second.push_front(p_3_axi_awregion);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_3_axi_awqos = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_3->axi_awqos.bind(*p_3_axi_awqos);
        (*_glb_hdl_sc_channel_map)[40483].first = 3;
        (*_glb_hdl_sc_channel_map)[40483].second.push_front(p_3_axi_awqos);
        xsim_sc_channel<0, bool > *p_3_axi_awvalid = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_awvalid.bind(*p_3_axi_awvalid);
        (*_glb_hdl_sc_channel_map)[40487].first = 1;
        (*_glb_hdl_sc_channel_map)[40487].second.push_front(p_3_axi_awvalid);
        xsim_sc_channel<0, bool > *p_3_axi_awready = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_awready.bind(*p_3_axi_awready);
        (*_glb_hdl_sc_channel_map)[40484].first = 1;
        (*_glb_hdl_sc_channel_map)[40484].second.push_front(p_3_axi_awready);
        xsim_sc_channel<32, sc_dt::sc_bv<32> > *p_3_axi_wdata = new xsim_sc_channel<32, sc_dt::sc_bv<32> >();
        sc_inst_3->axi_wdata.bind(*p_3_axi_wdata);
        (*_glb_hdl_sc_channel_map)[40496].first = 3;
        (*_glb_hdl_sc_channel_map)[40496].second.push_front(p_3_axi_wdata);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_3_axi_wstrb = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_3->axi_wstrb.bind(*p_3_axi_wstrb);
        (*_glb_hdl_sc_channel_map)[40499].first = 3;
        (*_glb_hdl_sc_channel_map)[40499].second.push_front(p_3_axi_wstrb);
        xsim_sc_channel<0, bool > *p_3_axi_wlast = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_wlast.bind(*p_3_axi_wlast);
        (*_glb_hdl_sc_channel_map)[40497].first = 1;
        (*_glb_hdl_sc_channel_map)[40497].second.push_front(p_3_axi_wlast);
        xsim_sc_channel<0, bool > *p_3_axi_wvalid = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_wvalid.bind(*p_3_axi_wvalid);
        (*_glb_hdl_sc_channel_map)[40500].first = 1;
        (*_glb_hdl_sc_channel_map)[40500].second.push_front(p_3_axi_wvalid);
        xsim_sc_channel<0, bool > *p_3_axi_wready = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_wready.bind(*p_3_axi_wready);
        (*_glb_hdl_sc_channel_map)[40498].first = 1;
        (*_glb_hdl_sc_channel_map)[40498].second.push_front(p_3_axi_wready);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_3_axi_bresp = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_3->axi_bresp.bind(*p_3_axi_bresp);
        (*_glb_hdl_sc_channel_map)[40489].first = 3;
        (*_glb_hdl_sc_channel_map)[40489].second.push_front(p_3_axi_bresp);
        xsim_sc_channel<0, bool > *p_3_axi_bvalid = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_bvalid.bind(*p_3_axi_bvalid);
        (*_glb_hdl_sc_channel_map)[40490].first = 1;
        (*_glb_hdl_sc_channel_map)[40490].second.push_front(p_3_axi_bvalid);
        xsim_sc_channel<0, bool > *p_3_axi_bready = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_bready.bind(*p_3_axi_bready);
        (*_glb_hdl_sc_channel_map)[40488].first = 1;
        (*_glb_hdl_sc_channel_map)[40488].second.push_front(p_3_axi_bready);
        xsim_sc_channel<64, sc_dt::sc_bv<64> > *p_3_axi_araddr = new xsim_sc_channel<64, sc_dt::sc_bv<64> >();
        sc_inst_3->axi_araddr.bind(*p_3_axi_araddr);
        (*_glb_hdl_sc_channel_map)[40465].first = 3;
        (*_glb_hdl_sc_channel_map)[40465].second.push_front(p_3_axi_araddr);
        xsim_sc_channel<8, sc_dt::sc_bv<8> > *p_3_axi_arlen = new xsim_sc_channel<8, sc_dt::sc_bv<8> >();
        sc_inst_3->axi_arlen.bind(*p_3_axi_arlen);
        (*_glb_hdl_sc_channel_map)[40469].first = 3;
        (*_glb_hdl_sc_channel_map)[40469].second.push_front(p_3_axi_arlen);
        xsim_sc_channel<3, sc_dt::sc_bv<3> > *p_3_axi_arsize = new xsim_sc_channel<3, sc_dt::sc_bv<3> >();
        sc_inst_3->axi_arsize.bind(*p_3_axi_arsize);
        (*_glb_hdl_sc_channel_map)[40475].first = 3;
        (*_glb_hdl_sc_channel_map)[40475].second.push_front(p_3_axi_arsize);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_3_axi_arburst = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_3->axi_arburst.bind(*p_3_axi_arburst);
        (*_glb_hdl_sc_channel_map)[40466].first = 3;
        (*_glb_hdl_sc_channel_map)[40466].second.push_front(p_3_axi_arburst);
        xsim_sc_channel<0, bool > *p_3_axi_arlock = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_arlock.bind(*p_3_axi_arlock);
        (*_glb_hdl_sc_channel_map)[40470].first = 1;
        (*_glb_hdl_sc_channel_map)[40470].second.push_front(p_3_axi_arlock);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_3_axi_arcache = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_3->axi_arcache.bind(*p_3_axi_arcache);
        (*_glb_hdl_sc_channel_map)[40467].first = 3;
        (*_glb_hdl_sc_channel_map)[40467].second.push_front(p_3_axi_arcache);
        xsim_sc_channel<3, sc_dt::sc_bv<3> > *p_3_axi_arprot = new xsim_sc_channel<3, sc_dt::sc_bv<3> >();
        sc_inst_3->axi_arprot.bind(*p_3_axi_arprot);
        (*_glb_hdl_sc_channel_map)[40471].first = 3;
        (*_glb_hdl_sc_channel_map)[40471].second.push_front(p_3_axi_arprot);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_3_axi_arregion = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_3->axi_arregion.bind(*p_3_axi_arregion);
        (*_glb_hdl_sc_channel_map)[40474].first = 3;
        (*_glb_hdl_sc_channel_map)[40474].second.push_front(p_3_axi_arregion);
        xsim_sc_channel<4, sc_dt::sc_bv<4> > *p_3_axi_arqos = new xsim_sc_channel<4, sc_dt::sc_bv<4> >();
        sc_inst_3->axi_arqos.bind(*p_3_axi_arqos);
        (*_glb_hdl_sc_channel_map)[40472].first = 3;
        (*_glb_hdl_sc_channel_map)[40472].second.push_front(p_3_axi_arqos);
        xsim_sc_channel<0, bool > *p_3_axi_arvalid = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_arvalid.bind(*p_3_axi_arvalid);
        (*_glb_hdl_sc_channel_map)[40476].first = 1;
        (*_glb_hdl_sc_channel_map)[40476].second.push_front(p_3_axi_arvalid);
        xsim_sc_channel<0, bool > *p_3_axi_arready = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_arready.bind(*p_3_axi_arready);
        (*_glb_hdl_sc_channel_map)[40473].first = 1;
        (*_glb_hdl_sc_channel_map)[40473].second.push_front(p_3_axi_arready);
        xsim_sc_channel<32, sc_dt::sc_bv<32> > *p_3_axi_rdata = new xsim_sc_channel<32, sc_dt::sc_bv<32> >();
        sc_inst_3->axi_rdata.bind(*p_3_axi_rdata);
        (*_glb_hdl_sc_channel_map)[40491].first = 3;
        (*_glb_hdl_sc_channel_map)[40491].second.push_front(p_3_axi_rdata);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_3_axi_rresp = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_3->axi_rresp.bind(*p_3_axi_rresp);
        (*_glb_hdl_sc_channel_map)[40494].first = 3;
        (*_glb_hdl_sc_channel_map)[40494].second.push_front(p_3_axi_rresp);
        xsim_sc_channel<0, bool > *p_3_axi_rlast = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_rlast.bind(*p_3_axi_rlast);
        (*_glb_hdl_sc_channel_map)[40492].first = 1;
        (*_glb_hdl_sc_channel_map)[40492].second.push_front(p_3_axi_rlast);
        xsim_sc_channel<0, bool > *p_3_axi_rvalid = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_rvalid.bind(*p_3_axi_rvalid);
        (*_glb_hdl_sc_channel_map)[40495].first = 1;
        (*_glb_hdl_sc_channel_map)[40495].second.push_front(p_3_axi_rvalid);
        xsim_sc_channel<0, bool > *p_3_axi_rready = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_rready.bind(*p_3_axi_rready);
        (*_glb_hdl_sc_channel_map)[40493].first = 1;
        (*_glb_hdl_sc_channel_map)[40493].second.push_front(p_3_axi_rready);
        xsim_sc_channel<0, bool > *p_3_axi_aclk = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_aclk.bind(*p_3_axi_aclk);
        (*_glb_hdl_sc_channel_map)[40464].first = 1;
        (*_glb_hdl_sc_channel_map)[40464].second.push_front(p_3_axi_aclk);
        xsim_sc_channel<0, bool > *p_3_axi_aresetn = new xsim_sc_channel<0, bool >();
        sc_inst_3->axi_aresetn.bind(*p_3_axi_aresetn);
        (*_glb_hdl_sc_channel_map)[40468].first = 1;
        (*_glb_hdl_sc_channel_map)[40468].second.push_front(p_3_axi_aresetn);
    }
