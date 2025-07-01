package com.todo;

import java.io.IOException;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/tasks")
public class TaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final List<Task> tasks = new ArrayList<>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String desc = request.getParameter("task");
            String dueDate = request.getParameter("dueDate");
            if (desc != null && !desc.trim().isEmpty()) {
                tasks.add(new Task(desc.trim(), dueDate));
            }
        } else if ("complete".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            tasks.get(index).setCompleted(true);
        } else if ("delete".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            tasks.remove(index);
        }

        request.setAttribute("tasks", tasks);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("tasks", tasks);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
