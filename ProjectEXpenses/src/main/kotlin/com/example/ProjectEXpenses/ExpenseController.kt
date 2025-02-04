package com.example.ProjectEXpenses

import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import java.time.LocalDate

data class PessoaInfo(
    val id: Int = 0,
    val nome: String,
    val historico: String,
    val preco: Double
)
data class DespesaInfo(
    val id: Int = 0,
    val id_pessoa: Int,
    val nome_tag: String
)
@CrossOrigin
@RestController
class Controller(val despesaRepository: DespesaRepository,
                 val pessoaRepository: PessoaRepository) {
    @PostMapping("/person")
    fun savePessoa(@RequestBody pessoaInfo: PessoaInfo): ResponseEntity<Any> {
        return try {
            val pessoa = Pessoa(
                nome = pessoaInfo.nome,
                historico = pessoaInfo.historico,
                preco = pessoaInfo.preco
            )
            val savedPessoa = pessoaRepository.save(pessoa)
            ResponseEntity.ok(mapOf("message" to "Pessoa salva com sucesso", "pessoa" to savedPessoa))
        } catch (e: Exception) {
            ResponseEntity.badRequest().body(mapOf("message" to "Erro ao salvar pessoa", "error" to e.message))
        }
    }

    @PostMapping("/expense")
    fun saveDespesa(@RequestBody despesaInfo: DespesaInfo): ResponseEntity<Any> {
        return try {
            val despesa = Despesa(
                id = despesaInfo.id,
                id_pessoa = despesaInfo.id_pessoa,
                nome_tag = despesaInfo.nome_tag
            )

            val savedDespesa = despesaRepository.save(despesa)
            ResponseEntity.ok(mapOf("message" to "Despesa salva com sucesso", "despesa" to savedDespesa))
        } catch (e: Exception) {
            ResponseEntity.badRequest().body(mapOf("message" to "Erro ao salvar despesa", "error" to e.message))
        }
    }

    @GetMapping("/persons")
    fun getAllPessoas(): List<Pessoa> {
        return pessoaRepository.findAll()
    }

    @GetMapping("/expenses")
    fun getAllDespesas(): List<Despesa> {
        return despesaRepository.findAll()
    }
}