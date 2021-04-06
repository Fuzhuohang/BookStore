package com.scu.fuzhuohang.dao;

import com.scu.fuzhuohang.bean.Address;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/6 11:38
 * @Version 1.0
 */
public interface AddressDao {
    public List<Address> getAddresses(@Param("userid") int userId);

    public int addAddress(@Param("addr") Address address);

    public int updateAddress(@Param("addrid") int addrId, @Param("addr") Address address);

    public int deleteAddressByAddr(@Param("addrid") int addrId);

    public int deleteAddressByUser(@Param("userid") int userId);
}
