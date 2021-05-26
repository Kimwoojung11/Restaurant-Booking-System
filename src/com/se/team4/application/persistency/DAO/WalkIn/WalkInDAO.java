package com.se.team4.application.persistency.DAO.WalkIn;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.se.team4.application.persistency.DAO.Reservation.ReservationDAO;
import com.se.team4.application.persistency.DTO.Reservation.ReservationRequestDTO;
import com.se.team4.application.persistency.DTO.WalkIn.WalkInDTO;
import com.se.team4.common.sql.Config;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

public class WalkInDAO {
    public static WalkInDAO it;

    public static WalkInDAO getInstance() { //인스턴스 생성
        if (it == null)
            it = new WalkInDAO();
        return it;
    }
    public String addWalkInRequest(String data) {    //고객 예약 요청 리스트 추가
        String arr[] = data.split("-/-/-");
        String date = arr[0];
        String time = arr[1];
        String covers = arr[2];
        String table = arr[3];
        Random random = new Random();
        int verifyCode=random.nextInt(100000000);
        Connection conn = Config.getInstance().sqlLogin();
        List<Map<String, Object>> list = null;
        try{
            QueryRunner que = new QueryRunner();
            que.query(conn,"INSERT WalkIn SET covers=?, date=?, time=?, table_id=?, verifyCode=?;",new MapListHandler(),
                    covers,date,time,table, verifyCode );
//            System.out.println("ddd");
            list = que.query(conn, "SELECT * FROM WalkIn WHERE verifyCode=?", new MapListHandler(), verifyCode);
//            System.out.println(list);
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{

            DbUtils.closeQuietly(conn);
        }
        ArrayList<ReservationRequestDTO> result = null;
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<WalkInDTO>>() {}.getType());

//        System.out.println(result.get(0).getOid());
        return result.get(0).getOid();
    }
}