package web.servlet.file;

import domain.Admin;
import domain.FileClass;
import domain.Student;
import domain.Teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/fileListServlet")
public class FileListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        File dir = new File(this.getServletContext().getRealPath("upload"));
        File[] arrs = dir.listFiles();
        List<FileClass> fileLists = new ArrayList<FileClass>();
        for(File f:arrs){
            long l = f.length();
            String fileSize = getPrintSize(l);
            FileClass file = new FileClass();
            file.setFileName(f.getName());
            file.setFilePath(f.getAbsolutePath());
            file.setFileSize(fileSize);
            fileLists.add(file);
        }
        request.setAttribute("fileLists",fileLists);

        HttpSession session = request.getSession();
        Student student= (Student)session.getAttribute("student");

        Admin admin= (Admin)session.getAttribute("admin");
        Teacher teacher= (Teacher)session.getAttribute("teacher");
        if (student != null && admin == null && teacher == null) {
            request.getRequestDispatcher("/WEB-INF/student/sFindFileList.jsp").forward(request, response);
        } else if (admin != null && student == null && teacher == null) {
            request.getRequestDispatcher("/WEB-INF/admin/aFindFileList.jsp").forward(request, response);
        } else if (teacher != null && admin == null && student == null) {
            request.getRequestDispatcher("/WEB-INF/teacher/tFindFileList.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public static String getPrintSize(long size) {
        // ?????????????????????1024???????????????B???????????????????????????1024??????3?????????????????????
        double value = (double) size;
        if (value < 1024) {
            return String.valueOf(value) + "B";
        } else {
            value = new BigDecimal(value / 1024).setScale(2, BigDecimal.ROUND_DOWN).doubleValue();
        }
        // ????????????????????????1024???????????????1024?????????????????????KB????????????
        // ??????????????????????????????????????????????????????
        // ?????????????????????
        if (value < 1024) {
            return String.valueOf(value) + "KB";
        } else {
            value = new BigDecimal(value / 1024).setScale(2, BigDecimal.ROUND_DOWN).doubleValue();
        }
        if (value < 1024) {
            return String.valueOf(value) + "MB";
        } else {
            // ??????????????????GB????????????????????????1024?????????????????????
            value = new BigDecimal(value / 1024).setScale(2, BigDecimal.ROUND_DOWN).doubleValue();
            return String.valueOf(value) + "GB";
        }
    }
}
