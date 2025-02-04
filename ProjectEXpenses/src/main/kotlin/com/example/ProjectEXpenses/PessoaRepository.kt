package com.example.ProjectEXpenses

import jakarta.persistence.*
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import java.time.LocalDate

@Entity
@Table(name = "pessoa")
data class Pessoa (
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id val id: Int = 0,
    @Column(nullable = false)
    val nome: String = "",
    @Column(nullable = false)
    val historico: String = "",
    @Column(nullable = false)
    val preco: Double = 0.0
)
interface PessoaRepository: JpaRepository<Pessoa, Int> {
    @Query(value = "select * from pessoa where id = :id", nativeQuery = true)
    fun getAllPeopleById(@Param("id") id: Int): List<Pessoa>
}