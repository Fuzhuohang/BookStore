package com.scu.fuzhuohang.service;

import com.scu.fuzhuohang.bean.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/12 16:01
 * @Version 1.0
 */
public interface CommentService {

    public List<Comment> getCommentsByUser( int userId);

    public List<Comment> getCommentsByProduct( int productId);

    public int addComment(Comment comment);
}
