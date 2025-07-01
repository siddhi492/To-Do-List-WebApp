<%@ page import="com.todo.Task" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    @SuppressWarnings("unchecked")
    List<Task> taskList = (List<Task>) request.getAttribute("tasks");
%>
<html>
<head>
    <title>To-Do List</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>
    <div class="container">
        <h1><i class="fas fa-list-check"></i> To-Do List</h1>

        <form action="tasks" method="post" class="task-form">
            <input type="text" name="task" placeholder="Enter a task" required />
            <input type="date" name="dueDate" required />
            <input type="hidden" name="action" value="add" />
            <button type="submit"><i class="fas fa-plus"></i> Add Task</button>
        </form>

        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Task and Due Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (taskList != null && !taskList.isEmpty()) {
                        for (int i = 0; i < taskList.size(); i++) {
                            Task t = taskList.get(i);
                %>
                    <tr class="<%= t.isCompleted() ? "completed" : "" %>">
                        <td><%= i + 1 %></td>
                        <td>
                            <%= t.isCompleted() ? "<strike>" + t.getDescription() + "</strike>" : t.getDescription() %><br/>
                            <small><i class="fas fa-calendar-alt"></i> Due: <%= t.getDueDate() %></small>
                        </td>
                        <td>
                            <%= t.isCompleted() ? "<span class='status done'>Done</span>" : "<span class='status pending'>Pending</span>" %>
                        </td>
                        <td>
                            <form action="tasks" method="post" class="inline">
                                <input type="hidden" name="index" value="<%= i %>" />
                                <input type="hidden" name="action" value="complete" />
                                <button title="Mark Complete"><i class="fas fa-check-circle"></i></button>
                            </form>
                            <form action="tasks" method="post" class="inline">
                                <input type="hidden" name="index" value="<%= i %>" />
                                <input type="hidden" name="action" value="delete" />
                                <button title="Delete"><i class="fas fa-trash-alt"></i></button>
                            </form>
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="4" style="text-align:center;">No tasks added yet.</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
