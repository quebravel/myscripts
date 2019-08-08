#!/bin/bash


usage(){
    echo "user:
    -c              Cliente.
    -v              Vencimento.
    -d              Valor em dinheiro.
    -h              Chama essa ajuda."
}

while getopts ":c:v:d:h" o; do
    case "${o}" in
        c) cliente=$OPTARG
            ;;
        v) vencimento=$OPTARG
            ;;
        d) valor_dinheiro=$OPTARG
            ;;
        h|?) usage
            ;;
    esac
done

# --- Se vazio ---
if [[ $# -ge 1 ]]
then
   echo ""
else
    usage
fi

# --- Saida ---
if [[ ! -z $cliente && ! -z $vencimento && ! -z $valor_dinheiro ]]
then
echo "*[Aviso Automático]* Bom dia, *${cliente}*. Consta em nosso sistema fatura(s) em aberto do dia *${vencimento}* no valor de *R\$* *${valor_dinheiro}*. Podemos negociar o pagamento aqui no *WhatsApp*! Responda esta mensagem para nós enviamos o(s) boleto(s) atualizado(s). Por favor pague para evitar que o seu boleto entre em protesto. Caso o pagamento tenha sido efetuado, desconsidere esta mensagem."
else
    usage
fi
