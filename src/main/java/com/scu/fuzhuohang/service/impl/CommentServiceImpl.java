package com.scu.fuzhuohang.service.impl;

import com.scu.fuzhuohang.bean.Comment;
import com.scu.fuzhuohang.bean.mergebean.CommentUser;
import com.scu.fuzhuohang.dao.CommentDao;
import com.scu.fuzhuohang.service.CommentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/12 16:02
 * @Version 1.0
 */
@Service
@Transactional
public class CommentServiceImpl implements CommentService {

    @Autowired
    CommentDao commentDao;

    @Override
    public List<Comment> getCommentsByUser(int userId) {
        return commentDao.getCommentsByUser(userId);
    }

    @Override
    public List<Comment> getCommentsByProduct(int productId) {
        return commentDao.getCommentsByProduct(productId);
    }

    @Override
    public List<CommentUser> getCommentUser(int productId){
        return commentDao.getCommentUser(productId);
    }

    @Override
    public List<CommentUser> getCommentProduct(int userId){
        return commentDao.getCommentProduct(userId);
    }

    @Override
    public int addComment(Comment comment) {
        return commentDao.addComment(comment);
    }

    @Override
    public int getCount(int productId){
        return commentDao.getCount(productId);
    }
}
