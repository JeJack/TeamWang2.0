package com.util;

import com.dao.OwnerTopicCommentDao;
import com.entity.OwnerTopicComment;
import com.entity.Users;
import com.dao.UsersDao;

import java.util.ArrayList;

/**
 * Created by qiuje on 2017/6/19.
 */
public class test {
    public static void main(String[] args) {

        OwnerTopicCommentDao ownerTopicCommentDao = new OwnerTopicCommentDao();
        ArrayList<OwnerTopicComment> ownerTopicComments=ownerTopicCommentDao.getAllOwnerTopicCommentByOwnerTopicId(1);
        System.out.println(ownerTopicComments.get(0).getComment());

//        Users jee = new Users();
//        jee.setUserName("ccc");
//        jee.setUserLoginPassword("cccc");
//        jee.setUserPhoneNum("88888888");
//        String info= usersCreate(jee);
//        System.out.println(info);
    }

}
