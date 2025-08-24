package com.To_Do_List.todolist_api.repository;

import com.To_Do_List.todolist_api.model.Task;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Esta debe ser una INTERFAZ que extiende JpaRepository.
 * Spring creará la implementación automáticamente en tiempo de ejecución.
 */
@Repository
public interface TaskRepository extends JpaRepository<Task, Long> {
    // ¡Correcto! La dejamos vacía.
    // Spring Data JPA nos provee los métodos como save(), findById(), findAll(), etc.
}