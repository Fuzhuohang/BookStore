package com.scu.fuzhuohang.service;

import com.scu.fuzhuohang.bean.Comment;
import com.scu.fuzhuohang.bean.mergebean.CommentUser;

import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/12 16:01
 * @Version 1.0
 */
public interface CommentService {

    public List<Comment> getCommentsByUser( int userId);

    public List<Comment> getCommentsByProduct( int productId);

    public List<CommentUser> getCommentUser(int productId);

    public int addComment(Comment comment);

    public int getCount(int productId);
}
