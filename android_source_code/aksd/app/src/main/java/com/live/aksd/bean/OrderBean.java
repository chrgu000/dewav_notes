package com.live.aksd.bean;

import java.util.List;

/**
 * Created by sh-lx on 2017/8/18.
 */

public class OrderBean {


    /**
     * order_id : 440
     * merchants_id : 39
     * member_id : 12
     * order_no : 20161014120537
     * address_id : 189
     * mobile : 15022222222
     * name : 小宋
     * province : 北京
     * city : 市辖区
     * country : 东城区
     * detailed_address : 2
     * zip_code : 2
     * order_state : wait_pay
     * create_time : 2016-10-14 12:05:37.0
     * is_delete : 0
     * remark :
     * assessment_state : 0
     * order_total_price : 152.0
     * order_dededuct_price :
     * order_pay_no :
     * express_free_price : 100
     * order_total_express : 0
     * order_type : goods
     * invoice_rise :
     * member_group_buy_id :
     * addressBean : {}
     * merchantsBean : {"merchants_id":39,"merchants_name":"上海总代理1","merchants_img":"","merchants_star1":"","merchants_star2":"","merchants_star3":"","merchants_type":"2","merchants_address":"上海","contact_mobile":"32332","contact_name":"111","merchants_state":"1","merchants_province":"北京","express_free_price":"100","create_time":"","is_delete":"0"}
     * orderGoodsBeans : [{"order_goods_id":477,"order_id":"440","goods_id":"279","goods_num":"1","is_deduct_integral":"0","goodsBean":{},"assessment_state":"","goods_price":"22","deduct_integral_value":"0","deduct_integral_price":"","is_express":"1","express_price":"0","is_give_integral":"0","give_integral_value":"0","goods_name":"sfewfgrew","goods_img":"","merchants_id":"39","goods_url":"/html/goods//20160902190201.html","goods_address":"0","goodsImgBeans":[{"goods_img_id":"637","goods_id":"279","goods_img":"/images/goods//1474942033502.jpg","sort":"1"},{"goods_img_id":"636","goods_id":"279","goods_img":"/images/goods//1474942052394.jpg","sort":"2"}],"group_buy_price":"","promotion_price":"","promotion_goods_id":"","promotion_id":"","is_pre_sale":"","send_goods_time":"2016-10-30 12:00:00.0","refund_state":"","orderParameterBeans":[],"orderServiceBeans":[]}]
     */

    private int order_id;
    private String merchants_id;
    private String member_id;
    private String order_no;
    private String address_id;
    private String mobile;
    private String name;
    private String province;
    private String city;
    private String country;
    private String detailed_address;
    private String zip_code;
    private String order_state;
    private String create_time;
    private String is_delete;
    private String remark;
    private String assessment_state;
    private String order_total_price;
    private String order_dededuct_price;
    private String order_pay_no;
    private String express_free_price;
    private String order_total_express;
    private String order_type;
    private String invoice_rise;
    private String member_group_buy_id;
    private AddressBeanBean addressBean;
    private MerchantsBeanBean merchantsBean;
    private List<OrderGoodsBeansBean> orderGoodsBeans;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getMerchants_id() {
        return merchants_id;
    }

    public void setMerchants_id(String merchants_id) {
        this.merchants_id = merchants_id;
    }

    public String getMember_id() {
        return member_id;
    }

    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }

    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }

    public String getAddress_id() {
        return address_id;
    }

    public void setAddress_id(String address_id) {
        this.address_id = address_id;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getDetailed_address() {
        return detailed_address;
    }

    public void setDetailed_address(String detailed_address) {
        this.detailed_address = detailed_address;
    }

    public String getZip_code() {
        return zip_code;
    }

    public void setZip_code(String zip_code) {
        this.zip_code = zip_code;
    }

    public String getOrder_state() {
        return order_state;
    }

    public void setOrder_state(String order_state) {
        this.order_state = order_state;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getIs_delete() {
        return is_delete;
    }

    public void setIs_delete(String is_delete) {
        this.is_delete = is_delete;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getAssessment_state() {
        return assessment_state;
    }

    public void setAssessment_state(String assessment_state) {
        this.assessment_state = assessment_state;
    }

    public String getOrder_total_price() {
        return order_total_price;
    }

    public void setOrder_total_price(String order_total_price) {
        this.order_total_price = order_total_price;
    }

    public String getOrder_dededuct_price() {
        return order_dededuct_price;
    }

    public void setOrder_dededuct_price(String order_dededuct_price) {
        this.order_dededuct_price = order_dededuct_price;
    }

    public String getOrder_pay_no() {
        return order_pay_no;
    }

    public void setOrder_pay_no(String order_pay_no) {
        this.order_pay_no = order_pay_no;
    }

    public String getExpress_free_price() {
        return express_free_price;
    }

    public void setExpress_free_price(String express_free_price) {
        this.express_free_price = express_free_price;
    }

    public String getOrder_total_express() {
        return order_total_express;
    }

    public void setOrder_total_express(String order_total_express) {
        this.order_total_express = order_total_express;
    }

    public String getOrder_type() {
        return order_type;
    }

    public void setOrder_type(String order_type) {
        this.order_type = order_type;
    }

    public String getInvoice_rise() {
        return invoice_rise;
    }

    public void setInvoice_rise(String invoice_rise) {
        this.invoice_rise = invoice_rise;
    }

    public String getMember_group_buy_id() {
        return member_group_buy_id;
    }

    public void setMember_group_buy_id(String member_group_buy_id) {
        this.member_group_buy_id = member_group_buy_id;
    }

    public AddressBeanBean getAddressBean() {
        return addressBean;
    }

    public void setAddressBean(AddressBeanBean addressBean) {
        this.addressBean = addressBean;
    }

    public MerchantsBeanBean getMerchantsBean() {
        return merchantsBean;
    }

    public void setMerchantsBean(MerchantsBeanBean merchantsBean) {
        this.merchantsBean = merchantsBean;
    }

    public List<OrderGoodsBeansBean> getOrderGoodsBeans() {
        return orderGoodsBeans;
    }

    public void setOrderGoodsBeans(List<OrderGoodsBeansBean> orderGoodsBeans) {
        this.orderGoodsBeans = orderGoodsBeans;
    }

    public static class AddressBeanBean {
    }

    public static class MerchantsBeanBean {
        /**
         * merchants_id : 39
         * merchants_name : 上海总代理1
         * merchants_img :
         * merchants_star1 :
         * merchants_star2 :
         * merchants_star3 :
         * merchants_type : 2
         * merchants_address : 上海
         * contact_mobile : 32332
         * contact_name : 111
         * merchants_state : 1
         * merchants_province : 北京
         * express_free_price : 100
         * create_time :
         * is_delete : 0
         */

        private int merchants_id;
        private String merchants_name;
        private String merchants_img;
        private String merchants_star1;
        private String merchants_star2;
        private String merchants_star3;
        private String merchants_type;
        private String merchants_address;
        private String contact_mobile;
        private String contact_name;
        private String merchants_state;
        private String merchants_province;
        private String express_free_price;
        private String create_time;
        private String is_delete;

        public int getMerchants_id() {
            return merchants_id;
        }

        public void setMerchants_id(int merchants_id) {
            this.merchants_id = merchants_id;
        }

        public String getMerchants_name() {
            return merchants_name;
        }

        public void setMerchants_name(String merchants_name) {
            this.merchants_name = merchants_name;
        }

        public String getMerchants_img() {
            return merchants_img;
        }

        public void setMerchants_img(String merchants_img) {
            this.merchants_img = merchants_img;
        }

        public String getMerchants_star1() {
            return merchants_star1;
        }

        public void setMerchants_star1(String merchants_star1) {
            this.merchants_star1 = merchants_star1;
        }

        public String getMerchants_star2() {
            return merchants_star2;
        }

        public void setMerchants_star2(String merchants_star2) {
            this.merchants_star2 = merchants_star2;
        }

        public String getMerchants_star3() {
            return merchants_star3;
        }

        public void setMerchants_star3(String merchants_star3) {
            this.merchants_star3 = merchants_star3;
        }

        public String getMerchants_type() {
            return merchants_type;
        }

        public void setMerchants_type(String merchants_type) {
            this.merchants_type = merchants_type;
        }

        public String getMerchants_address() {
            return merchants_address;
        }

        public void setMerchants_address(String merchants_address) {
            this.merchants_address = merchants_address;
        }

        public String getContact_mobile() {
            return contact_mobile;
        }

        public void setContact_mobile(String contact_mobile) {
            this.contact_mobile = contact_mobile;
        }

        public String getContact_name() {
            return contact_name;
        }

        public void setContact_name(String contact_name) {
            this.contact_name = contact_name;
        }

        public String getMerchants_state() {
            return merchants_state;
        }

        public void setMerchants_state(String merchants_state) {
            this.merchants_state = merchants_state;
        }

        public String getMerchants_province() {
            return merchants_province;
        }

        public void setMerchants_province(String merchants_province) {
            this.merchants_province = merchants_province;
        }

        public String getExpress_free_price() {
            return express_free_price;
        }

        public void setExpress_free_price(String express_free_price) {
            this.express_free_price = express_free_price;
        }

        public String getCreate_time() {
            return create_time;
        }

        public void setCreate_time(String create_time) {
            this.create_time = create_time;
        }

        public String getIs_delete() {
            return is_delete;
        }

        public void setIs_delete(String is_delete) {
            this.is_delete = is_delete;
        }
    }

    public static class OrderGoodsBeansBean {
        /**
         * order_goods_id : 477
         * order_id : 440
         * goods_id : 279
         * goods_num : 1
         * is_deduct_integral : 0
         * goodsBean : {}
         * assessment_state :
         * goods_price : 22
         * deduct_integral_value : 0
         * deduct_integral_price :
         * is_express : 1
         * express_price : 0
         * is_give_integral : 0
         * give_integral_value : 0
         * goods_name : sfewfgrew
         * goods_img :
         * merchants_id : 39
         * goods_url : /html/goods//20160902190201.html
         * goods_address : 0
         * goodsImgBeans : [{"goods_img_id":"637","goods_id":"279","goods_img":"/images/goods//1474942033502.jpg","sort":"1"},{"goods_img_id":"636","goods_id":"279","goods_img":"/images/goods//1474942052394.jpg","sort":"2"}]
         * group_buy_price :
         * promotion_price :
         * promotion_goods_id :
         * promotion_id :
         * is_pre_sale :
         * send_goods_time : 2016-10-30 12:00:00.0
         * refund_state :
         * orderParameterBeans : []
         * orderServiceBeans : []
         */

        private int order_goods_id;
        private String order_id;
        private String goods_id;
        private String goods_num;
        private String is_deduct_integral;
        private GoodsBeanBean goodsBean;
        private String assessment_state;
        private String goods_price;
        private String deduct_integral_value;
        private String deduct_integral_price;
        private String is_express;
        private String express_price;
        private String is_give_integral;
        private String give_integral_value;
        private String goods_name;
        private String goods_img;
        private String merchants_id;
        private String goods_url;
        private String goods_address;
        private String group_buy_price;
        private String promotion_price;
        private String promotion_goods_id;
        private String promotion_id;
        private String is_pre_sale;
        private String send_goods_time;
        private String refund_state;
        private List<GoodsImgBeansBean> goodsImgBeans;
        private List<?> orderParameterBeans;
        private List<?> orderServiceBeans;

        public int getOrder_goods_id() {
            return order_goods_id;
        }

        public void setOrder_goods_id(int order_goods_id) {
            this.order_goods_id = order_goods_id;
        }

        public String getOrder_id() {
            return order_id;
        }

        public void setOrder_id(String order_id) {
            this.order_id = order_id;
        }

        public String getGoods_id() {
            return goods_id;
        }

        public void setGoods_id(String goods_id) {
            this.goods_id = goods_id;
        }

        public String getGoods_num() {
            return goods_num;
        }

        public void setGoods_num(String goods_num) {
            this.goods_num = goods_num;
        }

        public String getIs_deduct_integral() {
            return is_deduct_integral;
        }

        public void setIs_deduct_integral(String is_deduct_integral) {
            this.is_deduct_integral = is_deduct_integral;
        }

        public GoodsBeanBean getGoodsBean() {
            return goodsBean;
        }

        public void setGoodsBean(GoodsBeanBean goodsBean) {
            this.goodsBean = goodsBean;
        }

        public String getAssessment_state() {
            return assessment_state;
        }

        public void setAssessment_state(String assessment_state) {
            this.assessment_state = assessment_state;
        }

        public String getGoods_price() {
            return goods_price;
        }

        public void setGoods_price(String goods_price) {
            this.goods_price = goods_price;
        }

        public String getDeduct_integral_value() {
            return deduct_integral_value;
        }

        public void setDeduct_integral_value(String deduct_integral_value) {
            this.deduct_integral_value = deduct_integral_value;
        }

        public String getDeduct_integral_price() {
            return deduct_integral_price;
        }

        public void setDeduct_integral_price(String deduct_integral_price) {
            this.deduct_integral_price = deduct_integral_price;
        }

        public String getIs_express() {
            return is_express;
        }

        public void setIs_express(String is_express) {
            this.is_express = is_express;
        }

        public String getExpress_price() {
            return express_price;
        }

        public void setExpress_price(String express_price) {
            this.express_price = express_price;
        }

        public String getIs_give_integral() {
            return is_give_integral;
        }

        public void setIs_give_integral(String is_give_integral) {
            this.is_give_integral = is_give_integral;
        }

        public String getGive_integral_value() {
            return give_integral_value;
        }

        public void setGive_integral_value(String give_integral_value) {
            this.give_integral_value = give_integral_value;
        }

        public String getGoods_name() {
            return goods_name;
        }

        public void setGoods_name(String goods_name) {
            this.goods_name = goods_name;
        }

        public String getGoods_img() {
            return goods_img;
        }

        public void setGoods_img(String goods_img) {
            this.goods_img = goods_img;
        }

        public String getMerchants_id() {
            return merchants_id;
        }

        public void setMerchants_id(String merchants_id) {
            this.merchants_id = merchants_id;
        }

        public String getGoods_url() {
            return goods_url;
        }

        public void setGoods_url(String goods_url) {
            this.goods_url = goods_url;
        }

        public String getGoods_address() {
            return goods_address;
        }

        public void setGoods_address(String goods_address) {
            this.goods_address = goods_address;
        }

        public String getGroup_buy_price() {
            return group_buy_price;
        }

        public void setGroup_buy_price(String group_buy_price) {
            this.group_buy_price = group_buy_price;
        }

        public String getPromotion_price() {
            return promotion_price;
        }

        public void setPromotion_price(String promotion_price) {
            this.promotion_price = promotion_price;
        }

        public String getPromotion_goods_id() {
            return promotion_goods_id;
        }

        public void setPromotion_goods_id(String promotion_goods_id) {
            this.promotion_goods_id = promotion_goods_id;
        }

        public String getPromotion_id() {
            return promotion_id;
        }

        public void setPromotion_id(String promotion_id) {
            this.promotion_id = promotion_id;
        }

        public String getIs_pre_sale() {
            return is_pre_sale;
        }

        public void setIs_pre_sale(String is_pre_sale) {
            this.is_pre_sale = is_pre_sale;
        }

        public String getSend_goods_time() {
            return send_goods_time;
        }

        public void setSend_goods_time(String send_goods_time) {
            this.send_goods_time = send_goods_time;
        }

        public String getRefund_state() {
            return refund_state;
        }

        public void setRefund_state(String refund_state) {
            this.refund_state = refund_state;
        }

        public List<GoodsImgBeansBean> getGoodsImgBeans() {
            return goodsImgBeans;
        }

        public void setGoodsImgBeans(List<GoodsImgBeansBean> goodsImgBeans) {
            this.goodsImgBeans = goodsImgBeans;
        }

        public List<?> getOrderParameterBeans() {
            return orderParameterBeans;
        }

        public void setOrderParameterBeans(List<?> orderParameterBeans) {
            this.orderParameterBeans = orderParameterBeans;
        }

        public List<?> getOrderServiceBeans() {
            return orderServiceBeans;
        }

        public void setOrderServiceBeans(List<?> orderServiceBeans) {
            this.orderServiceBeans = orderServiceBeans;
        }

        public static class GoodsBeanBean {
        }

        public static class GoodsImgBeansBean {
            /**
             * goods_img_id : 637
             * goods_id : 279
             * goods_img : /images/goods//1474942033502.jpg
             * sort : 1
             */

            private String goods_img_id;
            private String goods_id;
            private String goods_img;
            private String sort;

            public String getGoods_img_id() {
                return goods_img_id;
            }

            public void setGoods_img_id(String goods_img_id) {
                this.goods_img_id = goods_img_id;
            }

            public String getGoods_id() {
                return goods_id;
            }

            public void setGoods_id(String goods_id) {
                this.goods_id = goods_id;
            }

            public String getGoods_img() {
                return goods_img;
            }

            public void setGoods_img(String goods_img) {
                this.goods_img = goods_img;
            }

            public String getSort() {
                return sort;
            }

            public void setSort(String sort) {
                this.sort = sort;
            }
        }
    }
}