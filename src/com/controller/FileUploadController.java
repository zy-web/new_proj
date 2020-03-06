package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.alibaba.fastjson.JSON;

@WebServlet("/upload")
public class FileUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 设置相应数据内容MIME类型及编码
		response.setContentType("application/json;charset=utf-8");
		// 设置相应数据容器
		List<String> urls = new ArrayList<>();
		// 获取相应输出流
		PrintWriter out = response.getWriter();
		try {
			//设置文件上传后的存储位置(项目中必须先存在)
			String realPath = getServletContext().getRealPath("/static/file");
			// 为基于磁盘的文件项创建DiskFileItemFactory对象
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 配置存储库（以确保使用安全的临时位置）
			ServletContext servletContext = this.getServletConfig().getServletContext();
			File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
			factory.setRepository(repository);
			// 创建新的文件上载处理程序
			ServletFileUpload upload = new ServletFileUpload(factory);
			//设置保存文件的编码方式，
			upload.setHeaderEncoding("UTF-8");
			// 分析请求
			List<FileItem> items = upload.parseRequest(request);
			// 处理上传的项目
			Iterator<FileItem> iter = items.iterator();
			while (iter.hasNext()) {
			    FileItem item = iter.next();
			    String fileName = item.getName();	// 获取文件名
			    String rand = UUID.randomUUID().toString();// 获取一个UUID值
			    // 上传文件
			    fileName = rand+fileName.substring(fileName.lastIndexOf("."));
			    File uploadedFile = new File(realPath,fileName);
			    item.write(uploadedFile);
			    // 把图片名称添加到urls中
			    urls.add(fileName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 返回JSON数据
		out.write(JSON.toJSONString(urls));
		out.flush();
		out.close();
		return;
	}
}
