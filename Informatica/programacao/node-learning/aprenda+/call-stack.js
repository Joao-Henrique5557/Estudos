function multiply(x, y) {
  return x * y;
}
function printSquare(x) {
  var s = multiply(x, x);
  console.log(s);
}
printSquare(5);

// A função printSquare é chamada e adicionada ao topo da Call Stack.
// Dentro da função printSquare, a função multiply é chamada para multiplicar os valores dos parâmetros x e y.
// A função multiply é então adicionada ao topo da Call Stack.
// Após a execução de multiply, ela é removida da Call Stack, e o controle retorna ao ponto em printSquare logo após a chamada de multiply.
// Em seguida, o método console.log é chamado dentro de printSquare.
// O console.log é adicionado ao topo da Call Stack.
// Assim que console.log finaliza sua execução, ele é removido da Call Stack, deixando apenas printSquare.
// Finalmente, printSquare completa sua execução e é removida da Call Stack, deixando-a novamente vazia.
