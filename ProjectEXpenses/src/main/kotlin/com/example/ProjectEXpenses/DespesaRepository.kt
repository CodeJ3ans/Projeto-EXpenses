package com.example.ProjectEXpenses

import jakarta.persistence.*
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param

@Entity
@Table(name = "despesa")
data class Despesa (
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id val id: Int,
    val id_pessoa: Int,
    val nome_tag: String
)
interface DespesaRepository: JpaRepository<Despesa, Int> {
    @Query(value = "select * from despesa where id_pessoa = :id_pessoa", nativeQuery = true)
    fun getAllExpensesById(@Param("id_pessoa") id_pessoa: Int): List<Despesa>
}