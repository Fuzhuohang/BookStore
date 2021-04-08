package com.scu.fuzhuohang.service;

import com.scu.fuzhuohang.bean.Address;

import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/8 14:56
 * @Version 1.0
 */
public interface AddressService {

    public List<Address> getAddresses(int uid);

    public int addAddress(Address address);

    public int editAddress(int addrid, Address address);

    public int deleteAddressByAddr(int addrid);

    public int deleteAddressByUser(int uid);
}
