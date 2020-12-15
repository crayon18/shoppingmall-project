package db;

import java.sql.PreparedStatement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RentcarDAO {

		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		
		//커넥션 풀을 이용한 데이터 베이스 연결
		public void getCon() {
			
			try {
				Context initctx = new InitialContext();
				Context envctx = (Context) initctx.lookup("java:comp/env");
				DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
				con = ds.getConnection();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//최신순 3대의 자동차를 리턴하는 메소드
		public Vector<CarListBean> getSelectCar(){
			
			//리ㅣ턴타입을 설정
			Vector<CarListBean> v = new Vector();
			
			getCon();
			
			try {
				String sql = "select * from rentcar order by no desc";
				pstmt = con.prepareStatement(sql);
				//쿼리 실행후 결과를 result타입으로 리턴
				rs = pstmt.executeQuery();
				int count = 0;
				while(rs.next()) {
					
					CarListBean bean = new CarListBean();
					bean.setNo(rs.getInt(1));
					bean.setName(rs.getString(2));
					bean.setCategory(rs.getInt(3));
					bean.setPrice(rs.getInt(4));
					bean.setUsepeople(rs.getInt(5));
					bean.setCompany(rs.getString(6));
					bean.setImg(rs.getString(7));
					bean.setInfo(rs.getString(8));
					//백터에 빈 클래스를 저장
					
					v.add(bean);
					count++;
					if(count > 2)break; //반복문 빠저나가셈
				}
				con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return v;
		}
		
		//카테고리별 자동차 리스트를 저장하는 메소드
		public Vector<CarListBean> getCategoryCar(int cate){
			
			Vector<CarListBean> v = new Vector<>();
			//데이터를 저장할 빈클래스 선언
			
			getCon();
			try {
				String sql = "select * from rentcar where category=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, cate);
				rs = pstmt.executeQuery();
				//반복문을 돌면서 데이터를 저장
				while(rs.next()) {
					CarListBean bean = new CarListBean();
					bean.setNo(rs.getInt(1));
					bean.setName(rs.getString(2));
					bean.setCategory(rs.getInt(3));
					bean.setPrice(rs.getInt(4));
					bean.setUsepeople(rs.getInt(5));
					bean.setCompany(rs.getString(6));
					bean.setImg(rs.getString(7));
					bean.setInfo(rs.getString(8));
					//백터에 빈클래스 저장
					v.add(bean);
				}
				con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return v;
		}
		
		//모든 차량을 검색하는 메소드
		public Vector<CarListBean> getAllCar(){
			
			Vector<CarListBean> v = new Vector<>();
			//데이터를 저장할 빈클래스 선언
			
			getCon();
			try {
				String sql = "select * from rentcar";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				//반복문을 돌면서 데이터를 저장
				while(rs.next()) {
					CarListBean bean = new CarListBean();
					bean.setNo(rs.getInt(1));
					bean.setName(rs.getString(2));
					bean.setCategory(rs.getInt(3));
					bean.setPrice(rs.getInt(4));
					bean.setUsepeople(rs.getInt(5));
					bean.setCompany(rs.getString(6));
					bean.setImg(rs.getString(7));
					bean.setInfo(rs.getString(8));
					//백터에 빈클래스 저장
					v.add(bean);
				}
				con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return v;
		}
		
}
