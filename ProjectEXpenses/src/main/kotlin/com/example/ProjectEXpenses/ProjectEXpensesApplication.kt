package com.example.ProjectEXpenses

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.web.bind.annotation.CrossOrigin

@CrossOrigin
@SpringBootApplication
class ProjectEXpensesApplication

fun main(args: Array<String>) {
	runApplication<ProjectEXpensesApplication>(*args)
}
