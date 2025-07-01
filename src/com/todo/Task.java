package com.todo;

public class Task {
    private String description;
    private boolean completed;
    private String dueDate;

    public Task(String description, String dueDate) {
        this.description = description;
        this.dueDate = dueDate;
        this.completed = false;
    }

    public String getDescription() {
        return description;
    }

    public boolean isCompleted() {
        return completed;
    }

    public String getDueDate() {
        return dueDate;
    }

    public void setCompleted(boolean completed) {
        this.completed = completed;
    }

    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }
}
