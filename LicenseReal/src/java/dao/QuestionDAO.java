/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Answer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dto.Question;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author HP Pro
 */
public class QuestionDAO {

    private Connection conn;
    private PreparedStatement ptm;
    private ResultSet rs;

    //Ham lay ngau nhien 30 cau hoi binh thuong va 5 cau hoi liet
    public ArrayList<Question> getRandomQuestionAndAnswer() throws SQLException {
        ArrayList<Question> list = new ArrayList<>();
        try {
            conn = null;
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "SELECT * FROM (SELECT TOP(30) * FROM Question WHERE questionType = 1 ORDER BY RAND()) AS qus\n"
                        + "JOIN Answer AS ans ON ans.questionID = qus.id\n"
                        + "UNION ALL\n"
                        + "SELECT * FROM (SELECT TOP(5) * FROM Question WHERE questionType = 0 ORDER BY RAND()) AS kqus\n"
                        + "JOIN Answer AS kans ON kans.questionID = kqus.id";
                //cau sql lay ngau nhien 30 cau hoi binh thuong + 5 cau hoi liet
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    ArrayList<Answer> answer = new ArrayList<>();
                    answer.add(new Answer(rs.getInt(5), rs.getInt(6), rs.getString(7).trim(), rs.getBoolean(8)));
                    //luu dap an vao entity answer, muc dich la de lay dap an cung luc voi cau hoi cho tien viec truy van
                    list.add(new Question(rs.getInt(1), rs.getString(2), rs.getString(3),
                            rs.getBoolean(4), answer));
                    //luu cau hoi + dap an vao entity question
                }
            }
        } catch (Exception e) {
        }
        return list;
    }

    //Ham dung de kiem tra ket qua lay duoc tu DB
    public static void main(String[] args) {
        try {
            QuestionDAO dao = new QuestionDAO();
            List<Question> list = dao.getTopicID();
            for (Question question : list) {
                System.out.println(question);
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Ham lay bo cau hoi theo ma de
    public ArrayList<Question> getTopic(String topic) throws SQLException {
        ArrayList<Question> list = new ArrayList<>();
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "SELECT tp.topicID AS TopicID, que.id AS QuestionID, que.question_text AS Questions,\n"
                        + "que.image AS Image, que.questiontype AS QuestionType, ans.answer_options AS Options,\n"
                        + "ans.answer AS Answer, ans.isCorrect FROM Question AS que\n"
                        + "JOIN Topic AS tp ON que.id = tp.questionID\n"
                        + "JOIN Answer AS ans ON ans.questionID = que.id\n"
                        + "WHERE tp.topicID = " + topic;
                //Cau sql lay tat ca cac cau hoi va dap an trong ma de duoc yeu cau
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    ArrayList<Answer> answer = new ArrayList<>();
                    answer.add(new Answer(rs.getInt("QuestionID"), rs.getString("Options").trim(), rs.getString("Answer"), rs.getBoolean("isCorrect")));
                    //Gan dap an lay duoc vaof entity Answer
                    list.add(new Question(rs.getInt("QuestionID"), rs.getString("Questions"), rs.getString("Image"),
                    answer, rs.getBoolean("QuestionType"), rs.getInt("TopicID")));
                    //Gan tat ca cau hoi va dap an cua ma de duoc yeu cau vao Entity Question
                }
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    //Ham lay cac topic khong trung nhau trong DB
    public List<Question> getTopicID() throws SQLException{
        List<Question> list = new ArrayList<>();
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "SELECT DISTINCT topicID FROM Topic";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {                    
                    list.add(new Question(rs.getInt("topicID")));
                }
            }
        } catch (Exception e) {
        }
        return list;
    }
}
