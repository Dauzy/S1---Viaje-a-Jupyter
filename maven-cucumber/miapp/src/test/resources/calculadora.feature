Feature: Calculadora
    quiero que un usuario sume dos numeros
    y evaluar conocimientos sobre la herramientas

    Scenario: Se sumaran dos valores
      Given Calculadora inicializada
      When Se suman los valores 20 y 30
      Then El resultado es 50