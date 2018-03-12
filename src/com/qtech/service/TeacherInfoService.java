package com.qtech.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.qtech.dao.TeacherInfoDao;
import com.qtech.util.Converter;

public class TeacherInfoService {

	private TeacherInfoDao tcrInfoDao;
	public  TeacherInfoService(){
		this.tcrInfoDao = new TeacherInfoDao();
	}
	
	public boolean doSave(Map<String, String[]> map){
		boolean flag = false;
		Map<String,String> params = Converter.convertMap(map);
		System.out.println(params);
		try {
			int row = tcrInfoDao.insert(params);
			if(row > 0){
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return flag;
	}
	
	/*查询所有的教师*/
	public List<Map<String, String>> findAll(){
		List<Map<String,String>> list = null;
		//已删除的不再显示，就表示查询的时候查询a_status=1的数据
		Map<String,String> param = new HashMap<String, String>();
		//添加查询的条件
		param.put("tcr_status","1");
		try {
			list = tcrInfoDao.select(param);
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
		map.put("tcr_status","0");
		try {
			int row = tcrInfoDao.update(map, where);
			if(row>0){
				flag = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	public Map<String,String> findByParam(Map<String,String[]> param){
		Map<String, String> item = null;
		Map<String, String> map = Converter.convertMap(param);
		List<Map<String, String>> list = tcrInfoDao.select(map);
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
	
	public boolean doUpdate(Map<String, String[]> param){
		boolean flag=false;
		Map<String, String> item = Converter.convertMap(param);
	    Map<String,String> where = new HashMap<String, String>();
	    where.put("tcr_id",item.get("tcr_id"));
//	    System.out.println(item.get("tcr_id"));
	    item.remove("tcr_id");
//	    System.out.println(item);
//        System.out.println(where);
	    try {
			int row=tcrInfoDao.update(item, where);
			if(row>0){
				flag=true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		return flag;
	}
}
