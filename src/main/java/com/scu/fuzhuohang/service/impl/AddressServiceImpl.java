package com.scu.fuzhuohang.service.impl;

import com.scu.fuzhuohang.bean.Address;
import com.scu.fuzhuohang.dao.AddressDao;
import com.scu.fuzhuohang.service.AddressService;

import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/8 14:57
 * @Version 1.0
 */
public class AddressServiceImpl implements AddressService {

    private AddressDao addressDao;

    @Override
    public List<Address> getAddresses(int uid) {
        return addressDao.getAddresses(uid);
    }

    @Override
    public int addAddress(Address address) {
        return addressDao.addAddress(address);
    }

    @Override
    public int editAddress(int addrid, Address address) {
        return addressDao.updateAddress(addrid,address);
    }

    @Override
    public int deleteAddressByAddr(int addrid) {
        return addressDao.deleteAddressByAddr(addrid);
    }

    @Override
    public int deleteAddressByUser(int uid) {
        return addressDao.deleteAddressByUser(uid);
    }
}
