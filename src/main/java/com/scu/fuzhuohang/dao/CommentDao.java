package com.scu.fuzhuohang.dao;

import com.scu.fuzhuohang.bean.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/9 17:48
 * @Version 1.0
 */
public interface CommentDao {

    public List<Comment> getCommentsByUser(@Param("uid") int userId);

    public List<Comment> getCommentsByProduct(@Param("pid") int productId);

    public int addComment(@Param("comment") Comment comment);

}
