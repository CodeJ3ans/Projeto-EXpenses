document.getElementById('salvarButton').addEventListener('click', async function() {
    const nome = document.getElementById('nome').value;
    const historico = document.getElementById('historico').value;
    const valor = parseFloat(document.getElementById('valor').value);

    if (nome && historico && !isNaN(valor)) {
        const pessoa = {
            nome: nome,
            historico: historico,
            preco: valor
        };

        try {
            const response = await fetch('http://localhost:8080/person', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(pessoa)
            });

            const data = await response.json();

            if (response.ok) {
                alert(data.message);
                loadPessoas();
            } else {
                alert(data.message);
            }
        } catch (error) {
            alert('Erro ao salvar pessoa.');
        }
    } else {
        alert('Preencha todos os campos corretamente.');
    }
});

async function loadPessoas() {
    try {
        const response = await fetch('http://localhost:8080/persons');
        const pessoas = await response.json();

        const tabela = document.getElementById('despesasTabela').getElementsByTagName('tbody')[0];
        tabela.innerHTML = '';

        somaT = 0;
        pessoas.forEach(pessoa => {
            const novaLinha = tabela.insertRow();

            const celulaNome = novaLinha.insertCell(0);
            const celulaHistorico = novaLinha.insertCell(1);
            const celulaValor = novaLinha.insertCell(2);

            celulaNome.textContent = pessoa.nome;
            celulaHistorico.textContent = pessoa.historico;
            celulaValor.textContent = `R$ ${pessoa.preco.toFixed(2)}`;

            somaTotal(parseFloat(pessoa.preco.toFixed(2)));
        });
    } catch (error) {
        alert('Erro ao carregar as pessoas.');
    }
}

var somaT = 0;
function somaTotal(value) {
    somaT += value;

    document.getElementById("blocoValor").value = `R$ ${somaT}`;
}

window.onload = loadPessoas;
