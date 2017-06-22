# Cucumber

Nota: se da por hecho de que tiene instalado el jdk de java, intelliJ y [maven](https://github.com/Dauzy/S1---Viaje-a-Jupyter/tree/daniel/maven-install).

1. Iniciar un proyecto en maven:
  Podemos hacer de dos manera, desde linea de comandos o en IntelliJ.

  * Linea de comandos:
  ```
  mvn -B archetype:generate \
  -DarchetypeGroupId=org.apache.maven.archetypes \
  -DgroupId=com.miapp.app \
  -DartifactId=miapp
  ```
  * Abrimos IntelliJ, creamos un proyecto de maven, damos clic en el check de "Create from archetype" y seleccionamos el de "maven.archetype.quickstart", damos en siguiente, llenamos el groupID y archetypeID, y damos en siguiente, siguiente, nombre del proyecto y finalizamos.

  * Borramos App.java y AppTest.java

  * Agregamos las siguientes dependencias a nuestro proyecto,
    de esta manera cucumber se integrara a nuestro proyecto

    ```xml
    <dependencies>
        <dependency>
          <groupId>info.cukes</groupId>
          <artifactId>cucumber-java</artifactId>
          <version>1.2.5</version>
          <scope>test</scope>
        </dependency>
        <dependency>
          <groupId>info.cukes</groupId>
          <artifactId>cucumber-junit</artifactId>
          <version>1.2.5</version>
          <scope>test</scope>
        </dependency>
        <dependency>
          <groupId>junit</groupId>
          <artifactId>junit</artifactId>
          <version>3.8.1</version>
          <scope>test</scope>
        </dependency>
        <dependency>
          <groupId>info.cukes</groupId>
          <artifactId>cucumber-testng</artifactId>
          <version>1.2.5</version>
          <scope>test</scope>
        </dependency>
        <dependency>
          <groupId>junit</groupId>
          <artifactId>junit</artifactId>
          <version>4.12</version>
        </dependency>
  </dependencies>
    ```

  * Crearemos una clase ```Calculadora.java``` dentro de ```src/main/com.miapp.app```
  ```java
  package com.miapp.app;

    public class Calculadora{
        public int suma(int a, int b){
            return a + b;
        }
    }
  ```

  * Creamos nuestro test ```RunCukesTest.java``` en ```src/test/java/com.miapp.app/runner```
  ```java
  package com.miapp.app.runner;

    import cucumber.api.CucumberOptions;
    import cucumber.api.junit.Cucumber;
    import org.junit.runner.RunWith;

    @RunWith(Cucumber.class)
    @CucumberOptions(
            format = {"pretty", "html:target/cucumber"},
            glue = "com.miapp.app.steps",
            features = "classpath:calculadora.feature"
            )
    public class RunCukesTest {
    }
  ```
  * Creamos nuestro bdd ```Calculadora.features``` en ```src/test/resources```

    ```feature
    Feature: Calculadora
    quiero que un usuario sume dos numeros
    y evaluar conocimientos sobre la herramientas

    Scenario: Se sumaran dos valores
      Given Calculadora inicializada
      When Se suman los valores 20 y 30
      Then El resultado es 50
    ```

  * Creamos nuestros pasos a cumplir ```CalculadoraStep.java``` en ```src/test/java/com.miapp.app/steps```
  ```java
  package com.miapp.app.steps;

    import org.junit.Assert;
    import com.miapp.app.Calculadora;
    import cucumber.api.java.en.Given;
    import cucumber.api.java.en.Then;
    import cucumber.api.java.en.When;

    public class CalculadoraStep {

        private Calculadora calculadora = null;
        private int resultado;

        @Given("^Calculadora inicializada$")
        public void inicializaCalculadora() throws Throwable {
            calculadora = new Calculadora();
        }

        @When("^Se suman los valores (\\d+) y (\\d+)$")
        public void sumaValores(int a, int b) throws Throwable {
            resultado = calculadora.suma(a,b);
        }

        @Then("^El resultado es (\\d+)$")
        public void elResultadoEs(int esperando) throws Throwable {
            Assert.assertEquals(esperando,resultado);
        }

    }
  ```

  * Ejecutamos el Test en InteliJ o  bien con ```mvn test``` y nos devuelve lo siguiente:

  ```cmd
    Feature: Calculadora
      quiero que un usuario sume dos numeros
      y evaluar conocimientos sobre la herramientas
      
    Scenario: Se sumaran dos valores    #calculadora.feature:5
      #CalculadoraStep.inicializaCalculadora()
      Given Calculadora inicializada  
      #CalculadoraStep.sumaValores(int,int)
      When Se suman los valores 20 y 30
      #CalculadoraStep.elResultadoEs(int)
      Then El resultado es 50           

    1 Scenarios (1 passed)
    3 Steps (3 passed)
    0m2.936s

    Process finished with exit code 0
  ```
