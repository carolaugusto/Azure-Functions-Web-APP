module.exports = async function (context, req) {

    const operacao = (req.query.operacao || (req.body && req.body.operacao));
    const numero1 = (req.query.numero1 || (req.body && req.body.numero1));
    const numero2 = (req.query.numero2 || (req.body && req.body.numero2));
    var responseMessage;
    var resultado;

    // Cria a mensagem para retornar na Requisição
    function criarMensagem(n1, n2, resultado, operacao) {
        return "O resultado da " + operacao + " de " + n1 + " e " + n2 + " é igual a " + resultado;
    }

    // Verifica se os campos são válidos
    function camposValidos() {
        return (operacao != null & numero1 != null & numero2 != null) ? true : false;
    }

    // Cria o retorno da requisição
    function definirRetorno(mensagem, statusRetorno) {
        context.res = { status: statusRetorno, body: mensagem };
    }

    // Realiza os cálculos conforme as operações
    if (camposValidos()) { //CAMPOS VALIDOS        
        switch (operacao) {
            case 'soma':
                resultado = numero1 + numero2;
                responseMessage = criarMensagem(numero1, numero2, resultado, operacao);
                definirRetorno(responseMessage, 200);
                break;
            case 'subtracao':
                resultado = numero1 - numero2;
                responseMessage = criarMensagem(numero1, numero2, resultado, operacao);
                definirRetorno(responseMessage, 200);
                break;
            case 'multiplicacao':
                resultado = numero1 * numero2;
                responseMessage = criarMensagem(numero1, numero2, resultado, operacao);
                definirRetorno(responseMessage, 200);
                break;
            case 'divisao':
                resultado = numero1 / numero2;
                responseMessage = criarMensagem(numero1, numero2, resultado, operacao);
                definirRetorno(responseMessage, 200);
                break;
            default:
                responseMessage = "Por favor, insira uma operação válida, opções: soma, subtracao, multiplicacao e divisao";
                definirRetorno(responseMessage, 400);
        }
    } else { // Existe algum campo inválido
        definirRetorno("Dados inválidos. Verifique as informações inseridas", 400);
    }
}
