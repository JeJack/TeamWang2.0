<%@ page language="java" import="java.util.*,com.jspsmart.upload.*" pageEncoding="utf-8"%>
<%@ page import="com.dao.UsersDao" %>
<%@ page import="com.entity.Users" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    System.out.println(path);
    System.out.println(request.getScheme());
    System.out.println(request.getServerName());
    System.out.println(request.getServerPort());
    String id= "";
//    if(request.getSession().getAttribute("id")!=null){
//        id= request.getSession().getAttribute("id").toString();
//    }
//    if(id=="" || id==null){response.sendRedirect("login.jsp?error=a");}
//    else{
    //System.out.println(id+" shud");
    String info =request.getParameter("info");
//        UsersDao userDao = new UsersDao();
//        Users user = userDao.getUser(id);
    //建立上传对象
    SmartUpload su = new SmartUpload();
    //初始化SmartUpload对象
    su.initialize(pageContext);
    com.jspsmart.upload.File file = null;
    //允许上传类型
    String allowed = "jpg,png";
    //String allowed = "gif,jpg,doc,rar,txt,mp4";
    //不许上传类型
    //String denied = "jsp,asp,php,aspx,html,htm,exe,bat";

    //设置上传文件大小
//        int file_size = 2*1024*1024;
    String exceptionMsg = null;
    int i = 0;
    String filepath = null;
    try {
        //定义允许上传文件类型
        su.setAllowedFilesList(allowed);
        //不允许上传文件类型
        //su.setDeniedFilesList(denied);
        //单个文件最大限制
//            su.setMaxFileSize(file_size);
        su.setCharset("utf-8");
        //执行上传
        su.upload();
        //得到单个上传文件的信息
        for (int ifi=0;su.getFiles().getSize()>ifi;ifi++){
            file = su.getFiles().getFile(ifi);
            if(!file.isMissing()){
                //设置文件在服务器的保存位置
//                    filepath = "./upload/";
                Random random = new Random(System.currentTimeMillis());
                int iRandom = random.nextInt(100)+1;
                String Str = iRandom + "jee.jpg";
                filepath = file.getFileName()+Str;
                System.out.println(filepath);
                //文件另存为
                file.setCharset("utf-8");

                System.out.println(filepath);

//                    file.saveAs(filepath, SmartUpload.SAVE_VIRTUAL);
                // 将文件另存
// file.saveAs("/upload/" + myFile.getFileName());
// 另存到以WEB应用程序的根目录为文件根目录的目录下
// file.saveAs("/upload/" + myFile.getFileName(),su.SAVE_VIRTUAL);
// 另存到操作系统的根目录为文件根目录的目录下
//                    file.saveAs("e:\\Images\\" + file.getFileName(),su.SAVE_PHYSICAL);
               if (session.getAttribute("UserId")!=null){
                    file.saveAs("e:\\Images\\images\\userPhoto\\" + filepath,su.SAVE_PHYSICAL);
                    UsersDao usersDao = new UsersDao();
                    Users users = usersDao.getUsersById(session.getAttribute("UserId").hashCode());
                    users.setUserPhoto("http://localhost:8080/Images/images/userPhoto/"+filepath);
                    if (usersDao.createUserPhotoSql(users)){
                        response.sendRedirect("../userCenter/userInfo.jsp");
                        return;
                    }else{
                    session.setAttribute("Info","上传失败，请重试");
                    response.sendRedirect("../userCenter/modifyUserPhoto.jsp");
//                    request.getRequestDispatcher("modifyUserPhoto.jsp").forward(request,response);
                    }
                }

            }
        }
    } catch (Exception e) {
        exceptionMsg = e.getMessage();
        e.printStackTrace();
    }

%>