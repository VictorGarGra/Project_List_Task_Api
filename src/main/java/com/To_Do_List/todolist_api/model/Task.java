package com.To_Do_List.todolist_api.model;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
@Entity
@Table(name = "tasks")
public class    Task {

    @Id // Marca este campo como la clave primaria (Primary Key)
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Indica que el ID es autoincremental
    private Long id;

    private String description;

    private boolean completed;

    // --- Constructores, Getters y Setters ---

    // Un constructor vacío es requerido por JPA
    public Task() {
    }

    // Getters y Setters para acceder y modificar los campos
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isCompleted() {
        return completed;
    }

    public void setCompleted(boolean completed) {
        this.completed = completed;
    }
}
