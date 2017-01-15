package com.gobha.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gobha.user.vo.User;

public class UserDao {
	private  Connection connection;
	public UserDao(Connection connection){
		this.connection=connection;
	}
	
	public User login(String account,String password){
		String sql="SELECT user_id,account,password,user_name,create_time FROM sys_user WHERE account=? and password=?";
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=this.connection.prepareStatement(sql);
			ps.setObject(1, account);
			ps.setObject(2, password);
			rs=ps.executeQuery();
			if(rs.next()){
				User user=new User();
				user.setUserId(rs.getInt("user_id"));
				user.setAccount(rs.getString("account"));
				user.setPassword(rs.getString("password"));
				user.setUserName(rs.getString("user_name"));
				user.setCreatTime((Date) rs.getDate("create_time"));
				return user;
			}else{
				return null;
			}
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("登录失败");
		}finally {
			try {
				if(rs!=null){
					rs.close();
				}
				if(ps!=null){
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("尝试关闭资源出错");
			}		
		}
	}
	public List<User> list(){
		List<User> userList = new ArrayList<>();
		String sql = "SELECT user_id,account,password,user_name,create_time FROM sys_user ORDER BY create_time DESC";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = this.connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {				
				User user = new User(); 
				user.setUserId(rs.getInt("user_id"));
				user.setAccount(rs.getString("account"));
				user.setPassword(rs.getString("password"));
				user.setUserName(rs.getString("user_name"));
				user.setCreatTime((Date) rs.getDate("create_time"));
				userList.add(user);
			}
			return userList;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("登录查询失败");
		} finally {
			try {
				if(rs!=null){
					rs.close();
				}
				if(ps!=null){
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("尝试关闭资源出错");
			}	
		}
	}
	public User load(Integer userId){
		String sql = "SELECT user_id,account,password,user_name,create_time FROM sys_user WHERE user_id=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = this.connection.prepareStatement(sql);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			if(rs.next()) {				
				User user = new User(); 
				user.setUserId(rs.getInt("user_id"));
				user.setAccount(rs.getString("account"));
				user.setPassword(rs.getString("password"));
				user.setUserName(rs.getString("user_name"));
				user.setCreatTime((Date) rs.getDate("create_time"));
				return user;
			}else{
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("load方法错误");
		} finally {
			try {
				if(rs!=null){
					rs.close();
				}
				if(ps!=null){
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("尝试关闭资源出错");
			}	
		}
	}
	public void update(Object...objects){
		String sql = "UPDATE sys_user SET user_name=?,create_time=? WHERE user_id=?";
		PreparedStatement ps = null;
		try {
			ps = this.connection.prepareStatement(sql);
			if(objects!=null&&objects.length>0){
				for(int i=0;i<objects.length;i++){
					ps.setObject(i+1, objects[i]);
				}
			}
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("更新数据失败");
		} finally {
			try {
				if(ps!=null){
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("尝试关闭资源出错");
			}	
		}
	}
	public void delete(Integer userId){
		String sql = "DELETE FROM sys_user WHERE user_id=?";
		PreparedStatement ps = null;
		try {
			ps = this.connection.prepareStatement(sql);
			ps.setObject(1,userId);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("删除数据失败");
		} finally {
			try {
				if(ps!=null){
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("尝试关闭资源出错");
			}	
		}
	}
	public void insert(User user){
		String sql = "INSERT INTO sys_user (account,password,user_name,create_time) VALUES (?,?,?,?)";
		PreparedStatement ps = null;
		try {
			ps = this.connection.prepareStatement(sql);
			ps.setObject(1,user.getAccount());
			ps.setObject(2,user.getPassword());
			ps.setObject(3,user.getUserName());
			ps.setObject(4,user.getCreatTime());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("增加用户失败");
		} finally {
			try {
				if(ps!=null){
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("尝试关闭资源出错");
			}	
		}
	}
}

