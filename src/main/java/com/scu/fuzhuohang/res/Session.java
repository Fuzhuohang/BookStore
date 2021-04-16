package com.scu.fuzhuohang.res;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/16 11:38
 * @Version 1.0
 */
public class Session {
    private Session() {
    }

    public static final String MESSAGE = "message";

    public static final String CURRENT_USER = "current_user";                                   //当前用户
    public static final String CURRENT_BUSINESS = "current_business";                           //当前商家用户
    public static final String CURRENT_ADDRESSES = "current_addresses";                         //当前用户的全部收货地址
    public static final String CURRENT_CATEGORY = "current_category";                           //全部一级分类列表
    public static final String CURRENT_CATEGORYSECOND = "current_categorysecond";               //全部二级分类列表
    public static final String CURRENT_PRODUCT = "current_product";                             //商城首页展示的全部商品列表
    public static final String CURRENT_CATEGORY_CHOSEN = "current_category_chosen";             //当前选中的一级分类
    public static final String CURRENT_CATEGORY_SECOND = "current_category_second";             //属于当前选择的一级列表的全部二级列表
    public static final String CURRENT_PRODUCT_CHOSEN = "current_product_chosen";               //属于当前选择的一级列表的全部商品
    public static final String CURRENT_CATEGORY_SECOND_CHOSEN = "current_category_second_chosen";   //当前选中的二级分类
    public static final String CURRENT_PRODUCT_SECOND_CHOSEN = "current_product_second_chosen"; //属于当前选择的二级分类的全部商品
    public static final String BUSINESS_PRODUCTS = "business_products";                         //商家查看店铺商品列表
    public static final String PRODUCT_INFO = "product_info";                                   //消费者当前查看的商品信息
    public static final String PRODUCT_BUSINESS = "product_business";                           //消费者当前查看的商品所属店铺信息
    public static final String PRODUCT_COMMENT = "product_comment";                             //消费者当前查看的商品的全部评论
    public static final String PRODUCT_COMMENT_COUNT = "product_commentcount";                  //消费者当前查看的商品的评论数
    public static final String ORDERS_COUNT_USER_STATE = "orders_count_user_state";             //当前用户各状态订单数量
    public static final String ORDERS_LIST_USER_STATE = "orders_list_user_state";               //当前用户各状态订单列表
    public static final String ORDERS_LIST_BUSINESS_STATE = "orders_list_business_state";       //当前商家用户各状态订单列表
    public static final String ORDERS_COUNT_BUSINESS_STATE = "orders_count_business_state";     //当前商家用户各状态订单数量
    public static final String ORDERS_COUNT_USER = "orders_count_user";                         //当前用户全部订单数
    public static final String ORDERS_COUNT_BUSINESS = "orders_count_business";                 //当前商家用户全部订单数
    public static final String COMMENT_ORDERS = "comment_orders";                               //用户当前选中的订单
    public static final String USER_COMMENTS = "user_comments";                                 //用户全部的评论列表
    public static final String PRODUCT_PAID = "product_paid";
}
