package com.qtech.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.qtech.dao.AdminInfoDao;
import com.qtech.util.Converter;
import com.qtech.util.Md5Utils;

public class AdminInfoService {
	private AdminInfoDao adminInfoDao;
	public AdminInfoService(){
		this.adminInfoDao = new AdminInfoDao();
	}

	/*用于保存管理员信息*/
	public boolean doSave(Map<String,String[]> map){
		boolean flag = false;
		//把map进行转换
		Map<String, String> param = Converter.convertMap(map);
	    //获取原始的密码数据
		String pwd=param.get("a_pass");
	    //对密码加密
	    String newPwd=Md5Utils.md5(pwd);
	    //以加密后的密码替换原始的密码
	    param.put("a_pass",newPwd);
		//调用insert方法操作数据库
		try {
			int row = adminInfoDao.insert(param);
			if (row > 0) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return flag;
	}
	
	/*查询所有的管理员*/
	public List<Map<String, String>> findAll(){
		List<Map<String,String>> list = null;
		//已删除的不再显示，就表示查询的时候查询a_status=1的数据
		Map<String,String> param = new HashMap<String, String>();
		//添加查询的条件
		param.put("a_status","1");
		try {
			list = adminInfoDao.select(param);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean doDelete(Map<String,String[]> param){
		boolean flag = false;
		//构建sql语句的条件部分
		Map<String,String> where = Converter.convertMap(param);
		//构建修改的列和其对应的值，把状态列的值由1修改为0
		Map<String, String> map = new HashMap<String, String>();
		map.put("a_status","0");
		try {
			int row = adminInfoDao.update(map, where);
			if(row>0){
				flag = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	/*根据传递的参数获取其对应的一行数据
	 * 本方法用于按照主键查询或查询能返回一行数据的情况
	 * 比如：登录查询 按照学号查询*/
	public Map<String,String> findByParam(Map<String,String[]> param){
		Map<String, String> item = null;
		Map<String, String> map = Converter.convertMap(param);
		List<Map<String, String>> list = adminInfoDao.select(map);
		try {
			if(list.size()>0){
				item = list.get(0);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return item;
	}
	
	public boolean doUpdate(Map<String,String[]> param){
		boolean flag=false;
		Map<String, String> map = Converter.convertMap(param);
		Map<String, String> where = new HashMap<String, String>();
		where.put("a_id",map.get("a_id"));
		//从Map中把主键对应的值删除
		map.remove("a_id");
		try {
			int row=adminInfoDao.update(map, where);
			if(row>0){
				flag=true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	public Map<String, String> checkLogin(Map<String, String[]> map){
		Map<String, String> item = null;
		Map<String, String> param = Converter.convertMap(map);
		String pwd=Md5Utils.md5(param.get("a_pass"));
		param.put("a_pass",pwd);
		try {
			List<Map<String,String>> list = adminInfoDao.select(param);
			if(list.size()>0){
				item = list.get(0);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return item;
	}
}


