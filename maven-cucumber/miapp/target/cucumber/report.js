$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("calculadora.feature");
formatter.feature({
  "line": 1,
  "name": "Calculadora",
  "description": "  quiero que un usuario sume dos numeros\n  y evaluar conocimientos sobre la herramientas",
  "id": "calculadora",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Se sumaran dos valores",
  "description": "",
  "id": "calculadora;se-sumaran-dos-valores",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Calculadora inicializada",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Se suman los valores 20 y 30",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "El resultado es 50",
  "keyword": "Then "
});
formatter.match({
  "location": "CalculadoraStep.inicializaCalculadora()"
});
formatter.result({
  "duration": 488284659,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "20",
      "offset": 21
    },
    {
      "val": "30",
      "offset": 26
    }
  ],
  "location": "CalculadoraStep.sumaValores(int,int)"
});
formatter.result({
  "duration": 3350749,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "50",
      "offset": 16
    }
  ],
  "location": "CalculadoraStep.elResultadoEs(int)"
});
formatter.result({
  "duration": 3171677,
  "status": "passed"
});
});